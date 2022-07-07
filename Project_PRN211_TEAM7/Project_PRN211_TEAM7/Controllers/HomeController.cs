using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using System.Security.Cryptography;
using System.Text;
using Project_PRN211_TEAM7.Logic;
using Microsoft.AspNetCore.Http;

namespace Project_PRN211_TEAM7.Controllers
{
    public class HomeController : Controller
    {

        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();

        public IActionResult Index()
        {
            ViewBag.Message = HttpContext.Session.GetString("username");
            return View() ;
        }

        public IActionResult Shop(int Id, int Page)
        {
            // lay danh sach category
            BrandManager brandManager = new BrandManager();
            ViewBag.Brand = brandManager.GetAllBrand();
            // lay cac san pham trong brand yeu cau
            if (Page <= 0) 
            {
                Page = 1; 
            }
            int PageSize = 3;
            ProductManager productManager = new ProductManager();
            List<Product> products = productManager.GetProduct(Id, (Page - 1) * PageSize + 1, PageSize);

            // Lay du lieu hien thi thanh phan trang
            int TotalProduct = productManager.GetNumberOfProducts(Id);
            int TotalPage = TotalProduct / PageSize;
            if (TotalProduct % PageSize != 0)
            {
                TotalPage += 2;
            }

            ViewData["TotalPage"] = TotalPage;
            ViewData["CurrentPage"] = Page;
            ViewData["CurrentBra"] = Id;

            return View(products);
        }

        public ActionResult Login()
        {
            ViewBag.Message = HttpContext.Session.GetString("username");

            ViewBag.Error = "";

            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            try
            {
                ViewBag.Error = "";

                // kiem tra trong co so du lieu co username va password chua
                User user = db.Users.Where(m => m.UserName == username).FirstOrDefault();
                if (user != null)
                {
                    if (user.Password.Equals(password))
                    {
                        HttpContext.Session.SetString("username", username);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.Error = "Password not true!";
                    }
                }
                else
                {
                    ViewBag.Error = "Account " + username + " Not exist!";
                }

            }
            catch (System.Exception e)
            {

                System.Console.WriteLine(e);
            }
            return View("Login");
        }

        [HttpPost]
        public ActionResult Logout()
        {
            HttpContext.Session.Remove("username");
            return RedirectToAction("Index");
        }

    }
}
