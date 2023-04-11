using LoginPageMVC.BusinessLogics;
using LoginPageMVC.Models;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginPageMVC.Controllers
{
    [Authorize]
    public class QuizController : Controller
    {

        public string StoreProcedureName;
        CommonBusinessLogic CommonBL = new CommonBusinessLogic();
        QuestionModel Question = new QuestionModel();
        QuizOption Options = new QuizOption();
        int QuestionId;
        int ResultCounter;
        List<QuizOption> objlist = new List<QuizOption>();
        QuestionModel quiz = new QuestionModel();

        public ActionResult QuizPage()
        {

            try
            {
                StoreProcedureName = "spAspNetUserRolesById";
                string id = User.Identity.GetUserId();
                

                List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<RoleModel>(StoreProcedureName, id);
                RoleModel role = new RoleModel();
                
                if (UserList != null)
                {
                    foreach (var Obj in UserList)
                    {

                        string json = JsonConvert.SerializeObject(Obj);
                        RoleModel User = JsonConvert.DeserializeObject<RoleModel>(json);
                        RoleModel opt = new RoleModel();

                        role.RoleId = User.RoleId;
                       
                    }
                }
                if (role.RoleId == 1)
                {
                    return RedirectToAction("AdminView");

                }
                else
                return RedirectToAction("Index");

            }
            catch (Exception Ex)
            {
                return View();
            }

        }

        [HttpGet]
        public ActionResult AdminView()
        {

            try
            {
              
                return View(quiz);

            }
            catch (Exception Ex)
            {
                return View();
            }

        }
        [HttpPost]
        public ActionResult AdminView(QuestionModel question)
        {

            try
            {
                if (Session["Option"] != null) {
                    objlist = (List<QuizOption>) Session["Option"];
                }
                string BtnType = Request.Form["BtnType"];


                if (BtnType == "btnSubmitOption")
                {

                    QuizOption opt = new QuizOption();

                    opt.Options = question.Options;

                    objlist.Add(opt);
                    question.Option = objlist;

                    
                    Session["Option"] = objlist;
                    
                   
                    question.Options = null;
                    return View(question);
                }


                if (BtnType == "close")
                {
                    string CancleOption = Request.Form["CancleOption"];
                   
                    QuizOption opt = new QuizOption();

                    opt.Options = CancleOption;

                
                    int a =(Convert.ToInt16(CancleOption)-1);
                    objlist.RemoveAt(a);

                    question.Option = objlist;


                    Session["Option"] = objlist;

                   
                    question.Options = null;
                    return View(question);
                }




                if (BtnType == "btnAddQuestions")
                {
                //    QuizOption opt = new QuizOption();

                //    opt.Options = question.Options;
                //    objlist.Add(opt);
                    question.Option = objlist;

                   question.Options = null;
                    foreach(var op in question.Option)
                    {
                        if (question.Options == null)
                        {
                            question.Options = op.Options;
                        }else
                        question.Options = question.Options + ',' + op.Options;
                    }

                    question.Option = null;
                    var json = JsonConvert.SerializeObject(question);

                    var dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

                    StoreProcedureName = "spRegisterQuestion";
                    CommonBL.InsertUpdateDelete(dictionary, StoreProcedureName);

                    TempData["QuestionInserted"] = "Data Inserted SuccessFully.";
                    return RedirectToAction("AdminView");
                }
                return View(question);
            }
            catch (Exception Ex)
            {
                return View(quiz);
            }

        }

        public ActionResult Index()
        {

            try
            {
                if (QuestionId == 0) {
                    QuestionId = 1;
                    ResultCounter = 0;
                }
               
                Question = PopulateQuestionAnswers(QuestionId);
                Session["QuestionAnswers"] = Question;
                
                TempData["ResultCounter"] = ResultCounter;
                return View(Question);

            }
            catch (Exception Ex)
            {
                return View();
            }

        }

        [HttpPost]
        public ActionResult Index(QuestionModel obj)
        {
            QuestionModel  model= (QuestionModel)Session["QuestionAnswers"];
            model.Options = obj.Options;
            string BtnType = Request.Form["BtnType"];
            QuestionId = model.QuestionId;
            ResultCounter=(int)TempData["ResultCounter"];
            try
            {
                
                if (BtnType == "btnSubmit")
                {
                    if (model.CurrectAnswer == model.Options)
                    {
                        ResultCounter++;
                       
                    }
                    
                    Question = PopulateQuestionAnswers(QuestionId);
                    Question.Options = model.Options;
                }
                if (BtnType == "btnNext") {
                    QuestionId++;
                    
                    int lastquizId;
                    lastquizId = LastInsertedId();
                    TempData["lastPage"]=lastquizId;
                    if (QuestionId == (lastquizId + 1))
                    {
                        QuestionId = QuestionId - 1;

                    }
                    TempData["QuestionId"] = QuestionId;
                    Question = PopulateQuestionAnswers(QuestionId);
                    
                }
                if (BtnType == "btnPrevious") {
                    var q = QuestionId--;
                    if (q - 1 == 0)
                    {
                        QuestionId = 1;
                    }
                    Question = PopulateQuestionAnswers(QuestionId);
                }
                if (BtnType == "btnFinalSubmit") {
                    TempData["ResultCounter"] = ResultCounter;
                    TempData["QuestionId"] = QuestionId;
                    return RedirectToAction("FinalSubmit");
                }

                Session["QuestionAnswers"] = Question;
                TempData["ResultCounter"] = ResultCounter;
                return View(Question);
            }
            catch (Exception Ex)
            {
                return View();
            }

        }

        public ActionResult FinalSubmit()
        {
            int result;
            int a = (int)TempData["QuestionId"];
            int b = (int)TempData["ResultCounter"];
            if ((int)TempData["QuestionId"] != 0)
            {
                result = (int)TempData["ResultCounter"] * 100 / (int)TempData["QuestionId"];
            }
            else { result = 0; }
            if (result >= 40)
            {
                TempData["Result"]="Congratulation! You cleard this Test your percetage is "+ result +" % .";
               
            }
            else
            {
                TempData["Result"] = "Sorry! You are not clear the Test Your percetage is " + result + " % .";
                
            }
            return View(result);
        }


        public QuestionModel PopulateQuestionAnswers(int? questionId)
        {

            StoreProcedureName = "spQuizQuestionUsingId";
            string qId = QuestionId.ToString();
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<QuestionModel>(StoreProcedureName, qId);
            QuestionModel List = new QuestionModel();
            List<QuizOption> Listopt = new List<QuizOption>();

            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    QuestionModel User = JsonConvert.DeserializeObject<QuestionModel>(json);
                    QuizOption opt = new QuizOption();

                    opt.Options = User.Options;
                    Listopt.Add(opt);
                    
                    List = User;
                }
            }
            List.Option = Listopt;
            List.Options = null;
            return List;

        }


        public int LastInsertedId()
        {
            int id=0;
            StoreProcedureName = "spLastInsetedId";
          
            List<Dictionary<string, string>> UserList = CommonBL.SelectAllUser<QuestionModel>(StoreProcedureName);
          
            if (UserList != null)
            {
                foreach (var Obj in UserList)
                {

                    string json = JsonConvert.SerializeObject(Obj);
                    QuestionModel User = JsonConvert.DeserializeObject<QuestionModel>(json);
                    id=User.QuestionId;
                  
                }
            }


            return id;

        }

    }
}