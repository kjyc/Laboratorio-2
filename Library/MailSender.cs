using System;
using System.Net;
using System.Net.Mail;

namespace Library
{
    public class MailSender
    {
        public bool sendEmail(string toEmail, string subject, string body, bool isHtml)
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
                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = isHtml;
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
