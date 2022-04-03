using System;
using Library;
using Domain;
using System.Data;
using System.Data.SqlClient;

namespace Web
{
    public partial class InsertarTarea : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {

            user = (User)Session["User"];

        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }

        protected void bCreateAssignment_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter sda = da.GetGenericAssignment();
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.NewRow();
                dr["codigo"] = tbCode.Text;
                dr["descripcion"] = tbDescription.Text;
                dr["codAsig"] = ddlSubjects.SelectedValue;
                dr["hEstimadas"] = tbEstimatedHours.Text;
                dr["explotacion"] = false;
                dr["tipoTarea"] = ddlType.Text;
                dt.Rows.Add(dr);
                sda.Update(ds);
                ds.AcceptChanges();
                lMessage.Text = "Tarea insertada";
            }
            catch (Exception)
            {
                lMessage.Text = "La tarea ya ha sido insertada o ha habido algún problema.";
            }
        }
    }
}