using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApiInCoreWithAuthentication.Models
{
    public class UsersRole
    {

        public int ID { get; set; }
        [Required]
        [Display(Name = "UserName")]
        [StringLength(100, MinimumLength = 3)]
        public string Username { get; set; }
        [Required]
        [Display(Name = "Password")]
        [StringLength(100, MinimumLength = 3)]
        public string Password { get; set; }
    }
}
