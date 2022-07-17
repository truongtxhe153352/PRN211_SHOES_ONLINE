
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Project_PRN211_TEAM7.Helpers;
using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;
using System.Linq;

namespace Project_PRN211_TEAM7.Controllers
{
    public class ShoppingCartController : Controller
    {
        PROJECT_PRN211_SHOES_APPContext db = new PROJECT_PRN211_SHOES_APPContext();

        public List<CartItem> Carts
        {
            get
            {
                var data = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (data == null)
                {
                    data = new List<CartItem>();
                }
                return data;
            }
        }
        public IActionResult Cart()
        {
            return View(Carts);
        }

        public IActionResult AddToCart(int id, int SoLuong, int sizes)
        {

            var myCart = Carts;
            var item = myCart.SingleOrDefault(p => p.ProductId == id);

            if (item == null)//chưa có
            {
                var hangHoa = db.Products.SingleOrDefault(p => p.ProductId == id);

                item = new CartItem
                {
                    ProductId = id,
                    ProductName = hangHoa.ProductName,
                    Price = hangHoa.Price.Value,
                    Quantity = SoLuong,
                    Image = hangHoa.Image,
                    Size = sizes
                };
                myCart.Add(item);
            }
            else
            {
                item.Quantity += SoLuong;
            }
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction("Cart");
        }


        /// xóa item trong cart
        [Route("/removecart/{productid:int}", Name = "removecart")]
        public IActionResult RemoveCart([FromRoute] int productid)
        {
            var myCart = Carts;
            var cartitem = myCart.Find(p => p.ProductId == productid);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                myCart.Remove(cartitem);
                // cartitem.quantity = quantity;(updatequantity)
            }
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction(nameof(Cart));
        }

        public IActionResult SuaSoLuong(int productid, int soluongmoi)
        {
            var myCart = Carts;
            var cartitem = myCart.Find(p => p.ProductId == productid);
            if (cartitem != null)
            {
                cartitem.Quantity = soluongmoi;//(updatequantity)
            }
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction(nameof(Cart));
        }

    }

}

