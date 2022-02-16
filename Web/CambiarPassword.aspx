<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="Web.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cambiar Contraseña</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-6">
                <h1 class="p-3">Cambiar contraseña</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-6">
                <form id="form1" runat="server">
                    <div class="p-2">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="tbEmail" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce tu correo electrónico.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="tbEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce un correo electrónico válido.
                            </div>
                        </div>
                    </asp:RegularExpressionValidator>
                    <asp:Panel ID="pMessageEmail" runat="server" CssClass="d-none"></asp:Panel>
                    <div class="p-2">
                        <asp:Button ID="bRequestChange" runat="server" Text="Solicitar código" CssClass="btn btn-primary" OnClick="bRequestChange_Click" ValidationGroup="SendEmail"/>
                    </div>
                    <div class="p-2">
                        <label class="form-label">Código</label>
                        <asp:TextBox ID="tbCode" runat="server" CssClass="form-control" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvCode" ValidationGroup="ChangePassword" Display="Dynamic" ControlToValidate="tbCode" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce el código que se ha enviado a tu correo electrónico.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <div class="p-2">
                        <label class="form-label">Nueva contraseña</label>
                        <asp:TextBox ID="tbNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvNewPassword" ValidationGroup="ChangePassword" Display="Dynamic" ControlToValidate="tbNewPassword" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce una contraseña.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNewPassword" ValidationGroup="ChangePassword" Display="Dynamic" ControlToValidate="tbNewPassword" runat="server" ValidationExpression="\w{6,}">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                La contraseña debe tener por lo menos 6 dígitos.
                            </div>
                        </div>
                    </asp:RegularExpressionValidator>
                    <div class="p-2">
                        <label class="form-label">Repetir nueva contraseña</label>
                        <asp:TextBox ID="tbNewPassword_" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvNewPassword_" ValidationGroup="ChangePassword" Display="Dynamic" ControlToValidate="tbNewPassword_" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Introduce otra vez la contraseña.
                            </div>
                        </div>
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvNewPassword_" ValidationGroup="ChangePassword" Display="Dynamic" ControlToCompare="tbNewPassword" ControlToValidate="tbNewPassword_" runat="server">
                        <div class="p-2">
                            <div class="alert alert-danger m-0" role="alert">
                                Las contraseñas deben coincidir.
                            </div>
                        </div>
                    </asp:CompareValidator>
                    <asp:Panel ID="pMessage" runat="server" CssClass="d-none"></asp:Panel>
                    <div class="p-2">
                        <asp:Button ID="bChangePassword" ValidationGroup="ChangePassword" runat="server" Text="Cambiar contraseña" CssClass="btn btn-primary" OnClick="bChangePassword_Click" />
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
