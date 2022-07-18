using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;


namespace Project_PRN211_TEAM7.Controllers
{
    public class ProductController : Controller
    {

        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();
        public IActionResult Shop(int Id, int Page)
        {
            // lay danh sach category
           
            ViewBag.Brand = GetAllBrand();
            // lay cac san pham trong brand yeu cau
            if (Page <= 0)
            {
                Page = 1;
            }
            int PageSize = 3;

            List<Product> products = GetProduct(Id, (Page - 1) * PageSize + 1, PageSize);

            // Lay du lieu hien thi thanh phan trang
            int TotalProduct = GetNumberOfProducts(Id);
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

        public List<Brand> GetAllBrand()
        {
            using (var db = new PROJECT_PRN211_SHOES_APPContext())
            {
                return db.Brands.ToList();
            }
        }

        public List<Product> GetProduct(int BrandId, int Offset, int Count)
        {
            using (var db = new PROJECT_PRN211_SHOES_APPContext())
            {
                if (BrandId == 0) // get all product
                {
                    return db.Products.Skip(Offset - 1).Take(Count).ToList();
                }
                else
                {
                    return db.Products.Where(x => x.BrandId == BrandId).Skip(Offset - 1).Take(Count).ToList();
                }
            }
        }

        public int GetNumberOfProducts(int BrandId)
        {
            using (var db = new PROJECT_PRN211_SHOES_APPContext())
            {
                if (BrandId == 0) // get all product
                {
                    return db.Products.Count();
                }
                else
                {
                    return db.Products.Where(x => x.BrandId == BrandId).Count();
                }
            }
        }

        public IActionResult ProductDetail(int id)
        {

            var product = db.Products.Find(id);
            int b = (int)product.BrandId;
            var sizes = (from s in db.Sizes
                         where s.ProductId == id
                         select s).ToList();
            var quantity = db.Sizes.Where(item => item.ProductId == id).Sum(i => i.Quantity);
            ViewBag.Sizes = sizes;
            ViewBag.Quantity = quantity;
            ViewBag.Product = product;
            var list = (from pro in db.Products
                       where pro.BrandId == b
                       select pro).ToList();
            foreach (var item in list)
            {
                if(item.ProductId == id)
                {
                    list.Remove(item);
                    break;
                }
            }
            return View(list);
        }
    }
}
