using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("workouts")]
    [AllowAnonymous]
    public class WorkoutController : ControllerBase
    {
        private readonly IWorkoutRepository _workoutRepository;

        public WorkoutController(IWorkoutRepository workoutRepository)
        {
            _workoutRepository = workoutRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _workoutRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null)
                return NotFound();

            return Ok(workout);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Workout workout)
        {
            try
            {
                await _workoutRepository.Insert(workout);
            }
            catch
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Workout workout)
        {
            var existingWorkout = await _workoutRepository.GetById(id);
            if (existingWorkout == null)
                return NotFound();

            workout.Id = id;
            var updated = await _workoutRepository.Update(workout);
            if (updated)
                return NoContent();
            else
                return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null)
                return NotFound();

            var deleted = await _workoutRepository.Delete(workout);
            if (deleted)
                return NoContent();
            else
                return BadRequest();
        }
    }
}
