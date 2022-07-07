using Microsoft.AspNetCore.Mvc;
using Project_PRN211_TEAM7.Models;
using System.Linq;

namespace Project_PRN211_TEAM7.Controllers
{
    public class HomeController : Controller
    {
        PROJECT_PRN211_SHOES_APPContext context = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult Index()
        {
            ViewBag.Brand = context.Brands.ToList();
            
            return View(context.Products.ToList());
        }
    }
}
