using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Library
{
    public class DataAccess
    {
        private SqlConnection connection = new SqlConnection();
        private SqlCommand command = new SqlCommand();

        public Boolean connect()
        {
            try
            {
                connection.ConnectionString = "Server=tcp:hads2202.database.windows.net,1433;Initial Catalog=HADS22-02;Persist Security Info=False;User ID=kyovera001@ikasle.ehu.eus@hads2202;Password=Hads2202;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
                connection.Open();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public void close()
        {
            connection.Close();
        }

        public int execute(String query)
        {
            int numRows = 0;
            try
            {
                command = new SqlCommand(query, connection);
                numRows = command.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return -1;
            }
            return numRows;
        }

        public SqlDataReader read(String query)
        {
            SqlDataReader dr;
            try
            {
                command = new SqlCommand(query, connection);
                dr = command.ExecuteReader();
            }
            catch (Exception e)
            {
                return null;
            }
            return dr;
        }

        public int count(String query)
        {
            int i = 0;
            try
            {
                command = new SqlCommand(query, connection);
                i = (int)command.ExecuteScalar();
                return i;
            }
            catch (Exception e)
            {
                return i;
            }
        }
    }
}
