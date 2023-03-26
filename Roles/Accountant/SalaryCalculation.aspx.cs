using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Roles.Accountant
{
    public partial class SalaryCalculation : System.Web.UI.Page
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
            cmd.CommandText = "Select Amount from PaymentRequest Where Id = @id";
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            string amount = cmd.ExecuteScalar().ToString();

            amount1.Text = amount;
            amount2.Text = amount;
            amount3.Text = amount;
        }

        protected void CalDeduct_Click(object sender, EventArgs e)
        {
            //calculates the deduction
            double rate = Convert.ToDouble(rate1.Text);
            double amount = Convert.ToDouble(amount1.Text);
            double deduction = rate * amount;

            //Displays the result
            deduction1.Text = deduction.ToString();
            deduction3.Text = deduction.ToString();
        }

        protected void Select_Click(object sender, EventArgs e)
        {
            //If the employee is not given a bonus
            if (BonusStatus.Text == "Rejected")
            {
                //the percentage is 0 and the textbox cannot be edited
                percent2.Text = "0.0";
                percent2.ReadOnly= true;
            }
            else
            {
                //The textbox can be edited
                percent2.ReadOnly= false;
            }
        }

        protected void CalBonus_Click(object sender, EventArgs e)
        {
            //Calculates the bonus
            double percent = Convert.ToDouble(percent2.Text);
            double amount = Convert.ToDouble(amount2.Text);
            double bonus = percent * amount;

            //Displays the amount
            bonus2.Text = bonus.ToString();
            bonus3.Text = bonus.ToString();
        }

        protected void CalSalary_Click(object sender, EventArgs e)
        {
            //Calculates the salary
            double amount = Convert.ToDouble(amount3.Text);
            double deduction = Convert.ToDouble(deduction3.Text);
            double bonus = Convert.ToDouble(bonus3.Text);
            double final = amount - deduction + bonus;

            //Displays the amount
            final3.Text = final.ToString();

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
            cmd.CommandText = "Insert into PaymentTransaction (Id, PayRequestID, Amount, TaxRate, TaxDeduction, BonusPercentage, Bonus, FinalSalary) " +
                "Values (@id,@pid,@amt,@rate,@deduct,@percent,@bonus,@final)";
            //Adding parameters from textbox values
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
            cmd.Parameters.AddWithValue("@amt", amount);
            cmd.Parameters.AddWithValue("@rate", Convert.ToDouble(rate1.Text));
            cmd.Parameters.AddWithValue("@deduct", deduction);
            cmd.Parameters.AddWithValue("@percent", Convert.ToDouble(percent2.Text));
            cmd.Parameters.AddWithValue("@bonus", bonus);
            cmd.Parameters.AddWithValue("@final", final);
            //Execute the query
            cmd.ExecuteNonQuery();


            cmd.CommandText = "Update PaymentRequest Set Status = @status Where Id = @id and PayRequestID = @pid";
            cmd.Parameters.AddWithValue("@status", "Completed");
            cmd.ExecuteNonQuery();
        }
    }
}