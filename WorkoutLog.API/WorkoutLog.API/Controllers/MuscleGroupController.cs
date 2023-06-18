using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Controllers
{
    [ApiController]
    [Route("muscleGroups")]
    [AllowAnonymous]
    public class MuscleGroupGroupController : ControllerBase
    {
        private readonly IMuscleGroupRepository _muscleGroupRepository;

        public MuscleGroupGroupController(IMuscleGroupRepository muscleGroupRepository)
        {
            _muscleGroupRepository = muscleGroupRepository;
        }

        public async Task<IActionResult> GetAll()
        {
            return Ok(await _muscleGroupRepository.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var muscleGroup = await _muscleGroupRepository.GetById(id);
            if (muscleGroup == null)
                return NotFound();

            return Ok(muscleGroup);
        }

        [HttpPost]
        public async Task<IActionResult> Create(MuscleGroup muscleGroup)
        {
            try
            {
                await _muscleGroupRepository.Insert(muscleGroup);
            }
            catch
            {
                return BadRequest();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] MuscleGroup muscleGroup)
        {
            var existingMuscleGroup = await _muscleGroupRepository.GetById(id);
            if (existingMuscleGroup == null)
                return NotFound();

            muscleGroup.Id = id;
            var updated = await _muscleGroupRepository.Update(muscleGroup);
            if (updated)
                return NoContent();
            else
                return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var muscleGroup = await _muscleGroupRepository.GetById(id);
            if (muscleGroup == null)
                return NotFound();

            var deleted = await _muscleGroupRepository.Delete(muscleGroup);
            if (deleted)
                return NoContent();
            else
                return BadRequest();
        }
    }
}
