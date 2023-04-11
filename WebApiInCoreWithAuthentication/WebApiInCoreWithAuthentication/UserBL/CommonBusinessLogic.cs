using WebApiInCoreWithAuthentication.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiInCoreWithAuthentication.UserBL
{
    public class CommonBusinessLogic
    {
        public IConfiguration Configuration { get; }
        public CommonBusinessLogic(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void InsertUpdateDelete(Dictionary<string, string> usermodel, string Storeprocedure)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("DefaultConnection");
               
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(Storeprocedure, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (KeyValuePair<string, string> dict in usermodel)
                    {
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
            catch (Exception Ex)
            { 
                throw Ex;
            }

        }


        public List<Dictionary<string, string>> SelectAllUser<T>(string Storeprocedure, string id = "0",string gender="All") where T : class, new()
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("DefaultConnection");
              
                List<Dictionary<string, string>> usermodel = new List<Dictionary<string, string>>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(Storeprocedure, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (id != "0")
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                    }
                    if (gender != "All")
                    {
                        cmd.Parameters.AddWithValue("@Gender", gender);
                    }
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Dictionary<string, string> user = new Dictionary<string, string>();
                        for (int i = 0; i < rdr.FieldCount; i++)
                        {
                            if (!rdr.IsDBNull(i))
                            {
                                string key = rdr.GetName(i);
                                string s = rdr.GetValue(i).ToString();
                                user.Add(key, s);
                            }
                        }
                        usermodel.Add(user);
                    }
                }
                return usermodel;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }


        }


    }
}