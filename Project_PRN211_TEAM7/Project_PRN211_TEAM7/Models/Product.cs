using System;
using System.Collections.Generic;

#nullable disable

namespace Project_PRN211_TEAM7.Models
{
    public partial class Product
    {
        public Product()
        {
            OderDetails = new HashSet<OderDetail>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int? Quantity { get; set; }
        public double? Price { get; set; }
        public double? Discount { get; set; }
        public int? Size { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public int? BrandId { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual ICollection<OderDetail> OderDetails { get; set; }
    }
}
