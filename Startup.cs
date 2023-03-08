using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Group_3_MNSS_Payroll_System.Startup))]
namespace Group_3_MNSS_Payroll_System
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
