using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class ExerciseController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public ExerciseController(WorkoutLogDBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.Exercise.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var exercise = await _context.Exercise.FindAsync(id);
            if (exercise == null) return NotFound();

            return Ok(exercise);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Exercise exercise)
        {
            await _context.Exercise.AddAsync(exercise);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Exercise exercise)
        {
            var existingExercise = await _context.Exercise.FindAsync(id);
            if (existingExercise == null) return NotFound();

            existingExercise.Name = exercise.Name;
            existingExercise.IsCustom = exercise.IsCustom;
            existingExercise.Instructions = exercise.Instructions;

            _context.Update(existingExercise);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var exercise = await _context.Exercise.FindAsync(id);
            if (exercise == null) return NotFound();

            _context.Exercise.Remove(exercise);
            _context.SaveChanges();

            return Ok();
        }
    }
}
