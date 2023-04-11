using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Graph;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Threading;
using WebApiInCoreWithAuthentication.Models;
using WebApiInCoreWithAuthentication.UserBL;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApiInCoreWithAuthentication.Controllers
{  
   
    [Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
    [ApiController]
    
    public class BasicAuthenticationApiController : ApiController
    {
       

        public CommonBusinessLogic CommonBL;
        string StoreProcedureName;
        public BasicAuthenticationApiController(IConfiguration configuration)
        {

            CommonBL = new CommonBusinessLogic(configuration);
           
        }

        // GET: api/<BasicAuthenticationApiController>

        //[ServiceFilter(typeof(BasicAuthenticationAttribute))]
        [BasicAuthAttribute]
        [Microsoft.AspNetCore.Mvc.HttpGet]
       
        public HttpResponseMessage Get(string gender = "All")
        {

            string username = Thread.CurrentPrincipal.Identity.Name;
            if (username != null)
            {

                StoreProcedureName = "spSelectAllUsersByGender";
                List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<UserModels>(StoreProcedureName, "0", username);
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
               
                return Request.CreateResponse(HttpStatusCode.OK, List);
            }
            else
            {
               
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

    }
}
