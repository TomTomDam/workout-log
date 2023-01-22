﻿using Microsoft.AspNetCore.Authorization;
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
        private ILogger<WorkoutExerciseController> _logger;

        public WorkoutExerciseController(IWorkoutExerciseRepository workoutExerciseRepository, ILogger<WorkoutExerciseController> logger)
        {
            _workoutExerciseRepository = workoutExerciseRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("Retrieved list of WorkoutExercises");
            return Ok(await _workoutExerciseRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null)
            {
                _logger.LogError("Could not retrieve WorkoutExercise by Id {id}", id);
                return NotFound();
            }

            _logger.LogInformation("Retrieved WorkoutExercise of Id {id}", id);
            return Ok(workoutExercise);
        }

        [HttpPost]
        public async Task<IActionResult> Create(WorkoutExercise workoutExercise)
        {
            try
            {
                await _workoutExerciseRepository.Insert(workoutExercise);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create a WorkoutExercise");
                return BadRequest();
            }

            _logger.LogInformation("Created a new WorkoutExercise of Id {id}", workoutExercise.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] WorkoutExercise workoutExercise)
        {
            var existingWorkoutExercise = await _workoutExerciseRepository.GetById(id);
            if (existingWorkoutExercise == null)
            {
                _logger.LogError("Could not retrieve WorkoutExercise by Id {id}", id);
                return NotFound();
            }

            workoutExercise.Id = id;
            var updated = await _workoutExerciseRepository.Update(workoutExercise);
            if (updated)
            {
                _logger.LogInformation("Updated WorkoutExercise of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update WorkoutExercise of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var workoutExercise = await _workoutExerciseRepository.GetById(id);
            if (workoutExercise == null)
            {
                _logger.LogError("Could not retrieve WorkoutExercise by Id {id}", id);
                return NotFound();
            }

            var deleted = await _workoutExerciseRepository.Delete(workoutExercise);
            if (deleted)
            {
                _logger.LogInformation("Deleted WorkoutExercise of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete WorkoutExercise of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
