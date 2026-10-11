<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TareaWebForm.aspx.cs" Inherits="SeguimientoTareasDiarias.WebForms.TareaWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div role="alert" hidden="hidden" style="border-style: solid; background-color: #008000; color: #FFFFFF; text-decoration: none">
        hola
    </div>
    <asp:Label ID="lbl_titulo" runat="server" Text="Ingrese título de la tarea" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txt_titulo" runat="server" CssClass="form-control"></asp:TextBox>

     <asp:Label ID="lbl_descripcion" runat="server" Text="Ingrese una descripcion" CssClass="form-label"></asp:Label>
 <asp:TextBox ID="txt_descripcion" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

    <asp:Label ID="lbl_fecha" runat="server" Text="Ingrese la fecha en que se debe hacer la tarea" CssClass="form-label"></asp:Label>
<asp:TextBox ID="txt_fecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

        <asp:Label ID="lbl_prioridad" runat="server" Text="Seleccione la prioridad de la tarea" CssClass="form-label"></asp:Label>
    <asp:DropDownList ID="ddl_prioridad" runat="server" CssClass="form-control">
         <asp:ListItem Text="Alta" Value="Alta" />
         <asp:ListItem Text="Media" Value="Media" />
         <asp:ListItem Text="Baja" Value="Baja" />
    </asp:DropDownList>

        <asp:Label ID="lbl_estado" runat="server" Text="Seleccione el estado de la tarea" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="ddl_estado" runat="server" CssClass="form-control">
     <asp:ListItem Text="Pendiente" Value="Pendiente" />
     <asp:ListItem Text="En ejecución" Value="En ejecución" />
     <asp:ListItem Text="Finalizada" Value="Finalizada" />
    <asp:ListItem Text="Fallida" Value="Fallida" />
</asp:DropDownList>

    <asp:Button ID="btn_submit" runat="server" CssClass="btn-primary" Text="Registrar tarea" />

</asp:Content>
