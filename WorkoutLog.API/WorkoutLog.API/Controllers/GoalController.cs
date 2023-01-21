using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("goals")]
    public class GoalController : ControllerBase
    {
        private readonly IGoalRepository _goalRepository;
        private ILogger<GoalController> _logger;

        public GoalController(IGoalRepository goalRepository, ILogger<GoalController> logger)
        {
            _goalRepository = goalRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("Retrieved list of Goals");
            return Ok(await _goalRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var goal = await _goalRepository.GetById(id);
            if (goal == null)
            {
                _logger.LogError("Could not retrieve Goal by Id {id}", id);
                return NotFound();
            }

            _logger.LogInformation("Retrieved Goal of Id {id}", id);
            return Ok(goal);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Goal goal)
        {
            if (goal == null)
            {
                _logger.LogError("Could not create a Goal");
                return BadRequest();
            }

            try
            {
                await _goalRepository.Insert(goal);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create a Goal");
                return BadRequest();
            }

            _logger.LogInformation("Created a new Goal of Id {id}", goal.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Goal goal)
        {
            if (goal == null)
            {
                _logger.LogError("Could not update a Goal");
                return BadRequest();
            }

            var existingGoal = await _goalRepository.GetById(id);
            if (existingGoal == null)
            {
                _logger.LogError("Could not retrieve Goal by Id {id}", id);
                return NotFound();
            }

            goal.Id = id;
            var updated = await _goalRepository.Update(goal);
            if (updated)
            {
                _logger.LogInformation("Updated Goal of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update Goal of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var goal = await _goalRepository.GetById(id);
            if (goal == null)
            {
                _logger.LogError("Could not retrieve Goal by Id {id}", id);
                return NotFound();
            }

            var deleted = await _goalRepository.Delete(goal);
            if (deleted)
            {
                _logger.LogInformation("Deleted Goal of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete Goal of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
