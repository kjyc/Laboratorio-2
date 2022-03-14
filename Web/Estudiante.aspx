<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="Web.Estudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Panel de Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row text-center" style="height: 550px">
                <div class="col-3 h-100 border-start border-top border-bottom border-secondary rounded-start">
                    <div class="row p-3">
                        <a href="/VerTareasEstudiante.aspx" class="btn btn-secondary">Tareas Genéricas</a>
                    </div>
                </div>
                <div class="col-9 h-100 border border-secondary rounded-end">
                    <div class="row p-4">
                        <h1>Gestión Web de Tareas-Dedicación</h1>
                    </div>
                    <div class="row">
                        <h2>Alumno</h2>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
