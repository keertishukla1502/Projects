using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ControllerToViewSendId.Models
{
    public class Tickets
    {
        public int Ticket_ID { get; set; }
        public string Date_Entered { get; set; }
        public string Account_Number { get; set; }
        public string Phone_Number { get; set; }
        public string Customer_Name { get; set; }
        public bool Selected { get; set; }
        public string Description { get; set; }
    }
}
