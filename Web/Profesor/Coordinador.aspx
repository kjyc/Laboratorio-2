<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinador.aspx.cs" Inherits="Web.VerDedicacionMediaDeAlumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ver dedicación media</title>
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
            <div class="row text-center bg-secondary rounded align-items-center mt-4 p-2">
                <div class="col-2">
                    <a href="/Profesor/Profesor.aspx" class="btn btn-dark">Atras</a>
                </div>
                <div class="col-8 text-light">
                    <h2>Profesor</h2>
                    <h2>Ver dedicación media por asignatura</h2>
                </div>
                <div class="col-2">
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row p-5">
                        <div class="form-group">
                            <label>Seleccionar asignatura:</label>
                            <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="True" DataSourceID="sdsSubjects" DataTextField="codigo" DataValueField="codigo" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="sdsSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT [codigo] FROM [Asignatura]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="row p-5">
                        <asp:Label ID="lResponse" runat="server" Text="Selecciona una asignatura." CssClass="h5"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
