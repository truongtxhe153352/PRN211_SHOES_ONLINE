using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace Project_PRN211_TEAM7.Models
{
    public partial class User
    {
        public User()
        {
            Oders = new HashSet<Oder>();
        }

        public int UserId { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Input your UserName")]
        public string UserName { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Input your Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Input your Address")]
        public string Address { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Input your Phone")]
        public string Phone { get; set; }
        public string Role { get; set; }

        public virtual ICollection<Oder> Oders { get; set; }
    }
}
