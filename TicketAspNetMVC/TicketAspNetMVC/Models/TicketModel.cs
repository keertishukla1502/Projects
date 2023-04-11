using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TicketDataMVCproject.Models
{
    public class TicketModel
    {
        [Display(Name = "ID")]
        public int Ticket_ID { get; set; }

        [Required]
        [Display(Name = "Date Entered")]
        [StringLength(100, MinimumLength = 3)]
        public string Date_Entered { get; set; }

        
        [Required]
        [Display(Name = "Account Number")]
        public int Account_Number { get; set; }


        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string Phone_Number { get; set; }

        [Required]
        [Display(Name = "Customer Name")]
        [StringLength(100, MinimumLength = 3)]
        public string Customer_Name { get; set; }



        [Required]
        [Display(Name = "Selected")]

        public bool Selected { get; set; }



        [Required]
        [Display(Name = "Description")]
       
        public string Description { get; set; }
       
        [Required]
     
        [Display(Name = "Createdby")]
        public int Createdby { get; set; }



        
        [Display(Name = "CreatedDate")]
       
        public string CreatedDate { get; set; }


        [Required]
        [Display(Name = "Current Address")]
        public bool IsActive { get; set; }
    }
}
