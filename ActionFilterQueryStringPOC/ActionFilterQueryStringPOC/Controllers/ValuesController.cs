using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Reflection.Metadata;
using ActionParameterAlias;
using System;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ActionFilterQueryStringPOC.Controllers
{
    [Route("api/Values")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET: api/<ValuesController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        [HttpGet("ctc_cx")]
        [NewAuthoriseAttribute(agentNumber = "dial1", customerNumber = "dial2", phoneCodeId = "pc")]

        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet("ctc_cx_Test")]
        //[ParameterAlias({"ResNumber", "ResourceName", "RName", "ResourceN"},{},{ })]
        [NewAuthoriseAttribute()]
        public IEnumerable<string> TestGet(
            //[FormQuery]string ? PhoneNumber =ParamerterAlias("Phno","Mob","ContNo","Contect")
            )
        {
            return new string[] { Request.Query["agentNumber"], Request.Query["customerNumber"], Request.Query["phoneCodeId"] };
        }



        //        [HttpGet("ctc_cx_Demo")]
        //        [ParameterAlias({"ResNumber", "ResourceName", "RName", "ResourceN"},{},{ })]
        //        ParameterAlias("agentNumber", "testabc")]
        //        [ParameterAlias("resourceName", "resName", Order = 1)]
        //public IEnumerable<string> DemoGet([Bind(Prefix = "resName")] String resourceName)
        //{
        //    return new string[] { resourceName };
        //}







        [HttpGet("ctc_cx_Demo")]
        // [ParameterAlias("resourceName", "resName", Order = 1)]
        //[ParameterAlias("resourceName", "resName")]
        public IEnumerable<string> DemoGet([ParameterAlias("resourceName", "resName")] string resourceName)
        {
            return new string[] { resourceName};
        }



















        // GET api/<ValuesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ValuesController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ValuesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ValuesController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
