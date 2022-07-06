using Microsoft.AspNetCore.Mvc;
using Project_PRN211_TEAM7.Models;
using System.Linq;

namespace Project_PRN211_TEAM7.Controllers
{
    public class UserController : Controller
    {

        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult ChangePass()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ChangePass(string username, string oldpass, string newpass, string repass)
        {
            User user = (from u in db.Users
                         where u.UserName.Equals(username)
                         select u).ToList().First();

            if (user.Password.Equals(oldpass) == false)
            {
                ViewBag.Mess = "oldpass is not correct";

                return View();
            }
            else
            {
                if (repass.Equals(newpass) == false)
                {
                    ViewBag.Mess = "Repassword is not correct";
                    return View();
                }
                else
                {
                    user.Password = newpass;
                    db.Users.Update(user);
                    db.SaveChanges();
                    ViewBag.Mess = "Changepass successfully";
                    return View();
                }
            }

        }
    }
}
