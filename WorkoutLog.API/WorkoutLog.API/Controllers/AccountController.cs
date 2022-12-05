using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories;

namespace WorkoutLog.API.Controllers
{
    public class AccountController : ControllerBase
    {
        private readonly UserRepository _userRepository;

        public AccountController(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _userRepository.GetAll());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null) return NotFound();

            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(User user)
        {
            await _userRepository.Insert(user);

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, User user)
        {
            var existingUser = await _userRepository.GetById(id);
            if (existingUser == null) return NotFound();

            await _userRepository.Update(user);

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null) return NotFound();

            await _userRepository.Delete(user.Id);

            return Ok();
        }
    }
}
