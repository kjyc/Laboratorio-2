<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="Web.Profesor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Profesor</title>
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
            <div class="row text-center mt-4" style="height: 550px">
                <div class="col-3 h-100 border-start border-top border-bottom border-secondary rounded-start">
                    <div class="row p-3">
                        <a href="/Profesor/VerTareasProfesor.aspx" class="btn btn-secondary">Tareas</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/Profesor/ImportarTareasXMLDocument.aspx" class="btn btn-secondary">Importar XML</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/Profesor/ExportarTareas.aspx" class="btn btn-secondary">Exportar Tareas</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/Profesor/ImportarTareasDataSet.aspx" class="btn btn-secondary">Importar (DataSet)</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/Profesor/VerEstudiantes.aspx" class="btn btn-secondary">Ver Estudiantes</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/Profesor/Coordinador.aspx" class="btn btn-secondary">Ver Dedicación</a>
                    </div>
                </div>
                <div class="col-6 h-100 border-start border-top border-bottom border-secondary ">
                    <div class="row p-4">
                        <h1>Gestión Web de Tareas-Dedicación</h1>
                    </div>
                    <div class="row">
                        <h2>Profesor</h2>
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
                                <asp:ListBox ID="lbTeacher" runat="server" Height="100"></asp:ListBox>
                            </div>
                            <div class="row m-2 text-start">
                                <asp:Label ID="lNumberOfStudents" runat="server" Text="0 estudiantes."></asp:Label>
                                <asp:ListBox ID="lbStudent" runat="server" Height="100"></asp:ListBox>
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
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" OnActiveTabChanged="TabContainer1_ActiveTabChanged">
                                <ajaxToolkit:TabPanel runat="server" HeaderText="Profesor">
                                    <ContentTemplate>
                                        <div class="row m-1">
                                            <asp:Label ID="Label1" runat="server" Text="0 profesores."></asp:Label>
                                            <asp:ListBox ID="ListBox1" runat="server" Height="100"></asp:ListBox>
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                <ajaxToolkit:TabPanel runat="server" HeaderText="Estudiante">
                                    <ContentTemplate>
                                        <div class="row m-1">
                                            <asp:Label ID="Label2" runat="server" Text="0 estudiantes."></asp:Label>
                                            <asp:ListBox ID="ListBox2" runat="server" Height="100"></asp:ListBox>
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                            </ajaxToolkit:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
