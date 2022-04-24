using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using Domain;
using Library;

namespace Web
{
    public partial class ImportarTareasDataSet : Page
    {
        private DataAccess da = new DataAccess();
        private User user;
        private SqlDataAdapter sda;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";

            if (Page.IsPostBack)
            {
                ds = (DataSet)Session["Data"];
            }
            else
            {
                sda = da.GetGenericAssignment();
                ds = new DataSet();
                sda.Fill(ds);
                Session["Adapter"] = sda;
                Session["Data"] = ds;
            }
        }

        private void FillTable()
        {
            string filePath = Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".xml");
            if (File.Exists(filePath))
            {
                Xml1.DocumentSource = filePath;
                Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareas.xsl");
                lMessage.Text = "";
            }
            else
            {
                lMessage.Text = "No hay un documento xml de esta asigantura.";
            }
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                int n = (int)Application["NumberOfConnectedTeachers"] - 1;
                Application["NumberOfConnectedTeachers"] = n;
                List<String> users = (List<string>)Application["ListOfTeachers"];
                users.Remove(user.Email);
                Application["ListOfTeachers"] = users;
            }
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }

        protected void ddlSubjects_DataBound(object sender, EventArgs e)
        {
            FillTable();
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillTable();
        }

        protected void bImportDataSet_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".xml");
            if (File.Exists(filePath))
            {
                try
                {
                    ds = (DataSet)Session["Data"];
                    DataSet data = new DataSet();
                    data.ReadXml(filePath);

                    for (int i = 0; i < data.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].NewRow();
                        dr["codigo"] = data.Tables[0].Rows[i][4];
                        dr["descripcion"] = data.Tables[0].Rows[i][0];
                        dr["codAsig"] = ddlSubjects.SelectedValue;
                        dr["hEstimadas"] = data.Tables[0].Rows[i][1];
                        dr["tipoTarea"] = data.Tables[0].Rows[i][2];
                        dr["explotacion"] = data.Tables[0].Rows[i][3];
                        ds.Tables[0].Rows.Add(dr);
                    }
                    sda = (SqlDataAdapter)Session["Adapter"];
                    int numRows = sda.Update(ds);
                    ds.AcceptChanges();
                    lMessage.Text = "Se han insertado " + numRows + " tareas.";
                }
                catch (Exception)
                {
                    ds.RejectChanges();
                    lMessage.Text = "Error. Tareas ya importadas.";
                }
            }
        }

    }
}