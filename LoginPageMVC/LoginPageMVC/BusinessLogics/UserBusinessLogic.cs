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
    public class UserBusinessLogic
    {

        public List<UserModels> SelectAllUser
        {
            get
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                List<UserModels> usermodel = new List<UserModels>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spSelectAllAspNetUsers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        UserModels user = new UserModels();
                        user.ID = Convert.ToInt32(rdr["Id"]);
                        user.Name = rdr["Name"].ToString();
                        user.Gender = rdr["Gender"].ToString();
                        user.Salary = Convert.ToInt32(rdr["Salary"]);
                        user.DeptName = rdr["DeptName"].ToString();
                        user.Email = rdr["Email"].ToString();
                        user.Password = rdr["Password"].ToString();
                        user.PhoneNumber = rdr["PhoneNumber"].ToString();
                        user.Address = rdr["Address"].ToString();
                        usermodel.Add(user);
                    }
                }
                return usermodel;
            }
        }

        public UserModels SelectSingleUser(int id)
        {
               string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                UserModels user = new UserModels();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spselectByIDAspNetUsers", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {                      
                        user.ID = Convert.ToInt32(rdr["Id"]);
                        user.Name = rdr["Name"].ToString();
                        user.Gender = rdr["Gender"].ToString();
                        user.Salary = Convert.ToInt32(rdr["Salary"]);
                        user.DeptName = rdr["DeptName"].ToString();
                        user.Email = rdr["Email"].ToString();
                        user.Password = rdr["Password"].ToString();
                        user.PhoneNumber = rdr["PhoneNumber"].ToString();
                        user.Address = rdr["Address"].ToString();
                       
                    }
                }
                return user;
        }


        public void InsertUpdateUser(UserModels usermodel)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand("spInsertAspNetUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", usermodel.Name);
                cmd.Parameters.AddWithValue("@gender", usermodel.Gender);
                cmd.Parameters.AddWithValue("@salary", usermodel.Salary);
                cmd.Parameters.AddWithValue("@Department", usermodel.DeptName);
                cmd.Parameters.AddWithValue("@email", usermodel.Email);
                cmd.Parameters.AddWithValue("@Password", usermodel.Password);
                cmd.Parameters.AddWithValue("@PhoneNumber", usermodel.PhoneNumber);
                cmd.Parameters.AddWithValue("@Address", usermodel.Address);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

        }


        public void DeleteUser(int id)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand cmd = new SqlCommand("spDeleteAspNetUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", id);
               
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

        }







    }
}