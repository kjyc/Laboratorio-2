using System;
using Library;
using System.Web.UI.HtmlControls;
using Domain;

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
            if (da.Connect())
            {
                User user = da.GetUser(tbEmail.Text);
                if (user != null)
                {
                    if (!user.IsCorrectPassword(tbPassword.Text))
                    {
                        ShowMessage("La contraseña es incorrecta.");
                    }
                    else if (!user.IsConfirmed)
                    {
                        ShowMessage("El correo no ha sido confirmado.");
                    }
                    else
                    {
                        Session["User"] = user;
                        Session["Email"] = tbEmail.Text;
                        if (user.Role == "Alumno")
                        {
                            Response.Redirect("/Estudiante.aspx");
                        }
                        else if (user.Role == "Profesor")
                        {
                            Response.Redirect("/Profesor.aspx");
                        }
                    }
                }
                else
                {
                    ShowMessage("El correo no está registrado.");
                }
                da.Close();
            }
        }

        private void ShowMessage(string message)
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes["class"] = "alert alert-danger m-0";
            container.Attributes["role"] = "alert";
            container.InnerText = message;
            pMessage.Controls.Add(container);
            pMessage.CssClass = "p-2";
        }
    }
}