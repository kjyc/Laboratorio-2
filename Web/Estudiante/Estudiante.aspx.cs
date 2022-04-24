using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace Web
{
    public partial class Estudiante : System.Web.UI.Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = (User)Session["User"];
                lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";
            }
            UpdateUserConnectedContentTemplate();
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

        protected void TimerUsersConnected_Tick(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            UpdateUserConnectedContentTemplate();
        }

        private void UpdateUserConnectedContentTemplate()
        {
            int numberOfStudents = (int)Application["NumberOfConnectedStudents"];
            int numberOfTeachers = (int)Application["NumberOfConnectedTeachers"];
            List<String> listOfStudents = (List<string>)Application["ListOfStudents"];
            List<String> listOfTeachers = (List<string>)Application["ListOfTeachers"];

            lNumberOfTeachers.Text = numberOfTeachers + (numberOfTeachers > 1 || numberOfTeachers == 0 ? " profesores." : " profesor.");
            lNumberOfStudents.Text = numberOfStudents + (numberOfStudents > 1 || numberOfStudents == 0 ? " estudiantes." : " estudiante.");

            lbStudent.Items.Clear();
            foreach (String student in listOfStudents)
            {
                lbStudent.Items.Add(student);
            }

            lbTeacher.Items.Clear();
            foreach (String teacher in listOfTeachers)
            {
                lbTeacher.Items.Add(teacher);
            }
        }
    }
}