using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("workoutExercises")]
    public class WorkoutExerciseController : ControllerBase
    {
        private readonly IWorkoutExerciseRepository _workoutExerciseRepository;
        private ILogger<WorkoutExerciseController> _logger;

        public WorkoutExerciseController(IWorkoutExerciseRepository workoutExerciseRepository, ILogger<WorkoutExerciseController> logger)
        {
            _workoutExerciseRepository = workoutExerciseRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _workoutExerciseRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null) return NotFound();

            return Ok(workoutExercise);
        }

        [HttpPost]
        public async Task<IActionResult> Create(WorkoutExercise workoutExercise)
        {
            await _workoutExerciseRepository.Insert(workoutExercise);

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, WorkoutExercise workoutExercise)
        {
            var existingWorkoutExercise = await _workoutExerciseRepository.GetById(id);
            if (existingWorkoutExercise == null) return NotFound();

            workoutExercise.Id = id;
            var updated = await _workoutExerciseRepository.Update(workoutExercise);

            return updated ? Ok() : NotFound();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null) return NotFound();

            var deleted = await _workoutExerciseRepository.Delete(workoutExercise);

            return deleted ? Ok() : NotFound();
        }
    }
}
