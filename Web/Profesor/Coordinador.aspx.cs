using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace Web
{
    public partial class VerDedicacionMediaDeAlumnos : System.Web.UI.Page
    {
        private User user;
        private hads.webservices.WebServiceAverageTime wsat = new hads.webservices.WebServiceAverageTime();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = (User)Session["User"];
                lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";

            }
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                int n = (int)Application["NumberOfConnectedTeachers"] - 1;
                Application["NumberOfConnectedTeachers"] = n;
                List<String> users = (List<string>)Application["ListOfTeachers"];
                users.Remove(user.Email);
                Application["ListOfTeachers"] = users;
            }
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            string result = wsat.GetAverageTimePerSubject(ddlSubjects.SelectedValue);
            if (result != "")
            {
                lResponse.Text = "La media de dedicación de " + ddlSubjects.SelectedValue + " es: " + result + " horas.";
            }
            else 
            {
                lResponse.Text = "No hay registro de esta asignatura.";
            }
        }
    }
}