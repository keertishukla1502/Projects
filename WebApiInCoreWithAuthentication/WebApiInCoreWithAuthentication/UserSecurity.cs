using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WebApiInCoreWithAuthentication.Models;

namespace WebApiInCoreWithAuthentication
{
    public class UserSecurity
    {
        //public IConfiguration Configuration { get; }
        //public UserSecurity(IConfiguration configuration)
        //{
        //    Configuration = configuration;
        //}
        public bool Login(string username, string password)
        {

            string sqlconn = @"Data Source=sql12-16.mt.cisinlive.com\sql2012;Initial catalog=delete2;User=atul;Password=cis1234;";
            
        //   string connectionString = this.Configuration.GetConnectionString("DefaultConnection");
            bool a;
            using (SqlConnection con = new SqlConnection(sqlconn))
            {
                SqlCommand cmd = new SqlCommand("spSelectUsersLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                con.Open();
              a=  Convert.ToBoolean(cmd.ExecuteNonQuery());
                con.Close();
            }
            return a;
        }
    }
}
