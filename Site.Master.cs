using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group_3_MNSS_Payroll_System.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace Group_3_MNSS_Payroll_System
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //***********************Creating roles
            var roleManager = Context.GetOwinContext().Get<ApplicationRoleManager>();
            string name = "employee";
            //***********************Checking if the role is already present
            var search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "1";
                roles.Name = "employee";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "accountant";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "2";
                roles.Name = "accountant";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "manager";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "3";
                roles.Name = "manager";
                IdentityResult result = roleManager.Create(roles);
            }

            //***********************Creating accountant user
            var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
            string email = "accountant@gmail.com";
            //***********************Check if user is already present
            var search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "accountant@gmail.com",
                    Email = "accountant@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Acc123!"); //Password
                userManager.AddToRole(user.Id, "accountant");
            }

            //***********************Creating admin user
            email = "manager@gmail.com";
            //***********************Check if user is already present
            search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "manager@gmail.com",
                    Email = "manager@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Man123!"); //Password
                userManager.AddToRole(user.Id, "manager");
            }

            //***********************Creating employee user
            email = "employee@gmail.com";
            //***********************Check if user is already present
            search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "employee@gmail.com",
                    Email = "employee@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Emp123!"); //Password
                userManager.AddToRole(user.Id, "employee");
            }


            //***********************Make navigation invisible
            employee1.Visible = false;
            employee2.Visible = false;
            employee3.Visible = false;
            employee4.Visible = false;
            employee5.Visible = false;

            accountant1.Visible = false;
            accountant2.Visible = false;

            manager1.Visible = false;
            manager2.Visible = false;
            manager3.Visible = false;
            manager4.Visible = false;

            //***********************Make navigation visible depending on user role
            if (Context.User.IsInRole("employee"))
            {
                employee1.Visible = true;
                employee2.Visible = true;
                employee3.Visible = true;
                employee4.Visible = true;
                employee5.Visible = true;
            }

            if (Context.User.IsInRole("accountant"))
            {
                accountant1.Visible = true;
                accountant2.Visible = true;
            }

            if (Context.User.IsInRole("manager"))
            {
                manager1.Visible = true;
                manager2.Visible = true;
                manager3.Visible = true;
                manager4.Visible = true;
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}