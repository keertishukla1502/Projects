
using identityCoreMVC.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using identityCoreMVC.UserBL;
using Newtonsoft.Json;
using Microsoft.Extensions.Configuration;
using identityCoreMVC.ActionFilters;

namespace identityCoreMVC.Controllers
{
   
    public class UserController : Controller
    {
        // GET: UserController


        //  public IConfiguration Config { get; }
        public CommonBusinessLogic CommonBL;

        public UserController(IConfiguration configuration)
        {
            //Config = configuration;
            CommonBL = new CommonBusinessLogic(configuration);
        }

        string StoreProcedureName;


        [ServiceFilter(typeof(HelloAsyncActionFilter))]
        public ActionResult ActionFilters()
        {
            return View();

        }

        [ServiceFilter(typeof(HelloModelActionFilter<UserModels>))]
        public ActionResult ActionFiltersWithModels()
        {


            return View();
        }



            [HttpGet]
        public ActionResult Index()
        {
            try
            {
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


                return View(List);
            }
            catch (Exception Ex)
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Details(string id)
        {
            StoreProcedureName = "spselectByIDAspNetUsers";
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<UserModels>(StoreProcedureName,id);
            UserModels user = new UserModels();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    user = JsonConvert.DeserializeObject<UserModels>(json);

                    
                }
            }


         
            return View(user);
        }

        // GET: User/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(UserModels user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    user.ConfirmPassword = null;
                    var json = JsonConvert.SerializeObject(user);
                    var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

                    StoreProcedureName = "spInsertAspNetUsers";
                    CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);

                    TempData["Msg"] = "Data Inserted SuccessFully.";
                    return RedirectToAction("Index");
                }
                else
                    TempData["Msg"] = "please fill all the fields.";
                return RedirectToAction("Index");
            }
            catch (Exception Ex)
            {
             
                return View();
            }
        }

        // GET: User/Edit/5
        [HttpGet]
        public ActionResult Edit(string id)
        {
            StoreProcedureName = "spselectByIDAspNetUsers";
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<UserModels>(StoreProcedureName,id);
            UserModels user = new UserModels();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    user = JsonConvert.DeserializeObject<UserModels>(json);


                }
            }
           
            return View(user);
        }

        // POST: User/Edit
        [HttpPost]
        public ActionResult Edit(UserModels User)
        {
            try
            {
                User.ConfirmPassword = null;
                
                var json = JsonConvert.SerializeObject(User);
                var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
                StoreProcedureName = "spInsertAspNetUsers";
                CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);
                TempData["Msg"] = "Data Updated SuccessFully.";
                return RedirectToAction("Index");
            }
            catch (Exception Ex)
            {
                return View();
            }
        }

        // GET: User/Delete/5
        [HttpGet]
        public ActionResult Delete(string id)
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
            return View(user);
        }

        // POST
        [HttpPost]
        public ActionResult Delete(UserModels User)
        {
            try
            {
                var json = JsonConvert.SerializeObject(User);
                var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

                StoreProcedureName = "spDeleteAspNetUsers";
                CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);
                TempData["Msg"] = "Data Deleted SuccessFully.";

                return RedirectToAction("Index");
            }
            catch (Exception Ex)
            {
                return View();
            }
        }
    }
}