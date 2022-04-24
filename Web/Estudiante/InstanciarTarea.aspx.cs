using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Library;
using Domain;
using System.Collections.Generic;

namespace Web
{
    public partial class InstanciarTarea : Page
    {
        private DataAccess da = new DataAccess();
        private User user;
        private SqlDataAdapter sda;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = (User)Session["User"];
                lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";
            }

            if (Page.IsPostBack)
            {
                ds = (DataSet)Session["Data"];
            }
            else
            {
                sda = da.GetStudentAssignments();
                ds = new DataSet();
                sda.Fill(ds);
                Session["Adapter"] = sda;
                Session["Data"] = ds;
                FillTextBox();
                FillTable();
            }
        }

        private void FillTextBox()
        {
            tbEmail.Text = user.Email;
            tbAssignment.Text = Request.Params["cod"];
            tbEstimatedHours.Text = Request.Params["he"];
        }

        private void FillTable()
        {
            DataTable dt = ds.Tables[0];
            UpdateTable(dt);
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                int n = (int)Application["NumberOfConnectedStudents"] - 1;
                Application["NumberOfConnectedStudents"] = n;
                List<String> users = (List<string>)Application["ListOfStudents"];
                users.Remove(user.Email);
                Application["ListOfStudents"] = users;
            }
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }

        protected void bCreateAssignment_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.NewRow();
                dr["email"] = tbEmail.Text;
                dr["codTarea"] = tbAssignment.Text;
                dr["hEstimadas"] = tbEstimatedHours.Text;
                dr["hReales"] = tbActualHours.Text;
                dt.Rows.Add(dr);
                sda = (SqlDataAdapter)Session["Adapter"];
                sda.Update(ds);
                ds.AcceptChanges();
                UpdateTable(dt);
                lMessage.Text = "Instanciación correcta";
            }
            catch (Exception)
            {
                lMessage.Text = "Tarea ya instanciada";
            }
        }

        private void UpdateTable(DataTable dt)
        {
            DataView dv = new DataView(dt, "email = '" + user.Email + "'", "codTarea", DataViewRowState.CurrentRows);
            gvTareasEstudiante.DataSource = dv;
            gvTareasEstudiante.DataBind();
        }
    }
}