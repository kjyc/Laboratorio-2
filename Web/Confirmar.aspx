<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmar.aspx.cs" Inherits="Web.Confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Confirmar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-6">
                <h1 class="p-3">Confirmación</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-6">
                <form id="form1" runat="server">
                    <div class="p-2">
                        <asp:Label ID="lMessage" runat="server"></asp:Label>
                    </div>
                    <div class="p-2">
                        <a href="/Inicio.aspx">Ir a Inicio</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
