using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library;
using Domain;
using System.Collections.Generic;

namespace Web
{
    public partial class VerTareasEstudiantes : Page
    {
        private DataAccess da = new DataAccess();
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            if (!Page.IsPostBack)
            {
                FillDropDownList();
                FillTable();
            }
        }

        private void FillDropDownList()
        {
            DataSet ds = da.GetStudentSubjects(user.Email);
            ddlSubjects.DataSource = ds;
            ddlSubjects.DataValueField = "codigoAsig";
            ddlSubjects.DataTextField = "codigoAsig";
            ddlSubjects.DataBind();
        }

        private void FillTable()
        {
            DataSet ds = da.GetGenericStudentAssignments(user.Email);
            DataTable dt = ds.Tables[0];
            Session["GenericAssignments"] = dt;
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

        protected void gvTareasGenericasEstudiante_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow selectedRow = gvGenericStudentAssignments.SelectedRow;
            Response.Redirect("/Estudiante/InstanciarTarea.aspx?cod=" + selectedRow.Cells[1].Text + "&he=" + selectedRow.Cells[3].Text);
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["GenericAssignments"];
            UpdateTable(dt);
        }

        private void UpdateTable(DataTable dt)
        {
            DataView dv = new DataView(dt, "codAsig = '" + ddlSubjects.SelectedValue + "'", "codigo", DataViewRowState.CurrentRows);
            gvGenericStudentAssignments.DataSource = dv;
            gvGenericStudentAssignments.DataBind();
        }
    }
}