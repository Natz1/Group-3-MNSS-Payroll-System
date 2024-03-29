﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using System.Web.Configuration;
using Group_3_MNSS_Payroll_System.Accountant;
using Group_3_MNSS_Payroll_System.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.BuilderProperties;
using System.Security.Policy;

namespace Group_3_MNSS_Payroll_System.Permissions.Manager
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        //Runs when save button is clicked
        protected void Save_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType= CommandType.Text;
            cmd.CommandText = 
                "Insert into Employee values('" + FN1.Text + "', '" + LN1.Text + "', '" + DB1.Text +"'" +
                ",'" + ADDR1.Text +"','" + EM1.Text +"','" + PHN1.Text +"','" + TITLE1.Text + "', '" + SAL1.Text +"')";
            cmd.ExecuteNonQuery();

            //If the employee type is not an accountant
            if(TITLE1.Text != "Accountant")
            {
                //***********************Creating employee user
                var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
                //Note that manager will assign employees a company email in order to log in
                string email = EM1.Text;
                //***********************Check if user is already present
                var search1 = userManager.FindByEmail(email);
                if (search1 == null)
                {
                    var user = new ApplicationUser()
                    {
                        UserName = EM1.Text,
                        Email = EM1.Text
                    };
                    IdentityResult result = userManager.Create(user, "Emp123!"); //Default Password
                    userManager.AddToRole(user.Id, "employee");
                }
            }
            else
            {
                //***********************Creating accountant user
                var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
                //Note that manager will assign accountants a company email in order to log in
                string email = EM1.Text;
                //***********************Check if user is already present
                var search1 = userManager.FindByEmail(email);
                if (search1 == null)
                {
                    var user = new ApplicationUser()
                    {
                        UserName = EM1.Text,
                        Email = EM1.Text
                    };
                    IdentityResult result = userManager.Create(user, "Acc123!"); //Default Password
                    userManager.AddToRole(user.Id, "accountant");
                }
            }
            

            //Make textboxes empty again
            FN1.Text = "";
            LN1.Text = "";
            DB1.Text = "";
            ADDR1.Text = "";
            EM1.Text = "";
            PHN1.Text = "";
            TITLE1.Text = "";
            SAL1.Text = "";


            //Call display function
            employeeRec();
        }

        //Displays data entered by manager
        public void employeeRec()
        {
            //Refresh the page
            Response.Redirect("AddEmployee");

            //State Changes have been saved
            Result.Text = "Changes successfully saved.";
        }

        protected void RowDelete(object sender, GridViewDeleteEventArgs e)
        {
            //get the email of the employee that was deleted and remove their log in credentials from the system
            GridViewRow row = AddList.Rows[e.RowIndex];
            string email = row.Cells[5].Text;

            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            //Create a command to delete the values from the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Delete from [dbo].[AspNetUsers] where email = @email";
            //Add values as parameters for query
            cmd.Parameters.AddWithValue("@email", email);
            //Execute the query
            cmd.ExecuteNonQuery();
            //Clear the parameters
            cmd.Parameters.Clear();
        }
    }
}