using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Domain;
using System.Data;
using System.Diagnostics;

namespace Library
{
    public class DataAccess
    {
        private SqlConnection connection = new SqlConnection();
        private SqlCommand command = new SqlCommand();
        private string connectionString = "Server=tcp:hads2202.database.windows.net,1433;Initial Catalog=HADS22-02;Persist Security Info=False;User ID=kyovera001@ikasle.ehu.eus@hads2202;Password=Hads2202;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

        public bool Connect()
        {
            try
            {
                connection.ConnectionString = connectionString;
                connection.Open();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        public void Close()
        {
            connection.Close();
        }

        public int Execute(string query)
        {
            int numRows;
            try
            {
                command = new SqlCommand(query, connection);
                numRows = command.ExecuteNonQuery();
            }
            catch (Exception)
            {
                return -1;
            }
            return numRows;
        }

        public SqlDataReader Read(string query)
        {
            SqlDataReader dr;
            try
            {
                command = new SqlCommand(query, connection);
                dr = command.ExecuteReader();
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.ToString());
                Debug.WriteLine(e.Message);
                return null;
            }
            return dr;
        }

        public int Count(string query)
        {
            int i = 0;
            try
            {
                command = new SqlCommand(query, connection);
                i = (int)command.ExecuteScalar();
                return i;
            }
            catch (Exception)
            {
                return i;
            }
        }

        public User GetUser(string email)
        {
            User user = null;
            SqlDataReader dr;
            try
            {
                command = new SqlCommand("SELECT email, nombre, apellidos, tipo, pass, confirmado FROM Usuario WHERE email='" + email + "'", connection);
                dr = command.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    user = new User(dr.GetString(0), dr.GetString(1), dr.GetString(2), dr.GetString(3), dr.GetString(4), dr.GetBoolean(5));
                    dr.Close();
                }
                return user;
            }
            catch (Exception)
            {
                return user;
            }
        }

        public DataSet GetStudentSubjects(string email)
        {
            connection = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT codigoAsig FROM GrupoClase WHERE codigo IN (SELECT grupo FROM EstudianteGrupo AS EG INNER JOIN Usuario AS U ON EG.email=U.email  WHERE U.email='" + email + "' AND U.tipo='Alumno')", connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet GetGenericStudentAssignments(string email)
        {
            connection = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT codigo, descripcion, hEstimadas, tipoTarea, codAsig FROM TareaGenerica WHERE codigo NOT IN (SELECT codTarea FROM EstudianteTarea WHERE email='" + email + "') AND explotacion='True'", connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public SqlDataAdapter GetStudentAssignments()
        {
            connection = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT email, codTarea, hEstimadas, hReales FROM EstudianteTarea", connection);
            SqlCommandBuilder cmd = new SqlCommandBuilder(da);
            return da;
        }

        public SqlDataAdapter GetGenericAssignment()
        {
            connection = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TareaGenerica", connection);
            SqlCommandBuilder cmd = new SqlCommandBuilder(da);
            return da;
        }

        public int CreateAssignment(string code, string description, string subjectCode, string estimatedHours, string type)
        {
            int numRows;
            try
            {
                connection = new SqlConnection();
                connection.ConnectionString = connectionString;
                connection.Open();
                command = new SqlCommand("INSERT INTO TareaGenerica VALUES ('" + code + "', '" + description + "', '" + subjectCode + "', " + estimatedHours + ", 0, '" + type + "')", connection);
                numRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception)
            {
                return -1;
            }
            return numRows;
        }
    }
}
