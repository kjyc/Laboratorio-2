using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace Web
{
    public partial class Estadisticas : System.Web.UI.Page
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

        protected void bLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Inicio.aspx");
        }
    }
}