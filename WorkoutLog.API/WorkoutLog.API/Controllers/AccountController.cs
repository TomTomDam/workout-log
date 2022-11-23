using Microsoft.AspNetCore.Mvc;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Controllers
{
    public class AccountController : ControllerBase
    {
        public AccountController()
        {

        }

        public IActionResult GetAll()
        {
            return Ok();
        }

        public IActionResult GetById(int id)
        {
            return Ok();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(User user)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return Ok();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Update(int id, User user)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return Ok();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return Ok();
            }
        }
    }
}
