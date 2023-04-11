using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TicketDataMVCproject.BusinessLogics;
using TicketDataMVCproject.Models;

namespace TicketDataMVCproject.Controllers
{
    public class DataController : Controller
    {
        // GET: Data
        UserModels user = new UserModels();
        CommonBusinessLogic CommonBL = new CommonBusinessLogic();
     

        public List<UserModels> Userdata()
        {
            string StoreProcedureName = "spSelectAllAspNetUsers";
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<UserModels>(StoreProcedureName);
            List<UserModels> List = new List<UserModels>();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    UserModels User = JsonConvert.DeserializeObject<UserModels>(json);

                    List.Add(User);
                }
            }
            return List;

        }
    }
}