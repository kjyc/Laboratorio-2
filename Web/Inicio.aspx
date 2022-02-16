<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Web.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-6">
                <h1 class="p-3">Login</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-6">
                <form id="form1" runat="server">
                    <div class="p-2">
                        <label class="form-label">Correo</label>
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" Display="Dynamic" ControlToValidate="tbEmail" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce tu correo electrónico.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" Display="Dynamic" ControlToValidate="tbEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce un correo electrónico válido.
                            </div>
                        </div>
                    </asp:RegularExpressionValidator>
                    <div class="p-2">
                        <label class="form-label">Contraseña</label>
                        <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" Display="Dynamic" ControlToValidate="tbPassword" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce tu contraseña.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:Panel ID="pMessage" runat="server" CssClass="d-none"></asp:Panel>
                    <div class="p-2">
                        <asp:Button ID="bLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="bLogin_Click" />
                    </div>
                    <div class="p-2">
                        <a href="/Registro.aspx">Registrarse</a>
                    </div>
                    <div class="p-2">
                        <a href="/CambiarPassword.aspx">Modificar contraseña</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
