using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace Web
{
    public partial class Profesor : System.Web.UI.Page
    {
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = (User)Session["User"];
                lUsername.Text = "Hola, " + user.Name + " " + user.Lastname + " (" + user.Email + ")";
            }
            UpdateUserConnectedContentTemplate();
            UpdateTeacherConnectedPanel();
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

        protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
        {
            if (TabContainer1.ActiveTabIndex == 0)
            {
                UpdateTeacherConnectedPanel();
            }
            else
            {
                UpdateStudentConnectedPanel();
            }
        }

        private void UpdateStudentConnectedPanel()
        {
            int numberOfStudents = (int)Application["NumberOfConnectedStudents"];
            List<String> listOfStudents = (List<string>)Application["ListOfStudents"];

            Label2.Text = numberOfStudents + (numberOfStudents > 1 || numberOfStudents == 0 ? " estudiantes." : " estudiante.");

            ListBox2.Items.Clear();
            foreach (String student in listOfStudents)
            {
                ListBox2.Items.Add(student);
            }
        }

        private void UpdateTeacherConnectedPanel()
        {
            int numberOfTeachers = (int)Application["NumberOfConnectedTeachers"];
            List<String> listOfTeachers = (List<string>)Application["ListOfTeachers"];

            Label1.Text = numberOfTeachers + (numberOfTeachers > 1 || numberOfTeachers == 0 ? " profesores." : " profesor.");

            ListBox1.Items.Clear();
            foreach (String teacher in listOfTeachers)
            {
                ListBox1.Items.Add(teacher);
            }
        }
    }
}