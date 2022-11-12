using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Models;

namespace WorkoutLog.API.Controllers
{
    public class GoalController : ControllerBase
    {
        public IActionResult GetAll()
        {
            return Ok();
        }

        public IActionResult GetById(int id)
        {
            return Ok();
        }

        public IActionResult Create(Goal goal)
        {
            return Ok();
        }

        public IActionResult Update(int id, Goal goal)
        {
            return Ok();
        }

        public IActionResult Delete(int id)
        {
            return Ok();
        }
    }
}
