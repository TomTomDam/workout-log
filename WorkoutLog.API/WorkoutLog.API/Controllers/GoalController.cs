using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("goal")]
    public class GoalController : ControllerBase
    {
        private readonly IGoalRepository _goalRepository;

        public GoalController(IGoalRepository goalRepository)
        {
            _goalRepository = goalRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _goalRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var goal = await _goalRepository.GetById(id);
            if (goal == null) return NotFound();

            return Ok(goal);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Goal goal)
        {
            await _goalRepository.Insert(goal);

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Goal goal)
        {
            var existingGoal = await _goalRepository.GetById(id);
            if (existingGoal == null) return NotFound();

            goal.Id = id;
            var updated = await _goalRepository.Update(goal);

            return updated ? Ok() : NotFound();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var goal = await _goalRepository.GetById(id);
            if (goal == null) return NotFound();

            var deleted = await _goalRepository.Delete(goal);

            return deleted ? Ok() : NotFound();
        }
    }
}
