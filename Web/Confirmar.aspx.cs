using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;

namespace Web
{
    public partial class Confirmar : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (da.connect())
            {
                string email = Request.Params["email"];
                int confirmationNumber = int.Parse(Request.Params["numC"]);

                SqlDataReader dr = da.read("SELECT numconfir FROM Usuarios WHERE email='" + email + "'");
                if (dr.HasRows)
                {
                    dr.Read();

                    if (dr.GetInt32(0) == confirmationNumber)
                    {
                        dr.Close();

                        if (da.execute("UPDATE Usuarios SET confirmado=1 WHERE email='" + email + "';") == 1)
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
                        lMessage.Text = "Ha habido un error al confirmar tu registro.";
                    }
                }
                da.close();
            }
            else
            {
                lMessage.Text = "Ha habido problemas con la conexión. Intentalo más tarde.";
            }
        }
    }
}