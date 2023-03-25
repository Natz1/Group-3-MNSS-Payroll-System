using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Employee
{
    public partial class PaymentRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select id from Employee where email = @email";
            //Add email parameter to query
            cmd.Parameters.AddWithValue("@email", Session["email"].ToString());



            //Display values returned from query in textboxes
            ID.Text = cmd.ExecuteScalar().ToString();

            cmd.CommandText = "Select FirstName from Employee where email = @email";
            FN.Text = cmd.ExecuteScalar().ToString();

            cmd.CommandText = "Select LastName from Employee where email = @email";
            LN.Text = cmd.ExecuteScalar().ToString();
        }
    }
}