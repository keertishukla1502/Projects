using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApiInCoreWithAuthentication.Models;
using WebApiInCoreWithAuthentication.UserBL;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApiInCoreWithAuthentication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
   [Authorize]
    public class ValuesController : ControllerBase
    {

        public CommonBusinessLogic CommonBL;

        public ValuesController(IConfiguration configuration)
        {
           
            CommonBL = new CommonBusinessLogic(configuration);
        }

        string StoreProcedureName;
        // GET: api/<ValuesController>
        [HttpGet]
        public IEnumerable<UserModels> Get()
        {

            string emailAddress = HttpContext.User.Identity.Name;
            StoreProcedureName = "spSelectAllAspNetUsers";
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

            return (IEnumerable<UserModels>)List;
        }

        // GET api/<ValuesController>/5
        [HttpGet("{id}")]
        public UserModels Get(string id)
        {

            StoreProcedureName = "spselectByIDAspNetUsers";
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<UserModels>(StoreProcedureName, id);
            UserModels user = new UserModels();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    user = JsonConvert.DeserializeObject<UserModels>(json);


                }
            }
            return user;
        }

        // POST api/<ValuesController>
        [HttpPost]
        public string Post([FromBody] UserModels user)
        {

            if (ModelState.IsValid)
            {
                user.ConfirmPassword = null;
                var json = JsonConvert.SerializeObject(user);
                var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

                StoreProcedureName = "spInsertAspNetUsers";
                CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);

                return "Data Posted successfully";
            }
            else
               
               return "Something get Wrong";

        }

        // PUT api/<ValuesController>/5
        [HttpPut("{id}")]
        public string Put(int id, [FromBody] UserModels User)
        {

            User.ID = id;
            User.ConfirmPassword = null;
            var json = JsonConvert.SerializeObject(User);
            var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
            StoreProcedureName = "spInsertAspNetUsers";
            CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);
        
            return "Data Updated successfully";

        }

        // DELETE api/<ValuesController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            UserModels User=new UserModels();
            User.ID = id;
            var json = JsonConvert.SerializeObject(User);
            var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

            StoreProcedureName = "spDeleteAspNetUsers";
            CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);
          
            return "Data Deleted successfully";


        }
    }
}
