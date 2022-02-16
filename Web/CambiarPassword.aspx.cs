using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using Library;

namespace Web
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bRequestChange_Click(object sender, EventArgs e)
        {
            sendEmail("joelkevin899@gmail.com");
        }

        private Boolean sendEmail(string toEmail)
        {
            try
            {
                int code = GetCode(toEmail);
                MailAddress from = new MailAddress("kjyc.hads@gmail.com", "Kevin Joel Yovera Carlos");
                MailAddress to = new MailAddress(toEmail);
                string password_from = "Hads2202";
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(from.Address, password_from);
                MailMessage message = new MailMessage(from, to);
                message.Subject = "Cambio de contraseña";
                message.Body = "<html><head></head><body><p>Utiliza el siguiente código: " + code + "</p></body></html>";
                message.IsBodyHtml = true;
                smtp.Send(message);
                return true;
            }
            catch (Exception e)
            {
                return false;
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

            if (da.connect()) {
                if (da.count("SELECT count(*) FROM Usuarios WHERE codpass=" + code) == 1)
                {
                    Random r = new Random();
                    int row = da.execute("UPDATE Usuarios SET pass='" + newPassword + "', codpass=" + r.Next(100000, 1000000) + "  WHERE codpass=" + code);
                    if (row == 1)
                    {
                        renderMessage("Se ha cambiado la contraseña.", true);
                    }
                    else 
                    {
                        renderMessage("Ha ocurrido algún error al cambiar la contraseña.", false);
                    }
                }
                else 
                {
                    renderMessage("El código introducido no es correcto.", false);
                }
            }
        }
        private void renderMessage(string message, bool isOk) 
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes["class"] = isOk ? "alert alert-success m-0" : "alert alert-danger m-0";
            container.Attributes["role"] = "alert";
            container.InnerText = message;
            pMessage.Controls.Add(container);
            pMessage.CssClass = "p-2";
        }
    }
}