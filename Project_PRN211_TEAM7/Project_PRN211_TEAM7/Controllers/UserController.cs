using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Project_PRN211_TEAM7.Models;
using System.Linq;
using System.Text.RegularExpressions;

namespace Project_PRN211_TEAM7.Controllers
{
    public class UserController : Controller
    {
        PROJECT_PRN211_SHOES_APPContext context = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Register(User acc, string re_password)
        {
            if(acc.Password == null || re_password == null || acc.UserName == null || acc.Address == null || acc.Phone == null)
            {
                return View();
            }
            if (!acc.Password.Equals(re_password))
            {
                ViewBag.password = "Confirmation password does not match";
                return View();
            }
            Regex re = new Regex("[0-9]");
            if (acc.Phone.Length > 8)
            {
                for (int i = 0; i < acc.Phone.Length; i++)
                {
                    if (!re.IsMatch(acc.Phone[i] + ""))
                    {
                        ViewBag.phone = "Please enter valid phone number";
                        return View();
                    }
                }
            }
            else
            {
                ViewBag.phone = "Please enter valid phone number > 8";
                return View();
            }
            if (ModelState.IsValid)
            {
                var user = context.Users.FirstOrDefault(u => u.UserName.Equals(acc.UserName));
                if (user != null)
                {
                    ViewBag.user = "This UserName was exist!";
                    return View();
                }
                else
                {
                    acc.Role = "customer";
                    context.Users.Add(acc);
                    context.SaveChanges();
                    return Redirect("Home/Index");
                }

            }
            else
            {
                return RedirectToAction("Register");
            }
        }
    }
}
