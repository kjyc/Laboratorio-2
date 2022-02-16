using System;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using Library;

namespace Web
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();
        MailSender ms = new MailSender();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bRequestChange_Click(object sender, EventArgs e)
        {
            int code = GetCode(tbEmail.Text);
            string subject = "Cambio de contraseña";
            string body = "<html><head></head><body><p>Utiliza el siguiente código: " + code + "</p></body></html>";
            if (ms.sendEmail(tbEmail.Text, subject, body, true))
            {
                showMessage("Se ha enviado el correo exitosamente.", true, true);
            }
            else
            {
                showMessage("Ha ocurrido algún error al enviar el correo.", false, true);
            }
        }

        public int GetCode(string email)
        {
            int code = -1;
            if (da.connect())
            {
                SqlDataReader dr = da.read("SELECT codpass FROM Usuarios WHERE email='" + email + "';");
                if (dr.HasRows)
                {
                    dr.Read();
                    code = dr.GetInt32(0);
                    dr.Close();
                }
                da.close();
                return code;
            }
            else
            {
                return code;
            }
        }

        protected void bChangePassword_Click(object sender, EventArgs e)
        {
            int code = int.Parse(tbCode.Text);
            string newPassword = tbNewPassword.Text;

            if (da.connect())
            {
                if (da.count("SELECT count(*) FROM Usuarios WHERE codpass=" + code) == 1)
                {
                    Random r = new Random();
                    if (da.execute("UPDATE Usuarios SET pass='" + newPassword + "', codpass=" + r.Next(100000, 1000000) + "  WHERE codpass=" + code) == 1)
                    {
                        showMessage("Se ha cambiado la contraseña.", true, false);
                    }
                    else
                    {
                        showMessage("Ha ocurrido algún error al cambiar la contraseña.", false, false);
                    }
                }
                else
                {
                    showMessage("El código no es válido.", false, false);
                }
                da.close();
            }
        }
        public void showMessage(string message, bool isOk, bool isEmail)
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes["class"] = isOk ? "alert alert-success m-0" : "alert alert-danger m-0";
            container.Attributes["role"] = "alert";
            container.InnerText = message;
            if (isEmail)
            {
                pMessageEmail.Controls.Add(container);
                pMessageEmail.CssClass = "p-2";
            }
            else
            {
                pMessage.Controls.Add(container);
                pMessage.CssClass = "p-2";
            }
        }
    }
}