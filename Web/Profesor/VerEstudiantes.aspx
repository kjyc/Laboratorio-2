<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerEstudiantes.aspx.cs" Inherits="Web.VerEstudiantes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ver Estudiantes</title>
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
                    <h2>Ver estudiantes por asignatura</h2>
                </div>
                <div class="col-2">
                </div>
            </div>
            <div class="row p-5">
                <asp:GridView ID="gvEstudiantes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="email" DataSourceID="sdsEstudiantes" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
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
                <asp:SqlDataSource ID="sdsEstudiantes" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT email, nombre, apellidos  FROM Usuario WHERE tipo='Alumno'" UpdateCommand="UPDATE Usuario SET email=@email, nombre=@nombre, apellidos=@apellidos WHERE email=@email" DeleteCommand="DELETE FROM Usuario WHERE email=@email"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
