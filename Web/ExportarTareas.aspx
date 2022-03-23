<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportarTareas.aspx.cs" Inherits="Web.ImportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Exportar Tareas</title>
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
                    <a href="/Profesor.aspx" class="btn btn-dark">Atras</a>
                </div>
                <div class="col-8 text-light">
                    <h2>Profesor</h2>
                    <h2>Exportar Tareas Genéricas</h2>
                </div>
                <div class="col-2">
                </div>
            </div>
            <div class="row p-5 text-center">
                <div class="col-4">
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
                <div class="col-4">
                    <asp:Button ID="bExportXML" runat="server" Text="Exportar (XML)" CssClass="btn btn-primary" OnClick="bExportXML_Click" />
                </div>
                <div class="col-4">
                    <asp:Button ID="bExportJson" runat="server" Text="Exportar (Json)" CssClass="btn btn-primary" OnClick="bExportJson_Click" />
                </div>
            </div>
            <div class="row">
                <asp:GridView ID="gvGenericAssignments" runat="server" CssClass="table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="codigo" />
                        <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                        <asp:BoundField HeaderText="H. Estimadas" DataField="hEstimadas" />
                        <asp:CheckBoxField HeaderText="Explotación" DataField="explotacion" />
                        <asp:BoundField HeaderText="Tipo" DataField="tipoTarea" />
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
