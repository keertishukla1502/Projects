using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TicketDataMVC.Models
{
    public class UserModels
    {
    
        public int ID { get; set; }

        [Required]
        [Display(Name = "UserName")]
        [StringLength(100, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Gender")]
      
        public string Gender { get; set; }

        [Required]
        [Display(Name = "Salary")]
        [Range(3000, 10000000, ErrorMessage = "Salary must be between 3000 and 10000000")]
        public int Salary { get; set; }

        [Required]
        [Display(Name = "Department Name")]

        public string DeptName { get; set; }

        [Required]
        [Display(Name = "Email")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
       
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }

        [Required]
        [Display(Name = "Current Address")]
        public string Address { get; set; }
    }
}
