using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using LoginPageMVC.BusinessLogics;
using LoginPageMVC.Models;
using Microsoft.AspNet.Identity;
using LoginPageMVC.Controllers;
using Microsoft.AspNet.Identity.Owin;
using System.ComponentModel;
using Newtonsoft.Json;

namespace LoginPageMVC.Controllers
{
    public class UserController : Controller
    {
        public string StoreProcedureName;
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: User
        UserBusinessLogic UserBL = new UserBusinessLogic();
        UserModels user = new UserModels();
        CommonBusinessLogic CommonBL = new CommonBusinessLogic();
        public ActionResult Index()
        {
           List<UserModels> UserList= UserBL.SelectAllUser;
            return View(UserList);
        }

        // GET: User/Details/5
        public ActionResult Details(int id)
        {
            UserModels user = UserBL.SelectSingleUser(id);
            return View(user);
        }

        // GET: User/Create
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
                }else
                    TempData["Msg"] = "please fill all the fields.";
                return RedirectToAction("Index");
            }
            catch(Exception Ex)
            {
               // TempData["Exception"] = Ex;
                return View();
            }
        }

        // GET: User/Edit/5
        public ActionResult Edit(int id)
        {

            UserModels user = UserBL.SelectSingleUser(id);
            return View(user);
        }

        // POST: User/Edit
        [HttpPost]
        public ActionResult Edit( UserModels User)
        {
            try
            {
                User.ConfirmPassword = null;
                //User.ID = 0;
                var json = JsonConvert.SerializeObject(User);
                var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
                StoreProcedureName = "spInsertAspNetUsers";
                CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);
                TempData["Msg"] = "Data Updated SuccessFully.";
                return RedirectToAction("Index");
            }
            catch(Exception Ex)
            {
                return View();
            }
        }

        // GET: User/Delete/5
        public ActionResult Delete(int id)
        {
            UserModels user = UserBL.SelectSingleUser(id);
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
            catch(Exception Ex)
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel changepass)
        {
            if (ModelState.IsValid)
            {
                if (changepass.OldPassword == TempData["Password"].ToString())
                {
                   
                        UserModels Users = new UserModels();
                    // User.Email = TempData["Email"].ToString();
                    if (Request.IsAuthenticated)
                    {
                        Users.Email = User.Identity.GetUserName();
                    
                    }
                    Users.Password = changepass.NewPassword;
                    var user = new ApplicationUser {Email = Users.Email};
                  //  AccountController obj = new AccountController();
                    var result = await UserManager.CreateAsync(user, Users.Password);
                 //   if (result.Succeeded) {
                    //TempData["token"]= user.PasswordHash;
                    Users.ConfirmPassword= user.PasswordHash;

                    var json = JsonConvert.SerializeObject(Users);
                    var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
                  
                    CommonLogics objBL = new CommonLogics();

                    objBL.ChangePassword(dictionary);
                    TempData["Msg"] = "Password Changed Successfully. Please Login!";
                    return RedirectToAction("Login", "Account");
                    //}
                }
                TempData["Msg"] = "Old Password does not matched.";
                return View();
            }

            TempData["Msg"] = "Please full fields.";
            return View();
        }


        public ActionResult SelectCommonMethod()
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

    }
}
