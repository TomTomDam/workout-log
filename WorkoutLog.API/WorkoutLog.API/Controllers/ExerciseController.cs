using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("exercises")]
    [AllowAnonymous]
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
            _logger.LogInformation("Retrieved list of Exercises");
            return Ok(await _exerciseRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var exercise = await _exerciseRepository.GetById(id);
            if (exercise == null)
            {
                _logger.LogError("Could not retrieve Exercise by Id {id}", id);
                return NotFound();
            }

            return Ok(exercise);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Exercise exercise)
        {
            try
            {
                await _exerciseRepository.Insert(exercise);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create an Exercise");
                return BadRequest();
            }

            _logger.LogInformation("Created a new Exercise of Id {id}", exercise.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Exercise exercise)
        {
            var existingExercise = await _exerciseRepository.GetById(id);
            if (existingExercise == null)
            {
                _logger.LogError("Could not retrieve Exercise by Id {id}", id);
                return NotFound();
            }

            exercise.Id = id;
            var updated = await _exerciseRepository.Update(exercise);
            if (updated)
            {
                _logger.LogInformation("Updated Exercise of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update Exercise of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var exercise = await _exerciseRepository.GetById(id);
            if (exercise == null)
            {
                _logger.LogError("Could not retrieve Exercise by Id {id}", id);
                return NotFound();
            }

            var deleted = await _exerciseRepository.Delete(exercise);
            if (deleted)
            {
                _logger.LogInformation("Deleted Exercise of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete Exercise of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
