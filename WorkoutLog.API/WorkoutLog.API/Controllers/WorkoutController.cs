using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class WorkoutController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public WorkoutController(WorkoutLogDBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.Workout.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var workout = await _context.Workout.FindAsync(id);
            if (workout == null) return NotFound();

            return Ok(workout);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Workout workout)
        {
            await _context.Workout.AddAsync(workout);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Workout workout)
        {
            var existingWorkout = await _context.Workout.FindAsync(id);
            if (existingWorkout == null) return NotFound();

            existingWorkout.Name = workout.Name;
            existingWorkout.TotalVolume = workout.TotalVolume;
            existingWorkout.Duration = workout.Duration;
            existingWorkout.DateNextScheduled = workout.DateNextScheduled;
            existingWorkout.IsFavourited = workout.IsFavourited;

            _context.Update(existingWorkout);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var workout = await _context.Workout.FindAsync(id);
            if (workout == null) return NotFound();

            _context.Workout.Remove(workout);
            _context.SaveChanges();

            return Ok();
        }
    }
}
