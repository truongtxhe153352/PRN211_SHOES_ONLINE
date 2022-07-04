using Microsoft.AspNetCore.Mvc;

namespace Project_PRN211_TEAM7.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
