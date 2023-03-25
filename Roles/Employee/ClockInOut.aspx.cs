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
    public partial class ClockInOut : System.Web.UI.Page
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


            //Create a command to get the values from the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select id from Employee where email = @email";
            //Add email parameter to query
            cmd.Parameters.AddWithValue("@email", Session["email"].ToString());

            //Display values returned from query in textboxes
            ID.Text = cmd.ExecuteScalar().ToString();
            ID1.Text = cmd.ExecuteScalar().ToString();



            //If the clock in last field is null then display clock in date
            cmd.CommandText = "Select Top 1 ClockInDate from DailyHours where Id = @id order by DailyLogId desc";
            //Add id parameter to query
            cmd.Parameters.AddWithValue("@id", ID.Text);
            //store result in an object
            object clockin = cmd.ExecuteScalar();

            //If the clock in field is null then display clock in date
            cmd.CommandText = "Select Top 1 ClockOutDate from DailyHours where Id = @id order by DailyLogId desc";
            //store result in an object
            object clockout = cmd.ExecuteScalar();



            //if the user has not clocked in previously and therefore has not clocked out also
            if ((clockin == null || clockin == DBNull.Value) && (clockout == null || clockout == DBNull.Value))
            {
                //Get the current date
                cmd.CommandText = "Select getdate()";
                ClockIn.Text = cmd.ExecuteScalar().ToString();
                InButton.Visible = true;
                OutButton.Visible = false;
                Activities.ReadOnly = true;
            }
            //if the user has clocked in but has not clocked out
            else if((clockin != null || clockin != DBNull.Value) && (clockout == null || clockout == DBNull.Value))
            {
                //Get the current date
                cmd.CommandText = "Select getdate()";
                ClockOut.Text = cmd.ExecuteScalar().ToString();
                InButton.Visible = false;
                OutButton.Visible = true;
                Activities.ReadOnly= false;
            }
            //if the user has clocked in and clocked out for the previous day
            else if ((clockin != null || clockin != DBNull.Value) && (clockout != null || clockout != DBNull.Value))
            {
                //Get the current date
                cmd.CommandText = "Select getdate()";
                ClockIn.Text = cmd.ExecuteScalar().ToString();
                InButton.Visible = true;
                OutButton.Visible = false;
                Activities.ReadOnly = true;
            }


        }

        protected void InButton_Click(object sender, EventArgs e)
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
            cmd.CommandText = "Insert into DailyHours (Id, ClockInDate) Values (@id, @clockin)";
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ID.Text));
            cmd.Parameters.AddWithValue("@clockin", Convert.ToDateTime(ClockIn.Text));
            cmd.ExecuteNonQuery();

            Response.Redirect("ClockInOut");

        }

        protected void OutButton_Click(object sender, EventArgs e)
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
            cmd.CommandText = "Update DailyHours Set ClockOutDate = @clockout, HoursWorked = datediff(hour,ClockInDate,@clockout), " +
                "DailyActivities = @activity where Id = @id and DailyLogId = (Select MAX(DailyLogId) from DailyHours)";
            cmd.Parameters.AddWithValue("@clockout", Convert.ToDateTime(ClockOut.Text));
            cmd.Parameters.AddWithValue("activity", Activities.Text);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ID.Text));
            cmd.ExecuteNonQuery();

            Response.Redirect("ClockInOut");
        }
    }
}