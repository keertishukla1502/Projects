using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JWTauthenticationCore.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {

        private readonly IJwtAuthenticationManager jWTAuthenticationManager;

        public ValuesController(IJwtAuthenticationManager jWTAuthenticationManager)
        {
            this.jWTAuthenticationManager = jWTAuthenticationManager;
        }

        // GET: api/<ValuesController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "Keerti", "Shukla" };
        }

        // GET api/<ValuesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "keerti";
        }

        [AllowAnonymous]
        [HttpPost("authenticate")]
        public IActionResult Authenticate([FromBody] UserCred userCred)
        {
            var token = jWTAuthenticationManager.Authenticate(userCred.Username, userCred.Password);

            if (token == null)
                return Unauthorized();

            return Ok(token);
        }

    }
}
