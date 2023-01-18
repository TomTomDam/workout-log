﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Repositories.Interfaces;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [Route("users")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        private ILogger<UserController> _logger;

        public UserController(IUserRepository userRepository, ILogger<UserController> logger)
        {
            _userRepository = userRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            _logger.LogInformation("Retrieved list of Users");
            return Ok(await _userRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null)
            {
                _logger.LogError("Could not retrieve User by Id {id}", id);
                return NotFound();
            }

            _logger.LogInformation("Retrieved User of Id {id}", id);
            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Create([FromBody] User user)
        {
            if (user == null)
            {
                _logger.LogError("Could not create a User");
                return BadRequest();
            }

            try
            {
                await _userRepository.Insert(user);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create a User");
                return BadRequest();
            }

            _logger.LogInformation("Created a new User of Id {id}", user.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] User user)
        {
            if (user == null) 
            {
                _logger.LogError("Could not update a User");
                return BadRequest();
            }

            var existingUser = await _userRepository.GetById(id);
            if (existingUser == null)
            {
                _logger.LogError("Could not retrieve User by Id {id}", id);
                return NotFound();
            }

            user.Id = id;
            var updated = await _userRepository.Update(user);
            if (updated)
            {
                _logger.LogInformation("Updated User of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update User of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _userRepository.GetById(id);
            if (user == null)
            {
                _logger.LogError("Could not retrieve User by Id {id}", id);
                return BadRequest();
            }

            var deleted = await _userRepository.Delete(user);
            if (deleted)
            {
                _logger.LogInformation("Deleted User of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete User of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
