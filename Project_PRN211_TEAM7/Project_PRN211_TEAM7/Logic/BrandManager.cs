using Project_PRN211_TEAM7.Models;
using System.Collections.Generic;
using System.Linq;

namespace Project_PRN211_TEAM7.Logic
{
    public class BrandManager
    {
        public List<Brand> GetAllBrand()
        {
            using (var db = new PROJECT_PRN211_SHOES_APPContext())
            {
                return db.Brands.ToList();
            }
        }
    }
}
