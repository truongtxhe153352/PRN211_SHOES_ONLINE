using Microsoft.AspNetCore.Mvc;
using Project_PRN211_TEAM7.Models;
using System.Linq;
namespace Project_PRN211_TEAM7.Controllers
{
    public class ProductController : Controller
    {
        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult ProductDetail(int id)
        {
            id = 2;
            var product = db.Products.Find(id);
            var sizes = (from s in db.Sizes
                        where s.ProductId == id
                        select s).ToList();
            var quantity = db.Sizes.Sum(i => i.Quantity);
            ViewBag.Sizes = sizes;
            ViewBag.Quantity = quantity;    
            return View(product);
        }
    }
}
