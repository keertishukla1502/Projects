using ControllerToViewSendId.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ControllerToViewSendId.Controllers
{
    public class DefaultController : Controller
    {// local list of data 
        #region local data to bind grid ti 
        static List<Models.Tickets> tblTicketList = new List<Models.Tickets>()
        {
              new Models.Tickets { Ticket_ID=1,Date_Entered="12/20/2021 11:36:17 AM",Account_Number="101",Phone_Number="1569870",Customer_Name="Rajkumar",Selected=true ,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=2,Date_Entered="11/20/2021 11:36:17 AM",Account_Number="102",Phone_Number="12569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=3,Date_Entered="10/29/2021 11:36:17 AM",Account_Number="103",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=4,Date_Entered="10/28/2021 11:36:17 AM",Account_Number="104",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=5,Date_Entered="10/27/2021 11:36:17 AM",Account_Number="105",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=6,Date_Entered="11/23/2021 11:36:17 AM",Account_Number="106",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=7,Date_Entered="10/25/2021 11:36:17 AM",Account_Number="107",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=8,Date_Entered="10/24/2021 11:36:17 AM",Account_Number="108",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=9,Date_Entered="10/23/2021 11:36:17 AM",Account_Number="109",Phone_Number="123569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=10,Date_Entered="10/22/2021 11:36:17 AM",Account_Number="110",Phone_Number="12234569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" },
              new Models.Tickets { Ticket_ID=11,Date_Entered="10/21/2021 11:36:17 AM",Account_Number="111",Phone_Number="12034569870",Customer_Name="Rajkumar",Selected=true,Description="Your ticket number generated successfully and interted in DB" }
        };
        #endregion
        public ActionResult Index()
        {
            ViewBag.TotalTicket = tblTicketList.Count();
            return View(tblTicketList);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }



        [HttpGet]
        //public JsonResult CloseTicket(string[] id)
        public JsonResult CloseTicket(List<int> param2)
        {
            List<SelectedIds> param1=new List<SelectedIds>();
            if (param1 != null && param1.Count() > 0)
            {
                foreach (Models.SelectedIds selectedIds in param1)
                {
                    var ticketData = tblTicketList.Where(x => x.Ticket_ID == Convert.ToInt32(selectedIds.id)).FirstOrDefault();
                    tblTicketList.Remove(ticketData);//remov ticket data in list of ticket objec 
                    ticketData.Selected = false;// update ticket closed 
                    tblTicketList.Add(ticketData); // add updated ticket data in list of ticket objec                      
                }
                return Json(true);
            }
            return Json(false);
        }


        //[HttpPost]
        ////public JsonResult CloseTicket(string[] id)
        //public JsonResult CloseTicket(Tickets param1)
        //{

        //    //if (id != null && id.Length > 0)
        //    //{
        //    //    foreach (string _id in id)
        //    //    {
        //    //        var ticketData = tblTicketList.Where(x => x.Ticket_ID == Convert.ToInt32(_id)).FirstOrDefault();
        //    //        tblTicketList.Remove(ticketData);//remov ticket data in list of ticket objec 
        //    //        ticketData.Selected = "false";// update ticket closed 
        //    //        tblTicketList.Add(ticketData); // add updated ticket data in list of ticket objec                      
        //    //    }
        //    //    return Json("true");
        //    //}
        //    return Json("false");
        //}

    }
}