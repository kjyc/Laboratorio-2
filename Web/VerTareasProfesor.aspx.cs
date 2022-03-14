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
            if (Session["User"] != null && Session["Email"] != null)
            {
                user = (User)Session["User"];
            }
            else
            {
                Response.Redirect("/Inicio.aspx");
            }
        }

        protected void bAddAssignment_Click(object sender, EventArgs e)
        {
            Response.Redirect("/InsertarTarea.aspx");
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Inicio.aspx");
        }
    }
}