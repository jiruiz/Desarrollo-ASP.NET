<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarDatos.aspx.cs" Inherits="TP_Parcial_Grupo12.WebForm2" %>
<!--
    1- Guardar el Apellido, Nombre, DNI, E-mail, Turno e identificador en una tabla llamada 'alumnos'.

2- Redireccionar a una página que se llame MostrarDatos.aspx que tendrá un título H1, una tabla HTML,
    un <asp:TextBox> multilinea y un <asp:Button> en la parte de abajo de la página estos dos últimos.

3- En la tabla HTML se deberán mostrar los datos ingresados mediante una conexión a la base de datos con
    LINQ to SQL. La tabla tendrá varios <asp:Label> o <span> diciendo qué es cada campo.

4- En <asp:TextBox> multilinea se podrá escribir un comentario adicional. Clickeando en
    <asp:Button> se guardará en una tabla llamada 'comentarios': DNI, apellido y el comentario ingresado,
    luego redireccionarlo al formulario original. El campo multilinea deberá ser validado que no este vacío
    mediante javascript.
    -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" type="text/css" href="CSS/Estilos.css" />
 <script type="text/javascript" src="JavaScript/JavaScript.js"></script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label Text="Los datos se han cargado exitosamente" ID="txtTitulo" runat="server" />
            <table border="1">
                 <caption >Datos del Alumno</caption>
                <tr>
                    <td>
                        <asp:Label ID="labelEncabezadoApellidos" runat="server" Text="Apellido"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:Label ID="labelEncabezadoNombres" runat="server" Text="Nombre"></asp:Label>
                    </td>
                     <td>
                        <asp:Label ID="labelEncabezadoDNI" runat="server" Text="DNI"></asp:Label>
                    </td>
                     <td>
                        <asp:Label ID="labelEncabezadoEmail" runat="server" Text="Mail"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="labelEncabezadoTurno" runat="server" Text="Turno"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtApellido" runat="server" Enabled="false" Text="dato apellido"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre"  runat="server" Enabled="false" Text="dato Nombre"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDNI" runat="server" Enabled="false" Text="dato dni"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Enabled="false" Text="dato mail"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTurno" runat="server" Enabled="false" Text="dato turno"/>
                    </td>
                </tr>
                
            </table>
            <asp:TextBox ID="txtComentario" TextMode="MultiLine" Rows="10" Columns="50" runat="server" placeholder="Aqui ingrese el comentario que desea enviar"></asp:TextBox><br />
                <asp:Button ID="botonComentario" runat="server" Text="Enviar Comentario" OnClientClick="return validarCampoComentario();" OnClick="Button1_Click" />
            <asp:HyperLink NavigateUrl="IngresoAlumno.aspx" Text="Volver a Cargar Alumno" runat="server" />
        </div>
    </form>
</body>
</html>
