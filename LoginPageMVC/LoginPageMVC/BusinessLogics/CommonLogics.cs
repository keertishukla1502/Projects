using LoginPageMVC.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LoginPageMVC.BusinessLogics
{
    public class CommonLogics
    {
        //public void ChangePassword(UserModels obj)
        //{

        //    string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("SpChangePassword", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        cmd.Parameters.AddWithValue("@Email", obj.Email);
        //        cmd.Parameters.AddWithValue("@Password", obj.Password);
        //        cmd.Parameters.AddWithValue("@PasswordHash", obj.ConfirmPassword);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //    }

        //}


        public void ChangePassword(Dictionary<string, string> obj)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SpChangePassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                foreach(KeyValuePair<string, string> dict in obj) {
                    if (dict.Value != null && dict.Value != "0")
                    {
                        cmd.Parameters.AddWithValue(dict.Key, dict.Value);
                    }
                }
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

        }
    }
}