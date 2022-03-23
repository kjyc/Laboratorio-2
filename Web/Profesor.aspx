<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="Web.Profesor" %>

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
                        <a href="/VerTareasProfesor.aspx" class="btn btn-secondary">Tareas</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/ImportarTareasXMLDocument.aspx" class="btn btn-secondary">Importar XML</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/ExportarTareas.aspx" class="btn btn-secondary">Exportar Tareas</a>
                    </div>
                    <div class="row px-3 pb-3">
                        <a href="/ImportarTareasDataSet.aspx" class="btn btn-secondary">Importar (DataSet)</a>
                    </div>
                </div>
                <div class="col-9 h-100 border border-secondary rounded-end">
                    <div class="row p-4">
                        <h1>Gestión Web de Tareas-Dedicación</h1>
                    </div>
                    <div class="row">
                        <h2>Profesor</h2>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
