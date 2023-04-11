using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace ActionFilterQueryStringPOC
{
    public class NewAuthoriseAttribute : ActionFilterAttribute
    {
        //Your Properties in Action Filter
        public string? agentNumber { get; set; }
        public string? customerNumber { get; set; }
        public string? phoneCodeId { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (agentNumber == null)
            {               
                agentNumber = filterContext.HttpContext.Request.Query["agentNumber"].ToString();
            }
            if (customerNumber == null)
            {
                customerNumber = filterContext.HttpContext.Request.Query["customerNumber"].ToString();
            }
            if (phoneCodeId == null)
            {
                phoneCodeId = filterContext.HttpContext.Request.Query["phoneCodeId"].ToString();
            }

            base.OnActionExecuting(filterContext);
        }
    }
}
