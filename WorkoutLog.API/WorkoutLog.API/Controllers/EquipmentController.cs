using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("equipment")]
    [AllowAnonymous]
    public class EquipmentController : ControllerBase
    {
        private readonly IEquipmentRepository _equipmentRepository;

        public EquipmentController(IEquipmentRepository equipmentRepository)
        {
            _equipmentRepository = equipmentRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _equipmentRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null)
                return NotFound();

            return Ok(equipment);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Equipment equipment)
        {
            try
            {
                await _equipmentRepository.Insert(equipment);
            }
            catch
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Equipment equipment)
        {
            var existingEquipment = await _equipmentRepository.GetById(id);
            if (existingEquipment == null)
                return NotFound();

            equipment.Id = id;
            var updated = await _equipmentRepository.Update(equipment);
            if (updated)
                return NoContent();
            else
                return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null)
                return NotFound();

            var deleted = await _equipmentRepository.Delete(equipment);
            if (deleted)
                return NoContent();
            else
                return BadRequest();
        }
    }
}
