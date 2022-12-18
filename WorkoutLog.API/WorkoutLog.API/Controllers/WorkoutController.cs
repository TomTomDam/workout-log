using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class WorkoutController : ControllerBase
    {
        public WorkoutController()
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
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Workout workout)
        {
            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Workout workout)
        {
            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok();
        }
    }
}
