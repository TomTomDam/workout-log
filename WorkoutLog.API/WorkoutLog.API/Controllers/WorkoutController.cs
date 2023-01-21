using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("workouts")]
    public class WorkoutController : ControllerBase
    {
        private readonly IWorkoutRepository _workoutRepository;
        private ILogger<WorkoutController> _logger;

        public WorkoutController(IWorkoutRepository workoutRepository, ILogger<WorkoutController> logger)
        {
            _workoutRepository = workoutRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("Retrieved list of Workouts");
            return Ok(await _workoutRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null)
            {
                _logger.LogError("Could not retrieve Workout by Id {id}", id);
                return NotFound();
            }

            _logger.LogInformation("Retrieved Workout of Id {id}", id);
            return Ok(workout);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Workout workout)
        {
            if (workout == null)
            {
                _logger.LogError("Could not create a Workout");
                return BadRequest();
            }

            try
            {
                await _workoutRepository.Insert(workout);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create a Workout");
                return BadRequest();
            }

            _logger.LogInformation("Created a new Workout of Id {id}", workout.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Workout workout)
        {
            if (workout == null)
            {
                _logger.LogError("Could not update a Workout");
                return BadRequest();
            }

            var existingWorkout = await _workoutRepository.GetById(id);
            if (existingWorkout == null)
            {
                _logger.LogError("Could not retrieve Workout by Id {id}", id);
                return NotFound();
            }

            workout.Id = id;
            var updated = await _workoutRepository.Update(workout);
            if (updated)
            {
                _logger.LogInformation("Updated Workout of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update Workout of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null)
            {
                _logger.LogError("Could not retrieve Workout by Id {id}", id);
                return NotFound();
            }

            var deleted = await _workoutRepository.Delete(workout);
            if (deleted)
            {
                _logger.LogInformation("Deleted Workout of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete Workout of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
