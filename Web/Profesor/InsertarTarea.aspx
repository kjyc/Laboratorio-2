<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertarTarea.aspx.cs" Inherits="Web.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Insertar Tarea</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container mt-5">
            <div class="row text-center bg-secondary rounded align-items-center">
                <div class="col-2">
                    <a href="/Profesor/VerTareasProfesor.aspx" class="btn btn-dark">Atras</a>
                </div>
                <div class="col-8 text-light">
                    <h1>Profesor</h1>
                    <h1>Insertar Tarea Genérica</h1>
                </div>
                <div class="col-2">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-8">
                    <div class="p-2">
                        <label class="form-label">Código</label>
                        <asp:TextBox ID="tbCode" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvCode" Display="Dynamic" ControlToValidate="tbCode" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce el código.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <div class="p-2">
                        <label class="form-label">Descripción</label>
                        <asp:TextBox ID="tbDescription" runat="server" CssClass="form-control"/>
                    </div>
                    <div class="p-2">
                        <label class="form-label">Asignatura</label>
                        <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="form-select" DataSourceID="sdsSubjects" DataTextField="codigoAsig" DataValueField="codigoAsig"/>
                        <asp:SqlDataSource ID="sdsSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT codigoAsig FROM GrupoClase WHERE codigo IN (SELECT codigoGrupo FROM ProfesorGrupo AS PG INNER JOIN Usuario AS U ON PG.email=U.email  WHERE U.email=@email AND U.tipo='profesor')">
                            <SelectParameters>
                                <asp:SessionParameter Name="email" SessionField="Email" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="p-2">
                        <label class="form-label">Horas Estimadas</label>
                        <asp:TextBox ID="tbEstimatedHours" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                    <div class="p-2">
                        <label class="form-label">Tipo</label>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select">
                            <asp:ListItem>Laboratorio</asp:ListItem>
                            <asp:ListItem>Trabajo</asp:ListItem>
                            <asp:ListItem>Ejercicio</asp:ListItem>
                            <asp:ListItem>Examen</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="p-2">
                        <asp:Button ID="bCreateAssignment" runat="server" Text="Crear tarea" CssClass="btn btn-primary" OnClick="bCreateAssignment_Click"/>
                    </div>
                    <div class="p-2">
                        <asp:Label ID="lMessage" runat="server" CssClass="h4" Text=""/>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
