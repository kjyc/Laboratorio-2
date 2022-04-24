<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanciarTarea.aspx.cs" Inherits="Web.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Instanciar Tarea</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row bg-secondary rounded align-items-center p-2">
                <div class="col-10">
                    <asp:Label ID="lUsername" runat="server" Text="" CssClass="text-light h6"></asp:Label>
                </div>
                <div class="col-2">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row text-center bg-secondary rounded align-items-center">
                <div class="col-2">
                    <a href="/Estudiante/VerTareasEstudiante.aspx" class="btn btn-dark">Atras</a>
                </div>
                <div class="col-8 text-light">
                    <h1>Alumnos</h1>
                    <h1>Instanciar Tarea Genérica</h1>
                </div>
                <div class="col-2">
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-8">
                    <div class="p-2">
                        <label class="form-label">Usuario</label>
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" Enabled="False" />
                    </div>
                    <div class="p-2">
                        <label class="form-label">Tarea</label>
                        <asp:TextBox ID="tbAssignment" runat="server" CssClass="form-control" Enabled="False" />
                    </div>
                    <div class="p-2">
                        <label class="form-label">Horas Estimadas</label>
                        <asp:TextBox ID="tbEstimatedHours" runat="server" CssClass="form-control" Enabled="False" />
                    </div>
                    <div class="p-2">
                        <label class="form-label">Horas Reales</label>
                        <asp:TextBox ID="tbActualHours" runat="server" CssClass="form-control" />
                    </div>
                    <div class="p-2">
                        <asp:Button ID="bCreateAssignment" runat="server" Text="Crear tarea" CssClass="btn btn-primary" OnClick="bCreateAssignment_Click" />
                    </div>
                    <div class="p-2">
                        <asp:Label ID="lMessage" runat="server" CssClass="h4" Text="" />
                    </div>
                </div>
            </div>
            <div class="row p-5">
                <asp:GridView ID="gvTareasEstudiante" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField HeaderText="Email" DataField="email" />
                        <asp:BoundField HeaderText="Código Tarea" DataField="codTarea" />
                        <asp:BoundField HeaderText="Horas Estimadas" DataField="hEstimadas" />
                        <asp:BoundField HeaderText="Horas Reales" DataField="hReales" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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
