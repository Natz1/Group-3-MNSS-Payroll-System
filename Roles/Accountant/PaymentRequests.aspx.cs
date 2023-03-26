using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Accountant
{
    public partial class PaymentRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Viewing(object sender, EventArgs e)
        {
            //Get the id of the selected employee
            int id = Convert.ToInt32(RequestList.DataKeys[RequestList.SelectedIndex].Value);
            //get the id of the payment request
            int pid = (int)RequestList.SelectedDataKey.Values["PayRequestID"];

            //Pass id and pid to new page
            Response.Redirect("SalaryCalculation?id=" + id + "&pid=" + pid);
        }
    }
}