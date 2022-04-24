using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["NumberOfConnectedStudents"] = 0;
            Application["NumberOfConnectedTeachers"] = 0;
            Application["ListOfStudents"] = new List<String>();
            Application["ListOfTeachers"] = new List<String>();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            Application.Remove("NumberOfConnectedStudents");
            Application.Remove("NumberOfConnectedTeachers");
            Application.Remove("ListOfStudents");
            Application.Remove("ListOfTeachers");
        }
    }
}