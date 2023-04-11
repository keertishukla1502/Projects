using OnlineShoppingApi.DAL;
using OnlineShoppingApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;



namespace OnlineShoppingApi.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values

        public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        

        [System.Web.Mvc.HttpGet]
        public IEnumerable<Tbl_Product> GetProduct()
         {    
            return _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetProduct();
          
        }
        
        public string Get(int id)
        {
            
           return "value";
        }

        // POST api/values
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
