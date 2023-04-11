using System;
using LoginRegisterUsingIdentity.Areas.Identity.Data;
using LoginRegisterUsingIdentity.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(LoginRegisterUsingIdentity.Areas.Identity.IdentityHostingStartup))]
namespace LoginRegisterUsingIdentity.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<LoginRegisterUsingIdentityContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("LoginRegisterUsingIdentityContextConnection")));

                //services.AddDefaultIdentity<LoginRegisterUsingIdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                //    .AddEntityFrameworkStores<LoginRegisterUsingIdentityContext>();
            });
        }
    }
}