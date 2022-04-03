<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareasXMLDocument.aspx.cs" Inherits="Web.ImportarTareasXMLDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Importar Tareas</title>
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
                    <h2>Importar Tareas Genéricas</h2>
                </div>
                <div class="col-2">
                </div>
            </div>
            <div class="row p-5 text-center">
                <div class="col-6">
                    <div class="form-group">
                        <label>Seleccionar asignatura:</label>
                        <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="True" DataSourceID="sdsSubjects" DataTextField="codigoAsig" DataValueField="codigoAsig" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged" OnDataBound="ddlSubjects_DataBound">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="GetTeacherSubjects" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="email" SessionField="Email" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-6">
                    <asp:Button ID="bImportXML" runat="server" Text="Importar (XML)" CssClass="btn btn-primary" OnClick="bImportXML_Click" />
                </div>
            </div>
            <div class="row p-5">
                <div class="form-group mb-4">
                    <label>Filtrar por:</label>
                    <asp:DropDownList ID="ddlFilter" runat="server" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="codigo">Código</asp:ListItem>
                        <asp:ListItem Value="desc">Descripción</asp:ListItem>
                        <asp:ListItem Value="hEstimadas">H. Estimadas</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                <asp:Label ID="lMessage" runat="server" Text="" CssClass="h3"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
