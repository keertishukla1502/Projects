using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ActionFilter.Controllers
{
    public class HomeController : Controller
    {
        public string test123 { get; set; }

        //private readonly ActionExecutingContext _service;
        //public HomeController(ActionExecutingContext service)
        //{
        //    _service = service;
        //}
        [MyActionFilter(Property1 = "Value1", Property2 = "Value2")]
        public ActionResult Index()
        {
            return View();
        }

        //public ActionExecutingContext Get_service()
        //{
        //    return _service;
        //}

        ////public HttpRequestBase GetRequest()
        ////{
        ////    test123 = Request.Params["test"];
        ////    return Request;
        ////}

        [MyActionFilter(Property1 = "", Property2 = "Value2")]
        //[MyActionFilter(Property1 = "", Property2 = "Value2")]
        public ActionResult About(ActionExecutingContext _service)
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        [MyActionFilter(Property1 = "", Property2 = "Value2")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}