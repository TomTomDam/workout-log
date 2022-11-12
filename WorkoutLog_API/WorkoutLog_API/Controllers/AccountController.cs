using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WorkoutLog_API.Models;

namespace WorkoutLog_API.Controllers
{
    public class AccountController : ControllerBase
    {
        public AccountController()
        {

        }

        // GET: AccountController
        public ActionResult GetAll()
        {
            return Ok();
        }

        // GET: AccountController/Details/5
        public ActionResult GetById(int id)
        {
            return Ok();
        }

        // GET: AccountController/Create
        public ActionResult Create()
        {
            return Ok();
        }

        // POST: AccountController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(User user)
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

        // POST: AccountController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, User user)
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

        // POST: AccountController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
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
