using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Models;

namespace WorkoutLog.API.Controllers
{
    public class WorkoutController : ControllerBase
    {
        public IActionResult GetAll()
        {
            return Ok();
        }

        public IActionResult GetById(int id)
        {
            return Ok();
        }

        public IActionResult Create(Workout workout)
        {
            return Ok();
        }

        public IActionResult Update(int id, Workout workout)
        {
            return Ok();
        }

        public IActionResult Delete(int id)
        {
            return Ok();
        }
    }
}
