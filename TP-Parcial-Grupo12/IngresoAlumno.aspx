<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoAlumno.aspx.cs" Inherits="TP_Parcial_Grupo12.IngresoAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="CSS/Estilos.css" />
    <script type="text/javascript" src="JavaScript/JavaScript.js"></script>
    <title></title>
</head>
<body >
    
    <form  id="form1" runat="server">
        <div class="center-content">
            <table style="background-color:tan; " border="1">
                <tr>
                    <th  class="titulo"  colspan="5">

                        <asp:Label Text="Datos Personales" runat="server" />
                    </th>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:Label Text="Datos Obligatorios" runat="server" CssClass="obligatorio"/>
                    </td>
                    <td>
                        <asp:Label ID="labelApellido" runat="server" Text="Apellido" CssClass="obligatorio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="desenfocada"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="labelNombre" runat="server" Text="Nombre" CssClass="obligatorio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="desenfocada"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="labelDNI" runat="server" Text="DNI" CssClass="obligatorio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDNI" runat="server" CssClass="desenfocada"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="labelEmail" runat="server" Text="E-mail" CssClass="obligatorio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="desenfocada"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelPreferencias" runat="server" Text="Preferencias" CssClass="preferencias"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelTurno" runat="server" Text="Turno" CssClass="preferencias"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList  runat="server" ID="txtTurno" CssClass="desenfocada">
                            <asp:ListItem Text="Seleccione Turno" Value="" ></asp:ListItem>
                            <asp:ListItem Text="Mañana" Value="Manana"></asp:ListItem>
                            <asp:ListItem Text="Tarde" Value="Tarde"></asp:ListItem>
                            <asp:ListItem Text="Noche" Value="Noche"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                        <asp:Button ID="Button1" runat="server" Text="Enviar" OnClientClick="return validacion()" OnClick="Button1_Click"  />

                        <button id="txtlimpiar" type="reset">Limpiar Campos</button>    
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
