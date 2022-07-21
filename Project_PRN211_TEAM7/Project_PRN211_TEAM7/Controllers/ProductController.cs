using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using System;

namespace Project_PRN211_TEAM7.Controllers
{
    public class ProductController : Controller
    {
        private readonly IConfiguration configuration;

        public ProductController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();

        //public IActionResult Shop(int Id, int Page, string SearchText) // id của brand
        //{
        //    // lay danh sach category      
        //    ViewBag.Brand = GetAllBrand();

        //    // lay cac san pham trong brand yeu cau

        //        if (Page <= 0)
        //            Page = 1;

        //        int PageSize = Convert.ToInt32(configuration.GetValue<string>("AppSettings:PageSize"));
        //        ViewBag.products = GetProducts(Id, (Page - 1) * PageSize + 1, PageSize, SearchText);

        //        // Lay du lieu hien thi thanh phan trang
        //        int TotalProduct = GetNumberOfProducts(Id, SearchText);
        //        int TotalPage = TotalProduct / PageSize;
        //        if (TotalProduct % PageSize != 0) TotalPage++;

        //        ViewData["TotalPage"] = TotalPage;
        //        ViewData["CurrentPage"] = Page;
        //        ViewData["CurrentBra"] = Id;


        //    return View();
        //}


        public IActionResult Shop(int Id, int page, string SearchText) // id của brand
        {
            // lay danh sach category      
            ViewBag.Brand = GetAllBrand();

            // lay cac san pham trong brand yeu cau
            if (page <= 0)
                page = 1;

            int PageSize = Convert.ToInt32(configuration.GetValue<string>("AppSettings:PageSize"));
            ViewBag.products = getproducts(Id, (page - 1) * PageSize + 1, PageSize, SearchText);
            int TotalProduct = GetNumberOfProducts(Id, SearchText);
            int TotalPage = TotalProduct / PageSize;
            if (TotalProduct % PageSize != 0) TotalPage++;
            ViewBag.searchkey = SearchText;
            ViewData["TotalPage"] = TotalPage;
            ViewData["CurrentPage"] = page;
           // ViewData["CurrentBra"] = Id;

            return View();
        }

        public List<Brand> GetAllBrand()
        {
            return db.Brands.ToList();
        }

        

        public List<Product> getproducts(int brandId, int offset, int count, string searchtext)
        {
            List<Product> list=new List<Product>();
            if (searchtext != null)
            {
                list= db.Products.Where(p => p.ProductName.Contains(searchtext)).ToList();
            }
            else
            {

                list= db.Products.ToList();
            }

            if (brandId != 0)
            {
                list = (from b in list
                        where b.BrandId == brandId
                        select b).ToList();

            }
            return list.Skip(offset - 1).Take(count).ToList();
  
        }

        public int GetNumberOfProducts(int BrandId, string SearchText)
        {
            List<Product> list = new List<Product>();

            if (SearchText != null)
            {
                list = db.Products.Where(p => p.ProductName.Contains(SearchText)).ToList();
            }
            else
            {
                list = db.Products.ToList();
            }
            if (BrandId != 0)
            {
                list = (from b in list
                        where b.BrandId == BrandId
                        select b).ToList();
            }
            
            return list.Count();

        }
        public IActionResult ProductDetail(int id)
        {

            Product product = db.Products.Find(id);
            var sizes = (from s in db.Sizes
                         where s.ProductId == id
                         select s).ToList();
            var quantity = db.Sizes.Sum(i => i.Quantity);
            ViewBag.Sizes = sizes;
            ViewBag.Quantity = quantity;
            ViewBag.Product = product;
            return View();
        }
    }
}
