<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="Web.Estudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Panel de Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row bg-secondary rounded align-items-center p-2">
                <div class="col-10">
                    <asp:Label ID="lUsername" runat="server" Text="" CssClass="text-light h6"></asp:Label>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row text-center" style="height: 550px">
                <div class="col-3 h-100 border-start border-top border-bottom border-secondary rounded-start">
                    <div class="row p-3">
                        <a href="/Estudiante/VerTareasEstudiante.aspx" class="btn btn-secondary">Tareas Genéricas</a>
                    </div>
                </div>
                <div class="col-6 h-100 border-start border-top border-bottom border-secondary">
                    <div class="row p-4">
                        <h1>Gestión Web de Tareas-Dedicación</h1>
                    </div>
                    <div class="row">
                        <h2>Alumno</h2>
                    </div>
                </div>
                <div class="col-3 h-100 border border-secondary rounded-end">
                    <div class="row m-2 bg-secondary rounded p-2">
                        <label class="text-light">Usuarios conectados</label>
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="TimerUsersConnected" runat="server" Interval="5000" OnTick="TimerUsersConnected_Tick" />

                            <div class="row m-2 text-start">
                                <asp:Label ID="lNumberOfTeachers" runat="server" Text="0 profesores."></asp:Label>
                                <asp:ListBox ID="lbTeacher" runat="server" Height="170"></asp:ListBox>
                            </div>
                            <div class="row m-2 text-start">
                                <asp:Label ID="lNumberOfStudents" runat="server" Text="0 estudiantes."></asp:Label>
                                <asp:ListBox ID="lbStudent" runat="server" Height="170"></asp:ListBox>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="row m-2 align-items-center">
                                <img src="../Images/loading.gif" style="width: 20%; height: auto;" />
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
