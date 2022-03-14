<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerTareasProfesor.aspx.cs" Inherits="Web.VerTareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tareas Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row text-center bg-secondary rounded align-items-center">
                <div class="col-2">
                    <a href="/Estadisticas.aspx" class="btn btn-dark">Ver estadisticas</a>    
                </div>
                <div class="col-8 text-light">
                    <h1>Profesor</h1>
                    <h1>Gestión de Tareas Genéricas</h1>
                </div>
                <div class="col-2">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row p-5">
                <div class="form-group">
                    <label>Seleccionar asignatura:</label>
                    <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="True" DataSourceID="sdsSubjects" DataTextField="codigoAsig" DataValueField="codigoAsig">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="GetTeacherSubjects" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="email" SessionField="Email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="row px-5">
                <div class="form-group">
                    <asp:Button ID="bAddAssignment" runat="server" text="Insertar Tarea" CssClass="btn btn-primary" OnClick="bAddAssignment_Click"/>
                </div>
            </div>
            <div class="row p-5">
                <asp:GridView ID="gvGenericTeacherAssignments" runat="server" CssClass="table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="codigo" DataSourceID="sdsGenericAssignments">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:BoundField DataField="codigo" HeaderText="Código" ReadOnly="True" SortExpression="codigo" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                        <asp:BoundField DataField="codAsig" HeaderText="Código Asig." SortExpression="codAsig" />
                        <asp:BoundField DataField="hEstimadas" HeaderText="H. Estimadas" SortExpression="hEstimadas" />
                        <asp:CheckBoxField DataField="explotacion" HeaderText="Explotación" SortExpression="explotacion" />
                        <asp:BoundField DataField="tipoTarea" HeaderText="Tipo" SortExpression="tipoTarea" />
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
                <asp:SqlDataSource ID="sdsGenericAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT * FROM TareaGenerica WHERE codAsig=@assignmentCode" UpdateCommand="UPDATE TareaGenerica SET descripcion=@descripcion, codAsig=@codAsig, hEstimadas=@hEstimadas, explotacion=@explotacion, tipoTarea=@tipoTarea WHERE codigo=@codigo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSubjects" Name="assignmentCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
