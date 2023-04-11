using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace TicketService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "TicketWCF" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select TicketWCF.svc or TicketWCF.svc.cs at the Solution Explorer and start debugging.
    public class TicketWCF : ITicketWCF
    {
        public List<Dictionary<string, string>> GetData<T>(string Storeprocedure, string id = "0") where T : class, new()
        {

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                List<Dictionary<string, string>> usermodel = new List<Dictionary<string, string>>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(Storeprocedure, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (id != "0")
                    {
                        cmd.Parameters.AddWithValue("@id", id);
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
