using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class WorkoutExerciseController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public WorkoutExerciseController(WorkoutLogDBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.WorkoutExercise.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var workoutExercise = await _context.WorkoutExercise.FindAsync(id);
            if (workoutExercise == null) return NotFound();

            return Ok(workoutExercise);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(WorkoutExercise workoutExercise)
        {
            await _context.WorkoutExercise.AddAsync(workoutExercise);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, WorkoutExercise workoutExercise)
        {
            var existingWorkoutExercise = await _context.WorkoutExercise.FindAsync(id);
            if (existingWorkoutExercise == null) return NotFound();

            existingWorkoutExercise.Notes = workoutExercise.Notes;
            existingWorkoutExercise.Order = workoutExercise.Order;

            _context.Update(existingWorkoutExercise);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var workoutExercise = await _context.WorkoutExercise.FindAsync(id);
            if (workoutExercise == null) return NotFound();

            _context.WorkoutExercise.Remove(workoutExercise);
            _context.SaveChanges();

            return Ok();
        }
    }
}
