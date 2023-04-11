using identityCoreMVC.ActionFilters;
using identityCoreMVC.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace identityCoreMVC
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {

            Configuration = configuration;
            
        }

        public Logger<HelloActionFilter> _logger { get; }
        //public Startup(ILogger<HelloActionFilter> logger)
        //{
        //    _logger = logger;
        //}

        
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllersWithViews();
            services.AddRazorPages();
           // services.AddLogging();
            services.AddControllers(config =>
            {

                //ILogger<HelloActionFilter> logger;
                //var logger = Configuration["Logging:LogLevel:Default"];
                ILogger<HelloActionFilter> logger = Configuration.GetSection("Logging") as ILogger<HelloActionFilter>;
                
                config.Filters.Add(new HelloActionFilter(logger));
            });
            services.AddScoped<HelloAsyncActionFilter>();

         //   services.AddScoped<HelloModelActionFilter<UserModels>>();
            //services.AddControllers(config =>
            //{
            //    config.Filters.Add(new HelloAsyncActionFilter());
            //});

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //if (env.IsDevelopment())
            //{
            //    app.UseDeveloperExceptionPage();
            //}
            //else
           // {
                app.UseExceptionHandler("/Home/Error");
            //}
            app.UseHttpsRedirection();
            app.UseStaticFiles();
           // app.UseExceptionHandler("/error");
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapRazorPages();
            });
        }
    }
}
