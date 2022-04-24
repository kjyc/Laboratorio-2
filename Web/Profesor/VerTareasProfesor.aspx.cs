using System;
using System.Web.UI;
using Library;
using Domain;
using System.Collections.Generic;

namespace Web
{
    public partial class VerTareasProfesor : Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            
            lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";
        }

        protected void bAddAssignment_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Profesor/InsertarTarea.aspx");
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
    }
}