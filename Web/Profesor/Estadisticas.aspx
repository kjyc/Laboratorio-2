<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="Web.Estadisticas" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Estadísticas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row text-center bg-secondary rounded align-items-center">
                <div class="col-2">
                    <a href="/Profesor/VerTareasProfesor.aspx" class="btn btn-dark">Atras</a>
                </div>
                <div class="col-8 text-light">
                    <h1>Estadísticas</h1>
                </div>
                <div class="col-2">
                    <asp:Button ID="bLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick="bLogout_Click" />
                </div>
            </div>
            <div class="row p-5">
                <asp:DropDownList ID="ddlStudents" runat="server" DataSourceID="sdsStudents" DataTextField="email" DataValueField="email" CssClass="form-select" AutoPostBack="true"></asp:DropDownList>
                <asp:SqlDataSource ID="sdsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT email FROM Usuario WHERE tipo='Alumno'"></asp:SqlDataSource>
            </div>
            <div class="row p-5">
                <div class="col-6">
                    <div class="row">
                        <h2>Horas reales por tarea</h2>
                    </div>
                    <asp:Chart ID="Chart" runat="server" DataSourceID="sdsChart" Height="400px" Width="400px">
                        <Series>
                            <asp:Series Name="Series" XValueMember="codTarea" YValueMembers="hReales"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="sdsChart" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT * FROM [EstudianteTarea] WHERE ([email] = @email)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlStudents" Name="email" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-6">
                    <div class="row">
                        <h2>Horas totales por asignatura</h2>
                    </div>
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="sdsChart1" Height="400px" Width="400px">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie" XValueMember="codAsig" YValueMembers="horasTotales" IsValueShownAsLabel="true" Legend="Legend1"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                    <asp:SqlDataSource ID="sdsChart1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22-02 %>" SelectCommand="SELECT TG.codAsig, SUM(ET.hReales) AS horasTotales FROM TareaGenerica AS TG INNER JOIN EstudianteTarea AS ET ON TG.codigo=ET.codTarea WHERE email=@email GROUP BY TG.codAsig">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlStudents" Name="email" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
