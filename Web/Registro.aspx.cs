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
        private MailSender ms = new MailSender();
        private Utilities u = new Utilities();
        private es.ehusw.Matriculas wsm = new es.ehusw.Matriculas();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void bRegistrar_Click(object sender, EventArgs e)
        {
            if (da.Connect())
            {
                Random r = new Random();

                string email = tbEmail.Text;
                string name = tbName.Text;
                string lastname = tbLastname.Text;
                int confirmationNumber = r.Next(100000, 1000000);
                string rol = rbRol.Text;
                string password = u.GetMD5Hash(tbPassword.Text);
                int codePassword = r.Next(100000, 1000000);

                if (da.Count("SELECT count(*) FROM Usuario WHERE email='" + email + "'") != 1)
                {
                    if (da.Execute("INSERT INTO Usuario VALUES ('" + email + "', '" + name + "', '" + lastname + "', " + confirmationNumber + ", 0, '" + rol + "', '" + password + "', " + codePassword + ")") == 1)
                    {
                        string subject = "Confirmación de registro";
                        string body = "<html><head></head><body><h2>Haz click en el enlace!</h2><a href='http://hads22-02.azurewebsites.net/Confirmar.aspx?email=" + email + "&numC=" + confirmationNumber + "'>Enlace de confirmación.</a></body></html>";
                        ms.sendEmail(email, subject, body, true);
                        showMessage("Se ha registrado correctamente.", true);
                    }
                    else
                    {
                        showMessage("Ha ocurrido algún error al registrarte.", false);
                    }
                }
                else
                {
                    showMessage("El correo ya está registrado.", false);
                }

                da.Close();
            }
        }



        public void showMessage(string message, bool isOk)
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes["class"] = isOk ? "alert alert-success m-0" : "alert alert-danger m-0";
            container.Attributes["role"] = "alert";
            container.InnerText = message;
            pMessage.Controls.Add(container);
            pMessage.CssClass = "p-2";
        }

        protected void tbEmail_TextChanged(object sender, EventArgs e)
        {
            string result = wsm.comprobar(tbEmail.Text);
            if (result == "SI")
            {
                lMessageAjax.Text = "Es un correo válido.";
                bRegistrar.Enabled = true;
            }
            else if (result == "NO")
            {
                lMessageAjax.Text = "No es un correo válido.";
                bRegistrar.Enabled = false;
            }
            else 
            {
                lMessageAjax.Text = "";
                bRegistrar.Enabled = false;
            }
        }
    }
}