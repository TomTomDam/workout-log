using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    public class ExerciseController : ControllerBase
    {
        public IActionResult GetAll()
        {
            return Ok();
        }

        public IActionResult GetById(int id)
        {
            return Ok();
        }

        public IActionResult Create(Exercise exercise)
        {
            return Ok();
        }

        public IActionResult Update(int id, Exercise exercise)
        {
            return Ok();
        }

        public IActionResult Delete(int id)
        {
            return Ok();
        }
    }
}
