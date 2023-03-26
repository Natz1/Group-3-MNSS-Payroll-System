using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_3_MNSS_Payroll_System.Roles.Manager
{
    public partial class GeneratePayPeriod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Generate_Click(object sender, EventArgs e)
        {
            GenerateData.Insert();
            Response.Redirect("GeneratePayPeriod");
        }
    }
}