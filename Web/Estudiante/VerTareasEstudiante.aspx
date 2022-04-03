<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerTareasEstudiante.aspx.cs" Inherits="Web.VerTareasEstudiantes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tareas Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row text-center bg-secondary rounded align-items-center">
                <div class="col-10 text-light">
                    <h1>Alumnos</h1>
                    <h1>Gestión de Tareas Genéricas</h1>
                </div>
                <div class="col-2">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row p-5">
                <div class="form-group">
                    <label>Seleccionar asignatura:</label>
                    <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row p-5">
                <asp:GridView ID="gvGenericStudentAssignments" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvTareasGenericasEstudiante_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowHeader="True" ShowSelectButton="True" SelectText="Instanciar" ControlStyle-CssClass="btn btn-primary" />
                        <asp:BoundField HeaderText="Código" DataField="codigo" />
                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                        <asp:BoundField HeaderText="Horas" DataField="hEstimadas" />
                        <asp:BoundField HeaderText="Tipo" DataField="tipoTarea" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#e8e8e8" Font-Bold="True" ForeColor="Black" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
