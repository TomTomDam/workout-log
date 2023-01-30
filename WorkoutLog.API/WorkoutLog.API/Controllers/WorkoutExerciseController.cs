using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("workoutExercises")]
    [AllowAnonymous]
    public class WorkoutExerciseController : ControllerBase
    {
        private readonly IWorkoutExerciseRepository _workoutExerciseRepository;

        public WorkoutExerciseController(IWorkoutExerciseRepository workoutExerciseRepository)
        {
            _workoutExerciseRepository = workoutExerciseRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _workoutExerciseRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null)
                return NotFound();

            return Ok(workoutExercise);
        }

        [HttpPost]
        public async Task<IActionResult> Create(WorkoutExercise workoutExercise)
        {
            try
            {
                await _workoutExerciseRepository.Insert(workoutExercise);
            }
            catch
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] WorkoutExercise workoutExercise)
        {
            var existingWorkoutExercise = await _workoutExerciseRepository.GetById(id);
            if (existingWorkoutExercise == null)
                return NotFound();

            workoutExercise.Id = id;
            var updated = await _workoutExerciseRepository.Update(workoutExercise);
            if (updated)
                return NoContent();
            else
                return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null)
                return NotFound();

            var deleted = await _workoutExerciseRepository.Delete(workoutExercise);
            if (deleted)
                return NoContent();
            else
                return BadRequest();
        }
    }
}
