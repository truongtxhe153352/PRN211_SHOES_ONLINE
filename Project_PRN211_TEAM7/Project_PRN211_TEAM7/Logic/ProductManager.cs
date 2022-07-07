using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;
using System.Linq;

namespace Project_PRN211_TEAM7.Logic
{
    public class ProductManager
    {
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

       
    }
}
