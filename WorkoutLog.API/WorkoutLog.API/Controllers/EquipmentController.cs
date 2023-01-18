using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    [Route("equipments")]
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
            _logger.LogInformation("Retrieved list of Equipment");
            return Ok(await _equipmentRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null)
            {
                _logger.LogError("Could not retrieve Equipment by Id {id}", id);
                return NotFound();
            }

            return Ok(equipment);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Equipment equipment)
        {
            if (equipment == null)
            {
                _logger.LogError("Could not create an Equipment");
                return BadRequest();
            }

            try
            {
                await _equipmentRepository.Insert(equipment);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Could not create an Equipment");
                return BadRequest();
            }

            _logger.LogInformation("Created a new Equipment of Id {id}", equipment.Id);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Equipment equipment)
        {
            if (equipment == null)
            {
                _logger.LogError("Could not update an Equipment");
                return BadRequest();
            }

            var existingEquipment = await _equipmentRepository.GetById(id);
            if (existingEquipment == null)
            {
                _logger.LogError("Could not retrieve Equipment by Id {id}", id);
                return NotFound();
            }

            equipment.Id = id;
            var updated = await _equipmentRepository.Update(equipment);
            if (updated)
            {
                _logger.LogInformation("Updated Equipment of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not update Equipment of Id {id}", id);
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var equipment = await _equipmentRepository.GetById(id);
            if (equipment == null)
            {
                _logger.LogError("Could not retrieve Equipment by Id {id}", id);
                return BadRequest();
            }

            var deleted = await _equipmentRepository.Delete(equipment);
            if (deleted)
            {
                _logger.LogInformation("Deleted Equipment of Id {id}", id);
                return NoContent();
            }
            else
            {
                _logger.LogError("Could not delete Equipment of Id {id}", id);
                return BadRequest();
            }
        }
    }
}
