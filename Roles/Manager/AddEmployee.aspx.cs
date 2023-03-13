using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace Group_3_MNSS_Payroll_System.Permissions.Manager
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        //Make new SQL Connection
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MNSSPayrollDatabase.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        //Runs when save button is clicked
        protected void Save_Click(object sender, EventArgs e)
        {
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType= CommandType.Text;
            cmd.CommandText = 
                "Insert into Employee values('" + FN1.Text + "', '" + LN1.Text + "', '" + DB1.Text +"'" +
                ",'" + ADDR1.Text +"','" + EM1.Text +"','" + PHN1.Text +"','" + TITLE1.Text + "', '" + SAL1.Text +"')";
            cmd.ExecuteNonQuery();

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
            //Create a command to get the values from the database
            /*SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Select * from Employee";
            cmd.ExecuteNonQuery();

            //Store employee data values in list view
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();*/

            //State Changes have been saved
            Result.Text = "Changes successfully saved.";
        }
    }
}