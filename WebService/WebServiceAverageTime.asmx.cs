using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebService
{
    /// <summary>
    /// Descripción breve de WebServiceAverageTime
    /// </summary>
    [WebService(Namespace = "http://www.ehu.es/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceAverageTime : System.Web.Services.WebService
    {


        [WebMethod]
        public string GetAverageTimePerSubject(string subject)
        {
            SqlConnection connection = new SqlConnection("Server=tcp:hads2202.database.windows.net,1433;Initial Catalog=HADS22-02;Persist Security Info=False;User ID=kyovera001@ikasle.ehu.eus@hads2202;Password=Hads2202;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            string query = "SELECT AVG(ET.hReales) FROM TareaGenerica TG INNER JOIN EstudianteTarea ET ON TG.codigo=ET.codTarea WHERE TG.codAsig='" + subject + "';";
            string response = "";
            SqlDataReader dr = null;
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);

                dr = command.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    response = dr.GetInt32(0).ToString();
                    dr.Close();
                }
            }
            catch (Exception e)
            {
                return response;
            }
            finally
            {
                connection.Close();
            }

            return response;
        }
    }
}
