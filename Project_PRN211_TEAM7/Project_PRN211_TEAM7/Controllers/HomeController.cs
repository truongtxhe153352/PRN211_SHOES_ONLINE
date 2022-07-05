using Microsoft.AspNetCore.Mvc;
using Project_PRN211_TEAM7.Models;

namespace Project_PRN211_TEAM7.Controllers
{
    public class HomeController : Controller
    {
        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult Index()
        {
            var user = db.Users.Find(1);

            return View(user);
        }
    }
}
