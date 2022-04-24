using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Xml;
using Domain;
using Library;

namespace Web
{
    public partial class ImportarTareasXMLDocument : Page
    {
        private User user;
        private DataAccess da = new DataAccess();
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

        private void FillTable(string filter)
        {
            string filePath = Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".xml");
            System.Diagnostics.Debug.WriteLine(filePath);
            if (File.Exists(filePath))
            {
                Xml1.DocumentSource = filePath;
                if (filter == "codigo")
                {
                    Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareasPorCodigo.xsl");
                }
                else if (filter == "desc")
                {
                    Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareasPorDescripcion.xsl");
                }
                else if (filter == "hEstimadas")
                {
                    Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareasPorHEstimadas.xsl");
                }
                else
                {
                    Xml1.TransformSource = Server.MapPath("../App_Data/VerTablaTareas.xsl");
                }
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
            FillTable("");
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillTable("");
        }

        protected void bImportXML_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".xml");
            if (File.Exists(filePath))
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(filePath);
                XmlNodeList xmlNodeList = xmlDoc.GetElementsByTagName("tarea");
                try
                {
                    DataTable dt = ds.Tables[0];
                    for (int i = 0; i < xmlNodeList.Count; i++)
                    {
                        DataRow dr = dt.NewRow();
                        dr["codigo"] = xmlNodeList[i].Attributes.GetNamedItem("codigo").Value;
                        dr["descripcion"] = xmlNodeList[i].ChildNodes[0].ChildNodes[0].Value;
                        dr["codAsig"] = ddlSubjects.SelectedValue;
                        dr["hEstimadas"] = xmlNodeList[i].ChildNodes[1].ChildNodes[0].Value;
                        dr["tipoTarea"] = xmlNodeList[i].ChildNodes[2].ChildNodes[0].Value;
                        dr["explotacion"] = xmlNodeList[i].ChildNodes[3].ChildNodes[0].Value;
                        dt.Rows.Add(dr);
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

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillTable(ddlFilter.SelectedValue);
        }
    }
}