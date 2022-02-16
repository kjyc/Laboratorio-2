<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Web.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrarse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <div class="row text-center justify-content-md-center">
            <div class="col-6">
                <h1 class="p-3">Registrarse</h1>
            </div>
        </div>
        <div class="row justify-content-md-center">
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
                        <label class="form-label">Nombre</label>
                        <asp:TextBox ID="tbName" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvName" Display="Dynamic" ControlToValidate="tbName" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce tu nombre.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <div class="p-2">
                        <label class="form-label">Apellidos</label>
                        <asp:TextBox ID="tbLastname" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvLastname" Display="Dynamic" ControlToValidate="tbLastname" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce tu apellido.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <div class="p-2">
                        <label class="form-label">Contraseña</label>
                        <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" Display="Dynamic" ControlToValidate="tbPassword" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce una contraseña.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" Display="Dynamic" ControlToValidate="tbPassword" runat="server" ValidationExpression="\w{6,}">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                La contraseña debe tener por lo menos 6 dígitos.
                            </div>
                        </div>
                    </asp:RegularExpressionValidator>
                    <div class="p-2">
                        <label class="form-label">Repetir contraseña</label>
                        <asp:TextBox ID="tbPassword_" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword_" Display="Dynamic" ControlToValidate="tbPassword_" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce otra vez la contraseña.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPassword_" Display="Dynamic" ControlToCompare="tbPassword" ControlToValidate="tbPassword_" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Las contraseñas deben coincidir.
                            </div>
                        </div>
                    </asp:CompareValidator>
                    <div class="p-2">
                        <label class="form-label">Rol</label>
                        <asp:RadioButtonList ID="rbRol" runat="server">
                            <asp:ListItem>Alumno</asp:ListItem>
                            <asp:ListItem>Profesor</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvRol" Display="Dynamic" ControlToValidate="rbRol" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Selecciona un rol.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:Panel ID="pMessage" runat="server" CssClass="d-none"></asp:Panel>
                    <div class="p-2">
                        <asp:Button ID="bRegistrar" runat="server" Text="Registrarse" CssClass="btn btn-primary" OnClick="bRegistrar_Click" />
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
