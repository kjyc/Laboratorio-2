using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using Library;

namespace Web
{
    public partial class Registro : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            da.connect();
        }

        protected void bRegistrar_Click(object sender, EventArgs e)
        {
            Random r = new Random();

            string email = tbEmail.Text;
            string name = tbName.Text;
            string lastname = tbLastname.Text;
            int confirmationNumber = r.Next(100000, 1000000);
            string rol = rbRol.Text;
            string password = tbPassword.Text;
            int codePassword = r.Next(100000, 1000000);

            if (da.count("SELECT count(*) FROM Usuarios WHERE email='" + email + "'") != 1)
            {
                da.execute("INSERT INTO Usuarios VALUES ('" + email + "', '" + name + "', '" + lastname + "', " + confirmationNumber + ", 0, '" + rol + "', '" + password + "', " + codePassword + ")");
                sendConfirmationEmail(email, confirmationNumber);
            }
            else 
            {
                HtmlGenericControl container = new HtmlGenericControl("div");
                container.Attributes["class"] = "alert alert-danger m-0";
                container.Attributes["role"] = "alert";
                container.InnerText = "El correo introducido ya está en uso.";
                pMessage.Controls.Add(container);
                pMessage.CssClass = "p-2";
            }
            
        }

        private Boolean sendConfirmationEmail(string toEmail, int confirmationNumber)
        {
            try
            {
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
                message.Subject = "Confirmación de registro";
                message.Body = "<html><head></head><body><h2>Haz click en el enlace!</h2><a href='http://hads22-02.azurewebsites.net/Confirmar.aspx?email=" + toEmail + "&numC=" + confirmationNumber + "'>Enlace de confirmación.</a></body></html>";
                message.IsBodyHtml = true;
                smtp.Send(message);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}