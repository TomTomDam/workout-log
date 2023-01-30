using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Repositories.Interfaces;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("users")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
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
            if (user == null)
                return NotFound();

            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Create(User user)
        {
            try
            {
                await _userRepository.Insert(user);
            }
            catch
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] User user)
        {
            var existingUser = await _userRepository.GetById(id);
            if (existingUser == null)
                return NotFound();

            user.Id = id;
            var updated = await _userRepository.Update(user);
            if (updated)
                return NoContent();
            else
                return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null)
                return NotFound();

            var deleted = await _userRepository.Delete(user);
            if (deleted)
                return NoContent();
            else
                return BadRequest();
        }
    }
}
