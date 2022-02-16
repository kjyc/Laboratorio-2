using System;
using Library;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace Web
{
    public partial class Inicio : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bLogin_Click(object sender, EventArgs e)
        {
            if (da.connect())
            {
                SqlDataReader dr = da.read("SELECT pass, confirmado FROM Usuarios WHERE email='" + tbEmail.Text + "';");
                if (dr.HasRows)
                {
                    dr.Read();
                    if (dr.GetString(0) == tbPassword.Text && dr.GetBoolean(1))
                    {
                        dr.Close();
                        Response.Redirect("http://hads22-02.azurewebsites.net/Menu.aspx");
                    }
                    else
                    {
                        dr.Close();
                        HtmlGenericControl container = new HtmlGenericControl("div");
                        container.Attributes["class"] = "alert alert-danger m-0";
                        container.Attributes["role"] = "alert";
                        container.InnerText = "El correo o la contraseña es incorrecta.";
                        pMessage.Controls.Add(container);
                        pMessage.CssClass = "p-2";
                    }
                }
                da.close();
            }
        }
    }
}