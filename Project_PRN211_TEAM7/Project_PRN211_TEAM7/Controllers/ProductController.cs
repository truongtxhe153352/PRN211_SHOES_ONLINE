using Microsoft.AspNetCore.Mvc;

namespace Project_PRN211_TEAM7.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return RedirectToAction("Index","Home");
        }
    }
}
