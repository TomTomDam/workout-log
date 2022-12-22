using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class GoalController : ControllerBase
    {
        public GoalController()
        {
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok();
        }

        public async Task<IActionResult> GetById(int id)
        {
            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Goal goal)
        {
            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Update(int id, Goal goal)
        {
            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok();
        }
    }
}
