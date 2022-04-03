using System;
using Library;
using System.Web.UI.HtmlControls;
using Domain;
using System.Web.Security;

namespace Web
{
    public partial class Inicio : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        private Utilities u = new Utilities();
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
                    if (!user.IsCorrectPassword(u.GetMD5Hash(tbPassword.Text)))
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
                            FormsAuthentication.SetAuthCookie("students", false);
                            Response.Redirect("/Estudiante/Estudiante.aspx");
                        }
                        else if (user.Role == "Profesor")
                        {
                            if (user.Email == "vadillo@ehu.es")
                            {
                                FormsAuthentication.SetAuthCookie("coordinator", false);
                            }
                            else if (user.Email == "admin@ehu.es") 
                            {
                                FormsAuthentication.SetAuthCookie("admin", false);
                            }
                            else
                            {
                                FormsAuthentication.SetAuthCookie("teachers", false);
                            }
                            Response.Redirect("/Profesor/Profesor.aspx");
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