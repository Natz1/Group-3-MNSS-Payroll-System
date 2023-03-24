using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Employee
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Editing(object sender, ListViewEditEventArgs e)
        {
            //Get the index to be edited
            EmpList.EditIndex = e.NewEditIndex;
            //Bind the data back to the list view
            //DataView dv = (DataView)EmpData.Select(DataSourceSelectArguments.Empty);
            //EmpList.DataSource= dv;
            EmpList.DataBind();
        }

        protected void Updating(object sender, ListViewUpdateEventArgs e)
        {
            string address = ((TextBox)EmpList.EditItem.FindControl("AddressTextBox")).Text;
            string phone = ((TextBox)EmpList.EditItem.FindControl("PhoneTextBox")).Text;
            //Get the value of the employee id
            int id = (int)EmpList.DataKeys[e.ItemIndex].Value;



            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            //Create a command to update the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Update Employee Set Address = @address, Phone = @phone Where ID = @id";
            //Add values as parameters for query
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@id", id);
            //Execute the query
            cmd.ExecuteNonQuery();
            //Clear the parameters
            cmd.Parameters.Clear();


            //Cancel editing
            EmpList.EditIndex = -1;


            //Bind the data back to the list view
            /*DataView dv = (DataView)EmpData.Select(DataSourceSelectArguments.Empty);
            EmpList.DataSource = dv;
            EmpList.DataBind();*/

            Response.Redirect("Profile");

        }
    }
}