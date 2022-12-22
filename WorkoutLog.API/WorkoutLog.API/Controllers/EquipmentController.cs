using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("equipment")]
    public class EquipmentController : ControllerBase
    {

        public EquipmentController()
        {
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Equipment equipment)
        {
            return Ok();
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> Update(int id, Equipment equipment)
        {
            return Ok();
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok();
        }
    }
}
