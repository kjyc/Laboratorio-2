using System;
using System.Data.SqlClient;
using Library;

namespace Web
{
    public partial class Confirmar : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (da.Connect())
            {
                string email = Request.Params["email"];
                int confirmationNumber = int.Parse(Request.Params["numC"]);

                SqlDataReader dr = da.Read("SELECT numconfir FROM Usuario WHERE email='" + email + "'");
                if (dr.HasRows)
                {
                    dr.Read();

                    if (dr.GetInt32(0) == confirmationNumber)
                    {
                        dr.Close();

                        if (da.Execute("UPDATE Usuario SET confirmado=1 WHERE email='" + email + "'") == 1)
                        {
                            lMessage.Text = "Has confirmado tu registro.";
                        }
                        else
                        {
                            lMessage.Text = "Ha habido un error al confirmar tu registro.";
                        }
                    }
                    else
                    {
                        lMessage.Text = "El número de confirmación es incorrecto.";
                    }
                }
                da.Close();
            }
            else
            {
                lMessage.Text = "Ha habido problemas con la conexión. Intentalo más tarde.";
            }
        }
    }
}