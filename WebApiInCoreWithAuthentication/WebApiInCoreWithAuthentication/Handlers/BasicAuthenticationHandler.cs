using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading;
using System.Threading.Tasks;

namespace WebApiInCoreWithAuthentication.Handlers
{
    public class BasicAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {

        public BasicAuthenticationHandler(
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock)
            : base(options, logger, encoder, clock)
        {
        }
        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {

            if (!Request.Headers.ContainsKey("Authorization"))
            {
                return AuthenticateResult.Fail("Authentication header was not found");
            }
          var authenticationHeaderValue=  AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
        

            string decodedAuthenticationToken = Encoding.UTF8.GetString(
                   Convert.FromBase64String(authenticationHeaderValue.Parameter));

            string[] usernamePasswordArray = decodedAuthenticationToken.Split(':');
            string username = usernamePasswordArray[0];
            string password = usernamePasswordArray[1];
            UserSecurity user = new UserSecurity();
            if (user.Login(username, password))
            {
                //Thread.CurrentPrincipal = new GenericPrincipal(
                //    new GenericIdentity(username), null);


                var claim = new[] { new Claim(ClaimTypes.Name, username) };
                var identity = new ClaimsIdentity(claim, Scheme.Name);
                var Principal = new ClaimsPrincipal(identity);
                var ticket = new AuthenticationTicket(Principal, Scheme.Name);
                return AuthenticateResult.Success(ticket);
            }
            else { return AuthenticateResult.Fail("Invalid username or password"); }
            //return AuthenticateResult.Fail("Invalid username or password");
        }
    }
}
