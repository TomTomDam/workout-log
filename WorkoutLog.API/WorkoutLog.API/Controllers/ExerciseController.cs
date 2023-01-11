using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("exercise")]
    public class ExerciseController : ControllerBase
    {
        private readonly IExerciseRepository _exerciseRepository;
        private ILogger<ExerciseController> _logger;

        public ExerciseController(IExerciseRepository exerciseRepository, ILogger<ExerciseController> logger)
        {
            _exerciseRepository = exerciseRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _exerciseRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var exercise = await _exerciseRepository.GetById(id);
            if (exercise == null) return NotFound();

            return Ok(exercise);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Exercise exercise)
        {
            await _exerciseRepository.Insert(exercise);

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Exercise exercise)
        {
            var existingExercise = await _exerciseRepository.GetById(id);
            if (existingExercise == null) return NotFound();

            exercise.Id = id;
            var updated = await _exerciseRepository.Update(exercise);

            return updated ? Ok() : NotFound();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var exercise = await _exerciseRepository.GetById(id);
            if (exercise == null) return NotFound();

            var deleted = await _exerciseRepository.Delete(exercise);

            return deleted ? Ok() : NotFound();
        }
    }
}
