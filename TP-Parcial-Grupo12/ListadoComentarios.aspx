<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoComentarios.aspx.cs" Inherits="TP_Parcial_Grupo12.ListadoComentarios" %>

<!--
    (B) - WebForm ListadoComentarios.aspx:
        Crear esta página que deberá tener un título informativo y un control <asp:GridView> que muestré DNI, apellido
        y comentario de la tabla 'comentarios'. La tabla comentarios debera estar relacionada con la tabla alumnos
        mediante claves y cada comentario corresponderá solamente a un alumno. Está relación deberá ser persistida a la
        base de datos.
        Se tendra usar las clases LINQ to SQL.
        Agregar una columna que permita Editar y Eliminar la fila correspondiente. El usuario podrá ingresar comentarios
        pero solo el administrador del sitio podrá ver los comentarios pudiendo usar la columna de editar y eliminar.
-->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" type="text/css" href="CSS/Estilos.css" />
    <title></title>
</head>
<body class="center-content">
    <form id="form1" runat="server">
        
        <div >
            <h1>Listado de Alumnos con Comentarios</h1><br />
            <asp:GridView ID="grilla" runat="server"  
    OnRowCancelingEdit="rowCancelEditEvent" 
    OnRowDeleting="rowDeletingEvent" 
    OnRowEditing="rowEditingEvent" 
    OnRowUpdating="rowUpdatingEvent" AutoGenerateColumns="False"
    DataKeyNames="idComentario">
    <Columns>
        <asp:TemplateField HeaderText="DNI">
            <ItemTemplate>
                <asp:Label ID="labelDNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDNI2" runat="server" Text='<%# Bind("DNI") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="APELLIDO">
            <ItemTemplate>
                <asp:Label ID="labelApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtApellido2" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="COMENTARIO">
            <ItemTemplate>
                <asp:Label ID="labelComentario" runat="server" Text='<%# Bind("ComentarioTexto") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtComentario2" runat="server" Text='<%# Bind("ComentarioTexto") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
    </Columns>
</asp:GridView>


            <!--
            <asp:Button ID="BotonMostrar" runat="server" Text="Mostrar Datos" OnClick="BotonMostrar_Click" />
            -->
        </div>
    </form>
</body>
</html>
