using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class GoalController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public GoalController(WorkoutLogDBContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.Goal.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var goal = await _context.Goal.FindAsync(id);
            if (goal == null) return NotFound();

            return Ok(goal);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Goal goal)
        {
            await _context.Goal.AddAsync(goal);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Goal goal)
        {
            var existingGoal = await _context.Goal.FindAsync(id);
            if (existingGoal == null) return NotFound();

            existingGoal.CurrentValue = goal.CurrentValue;
            existingGoal.GoalValue = goal.GoalValue;
            existingGoal.Deadline = goal.Deadline;
            existingGoal.GoalType = goal.GoalType;

            _context.Update(existingGoal);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var goal = await _context.Goal.FindAsync(id);
            if (goal == null) return NotFound();

            _context.Goal.Remove(goal);
            _context.SaveChanges();

            return Ok();
        }
    }
}
