using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    public class AccountController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public AccountController(WorkoutLogDBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.User.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null) return NotFound();

            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(User user)
        {
            await _context.User.AddAsync(user);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, User user)
        {
            var existingUser = await _context.User.FindAsync(id);
            if (existingUser == null) return NotFound();

            existingUser.Name = user.Name;
            existingUser.Age = user.Age;
            existingUser.Bodyweight = user.Bodyweight;
            existingUser.Gender = user.Gender;
            existingUser.TrainingStyles = user.TrainingStyles;

            _context.Update(existingUser);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null) return NotFound();

            _context.User.Remove(user);
            _context.SaveChanges();

            return Ok();
        }
    }
}
