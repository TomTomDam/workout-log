using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Models;

namespace WorkoutLog.API.Controllers
{
    public class EquipmentController : ControllerBase
    {
        public IActionResult GetAll()
        {
            return Ok();
        }

        public IActionResult GetById(int id)
        {
            return Ok();
        }

        public IActionResult Create(Equipment equipment)
        {
            return Ok();
        }

        public IActionResult Update(int id, Equipment equipment)
        {
            return Ok();
        }

        public IActionResult Delete(int id)
        {
            return Ok();
        }
    }
}
