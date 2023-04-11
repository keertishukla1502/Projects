using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TicketDataMVCproject.Models;
using TicketService;
using PagedList;
using PagedList.Mvc;

namespace TicketAspNetMVC.Controllers
{
    public class HomeController : Controller
    {
    
        public ActionResult Index(int? page)
        {
            try
            {

                List<TicketModel> List = new List<TicketModel>();
                List = Userdata();
                int pageSize = 6;
                int pageNumber = (page ?? 1);
                return View(List.ToPagedList(pageNumber, pageSize));
            }
            catch (Exception Ex)
            {
                return View();
            }
             
        }


        public List<TicketModel> Userdata()
        {

            TicketWCF ticketservice = new TicketWCF();

            string StoreProcedureName = "SpGetTicketDetail";
            List<Dictionary<string, string>> UserList = ticketservice.GetData<TicketModel>(StoreProcedureName);
            List<TicketModel> List = new List<TicketModel>();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    TicketModel User = JsonConvert.DeserializeObject<TicketModel>(json);

                    List.Add(User);
                }
            }
            return List;

        }
    }
}