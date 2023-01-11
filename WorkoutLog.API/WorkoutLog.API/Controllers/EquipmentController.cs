using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("equipment")]
    public class EquipmentController : ControllerBase
    {
        private readonly IEquipmentRepository _equipmentRepository;
        private ILogger<EquipmentController> _logger;

        public EquipmentController(IEquipmentRepository equipmentRepository, ILogger<EquipmentController> logger)
        {
            _equipmentRepository = equipmentRepository;
            _logger = logger;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _equipmentRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null) return NotFound();

            return Ok(equipment);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Equipment equipment)
        {
            await _equipmentRepository.Insert(equipment);

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Equipment equipment)
        {
            var existingEquipment = await _equipmentRepository.GetById(id);
            if (existingEquipment == null) return NotFound();

            equipment.Id = id;
            var updated = await _equipmentRepository.Update(equipment);

            return updated ? Ok() : NotFound();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null) return NotFound();

            var deleted = await _equipmentRepository.Delete(equipment);

            return deleted ? Ok() : NotFound();
        }
    }
}
