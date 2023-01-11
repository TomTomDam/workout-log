using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("workout")]
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
            return Ok(await _workoutRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null) return NotFound();

            return Ok(workout);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Workout workout)
        {
            await _workoutRepository.Insert(workout);

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Workout workout)
        {
            var existingWorkout = await _workoutRepository.GetById(id);
            if (existingWorkout == null) return NotFound();

            workout.Id = id;
            var updated = await _workoutRepository.Update(workout);

            return updated ? Ok() : NotFound();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workout = await _workoutRepository.GetById(id);
            if (workout == null) return NotFound();

            var deleted = await _workoutRepository.Delete(workout);

            return deleted ? Ok() : NotFound();
        }
    }
}
