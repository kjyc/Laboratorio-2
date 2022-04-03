using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace Web
{
    public partial class Profesor : System.Web.UI.Page
    {
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }
    }
}