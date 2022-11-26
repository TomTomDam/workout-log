using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    [AllowAnonymous]
    public class EquipmentController : ControllerBase
    {
        private readonly WorkoutLogDBContext _context;

        public EquipmentController(WorkoutLogDBContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.Equipment.ToListAsync());
        }

        public async Task<IActionResult> GetById(int id)
        {
            var equipment = await _context.Equipment.FindAsync(id);
            if (equipment == null) return NotFound();

            return Ok(equipment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Equipment equipment)
        {
            await _context.Equipment.AddAsync(equipment);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Equipment equipment)
        {
            var existingEquipment = await _context.Equipment.FindAsync(id);
            if (existingEquipment == null) return NotFound();

            existingEquipment.Name = equipment.Name;
            existingEquipment.EquipmentType = equipment.EquipmentType;

            _context.Update(existingEquipment);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var equipment = await _context.Equipment.FindAsync(id);
            if (equipment == null) return NotFound();

            _context.Equipment.Remove(equipment);
            _context.SaveChanges();

            return Ok();
        }
    }
}
