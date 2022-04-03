using System;
using System.Web.UI;
using Library;
using Domain;

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
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }
    }
}