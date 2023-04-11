using Abp.Domain.Entities;
using identityCoreMVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace identityCoreMVC.ActionFilters
{

    public class HelloActionFilter : IActionFilter
    {
        private readonly ILogger<HelloActionFilter> _logger;

        public HelloActionFilter(ILogger<HelloActionFilter> logger)
        {
            _logger = logger;
        }
        public void OnActionExecuted(ActionExecutedContext context)
        {
           _logger.LogWarning("This is After custom filter in dotnet core");
            if (context.Exception != null)
            {
                context.ExceptionHandled = true;
                context.Result = new RedirectToRouteResult
                   (
                   new RouteValueDictionary(new
                   {
                       action = "Error",
                       controller = "Home"
                   }));
            }
          
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {

            // string currentUserRole = Convert.ToString(context.HttpContext.Session.GetString("UserRole"));
            //string currentUserRole = "Admin";
            // Console.WriteLine("Admin View");
            //Console.ReadKey();
           _logger.LogInformation("This is before custom filter in dotnet core");
            //if (!string.IsNullOrEmpty(currentUserRole))
            //{
            //    if (currentUserRole != "Admin")
            //    {
            //        context.Result = new RedirectToRouteResult
            //    (
            //    new RouteValueDictionary(new
            //    {
            //        action = "Error",
            //        controller = "Home"
            //    }));

            //    }
            //    else
            //    {
            //        context.Result = new RedirectToRouteResult
            //   (
            //   new RouteValueDictionary(new
            //   {
            //       action = "Error",
            //       controller = "Home"
            //   }));

            //    }
            //}
            //else
            //{
            //    context.Result = new RedirectToRouteResult
            //    (
            //    new RouteValueDictionary(new
            //    {
            //        action = "Error",
            //        controller = "Home"
            //    }));

            //}
        }
    }



    public class HelloAsyncActionFilter : IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            string currentUserRole = "Admin";
            if (!string.IsNullOrEmpty(currentUserRole))
            {
                if (currentUserRole != "Admin")
                {
                    context.Result = new RedirectToRouteResult
                (
                new RouteValueDictionary(new
                {
                    action = "Error",
                    controller = "Home"
                }));

                }
                else
                {
                    context.Result = new RedirectToRouteResult
               (
               new RouteValueDictionary(new
               {
                   action = "Error",
                   controller = "Home"
               }));

                }
            }
            else
            {
                context.Result = new RedirectToRouteResult
                (
                new RouteValueDictionary(new
                {
                    action = "Error",
                    controller = "Home"
                }));

            }
        
            await next();
            if (context != null)
            {
               
                context.Result = new RedirectToRouteResult
                   (
                   new RouteValueDictionary(new
                   {
                       action = "Error",
                       controller = "Home"
                   }));
            }
        }
    }


    public class HelloModelActionFilter<T> : IActionFilter where T: class 
    {
        private readonly UserModels _context;

        public HelloModelActionFilter(UserModels user)
        {
            _context= user;
        }
        public void OnActionExecuted(ActionExecutedContext context)
        {
           
            _context.Name="keerti shukla";
            _context.DeptName = "IT";
            _context.Email = "keerti@gmail.com";
            _context.PhoneNumber = "1234567890";
          
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            var b = "Before action filter";
        }
    }

    public class CustomExceptionHandler : IExceptionFilter
    {
        public void OnException(ExceptionContext context)
        {
            throw new NotImplementedException();
        }
    }
}
