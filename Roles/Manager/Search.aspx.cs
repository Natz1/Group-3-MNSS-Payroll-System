using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Permissions.Manager
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Viewing(object sender, EventArgs e)
        {
            //Get the id of the selected employee
            int id = Convert.ToInt32(EmpList.DataKeys[EmpList.SelectedIndex].Value);

            //Pass id to new page
            Response.Redirect("EmployeeDisplay?id=" + id);
        }
    }
}