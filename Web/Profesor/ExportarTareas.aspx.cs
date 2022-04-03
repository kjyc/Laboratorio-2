using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Xml;
using Domain;
using Library;
using Newtonsoft.Json;
using Formatting = Newtonsoft.Json.Formatting;

namespace Web
{
    public partial class ImportarTareas : Page
    {
        User user;
        private DataAccess da = new DataAccess();
        private SqlDataAdapter sda;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";

            if (!Page.IsPostBack)
            {
                sda = da.GetGenericAssignment();
                ds = new DataSet();
                ds.DataSetName = "tareas";
                sda.Fill(ds);
                Session["Adapter"] = sda;
                Session["Data"] = ds;
            }
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("/Inicio.aspx");
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillTable();
        }

        protected void ddlSubjects_DataBound(object sender, EventArgs e)
        {
            FillTable();
        }

        private void FillTable()
        {
            ds = (DataSet)Session["Data"];
            DataTable dt = ds.Tables[0];
            DataView dv = new DataView(dt, "codAsig = '" + ddlSubjects.SelectedValue + "'", "codigo", DataViewRowState.CurrentRows);
            gvGenericAssignments.DataSource = dv;
            gvGenericAssignments.DataBind();
        }

        protected void bExportXML_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".xml");
            ds = (DataSet)Session["Data"];
            DataTable dt = ds.Tables[0];
            dt = dt.Select("[codAsig] = '" + ddlSubjects.SelectedValue + "'").CopyToDataTable();
            ds.Tables.Add(dt);
            dt.TableName = "tarea";
            // Poner los nombres de las columnas en minúsculas.
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                dt.Columns[i].ColumnName = dt.Columns[i].ColumnName.ToLower();
            }
            dt.Columns[0].ColumnMapping = MappingType.Attribute;
            dt.Columns[2].ColumnMapping = MappingType.Hidden;
            dt.Columns[4].SetOrdinal(5);
            dt.WriteXml(filePath);
            ds.Tables.Remove(dt);
            AddNameSpace(filePath);
        }

        protected void bExportJson_Click(object sender, EventArgs e)
        {
            ds = (DataSet)Session["Data"];
            DataTable dt = ds.Tables[0];
            dt = dt.Select("[codAsig] = '" + ddlSubjects.SelectedValue + "'").CopyToDataTable();
            ds.Tables.Add(dt);
            dt.TableName = "tarea";
            // Poner los nombres de las columnas en minúsculas.
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                dt.Columns[i].ColumnName = dt.Columns[i].ColumnName.ToLower();
            }
            dt.Columns.Remove(dt.Columns[2]);
            dt.Columns[3].SetOrdinal(4);
            string json = JsonConvert.SerializeObject(dt, Formatting.Indented);
            ds.Tables.Remove(dt);
            File.WriteAllText(Server.MapPath("../App_Data/" + ddlSubjects.SelectedValue + ".json"), json);
        }

        private void AddNameSpace(string xmlFile)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlFile);
            xmlDoc.DocumentElement.SetAttribute("xmlns:has", "http://ji.ehu.es/has");
            xmlDoc.Save(xmlFile);
        }
    }
}