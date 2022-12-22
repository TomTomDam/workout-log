using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [Route("account")]
    public class AccountController : ControllerBase
    {
        private readonly IUserRepository _userRepository;

        public AccountController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _userRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null) return NotFound();

            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Create(User user)
        {
            await _userRepository.Insert(user);

            return Ok();
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> Update(int id, User user)
        {
            var existingUser = await _userRepository.GetById(id);
            if (existingUser == null) return NotFound();

            var updated = await _userRepository.Update(user);

            return updated ? Ok() : NotFound();
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null) return NotFound();
            
            var deleted = await _userRepository.Delete(user);

            return deleted ? Ok() : NotFound();
        }
    }
}
