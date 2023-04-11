using System;
using identityCoreMVC.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(identityCoreMVC.Areas.Identity.IdentityHostingStartup))]
namespace identityCoreMVC.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<identityCoreMVCContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("identityCoreMVCContextConnection")));

                services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                    .AddEntityFrameworkStores<identityCoreMVCContext>();
            });
        }
    }
}