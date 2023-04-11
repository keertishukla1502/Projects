using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ActionFilter
{
    public class MyActionFilter : ActionFilterAttribute
    {
        //Your Properties in Action Filter
        public string Property1 { get; set; }
        public string Property2 { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Property1 == "")
            {
                Property1 = filterContext.HttpContext.Request.Params["test"];
            }
          
            base.OnActionExecuting(filterContext);
        }
    }
}