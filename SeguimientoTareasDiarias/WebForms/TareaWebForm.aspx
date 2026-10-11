<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TareaWebForm.aspx.cs" Inherits="SeguimientoTareasDiarias.WebForms.TareaWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2>Registre tareas aquí</h2>

    <div id="alerta-exito" role="alert" hidden="hidden" 
     style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #d1e7dd; 
            color: #0f5132; 
            border: 1px solid #badbcc; 
            border-radius: 6px; 
            padding: 15px 20px; 
            margin: 15px 0; 
            font-size: 15px; 
            font-weight: 500;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
     <span style="font-size: 18px; margin-right: 10px;"><i class="bi bi-check"></i></span>
     <span>¡Datos guardados con éxito!</span>
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

    <asp:Button ID="btn_submit" runat="server" CssClass="btn-primary" Text="Registrar tarea" OnClientClick="GuardarTarea(); return false;" />


   <asp:Table ID="Table1" runat="server" CssClass="table" BorderStyle="Solid">
    <asp:TableHeaderRow>
        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
        <asp:TableHeaderCell>Título</asp:TableHeaderCell>
        <asp:TableHeaderCell>Descripción</asp:TableHeaderCell>
        <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
        <asp:TableHeaderCell>Prioridad</asp:TableHeaderCell>
        <asp:TableHeaderCell>Estado</asp:TableHeaderCell>
        <asp:TableHeaderCell>Acciones</asp:TableHeaderCell>
    </asp:TableHeaderRow>
</asp:Table>







    <script>

        $(document).ready(function () {
            ListarTareas();
        });

        function ListarTareas() {
            $.ajax({
                type: "POST",
                url: "TareaWebForm.aspx/ListarTareas",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    let tareas = response.d;
                    let tabla = $("#<%= Table1.ClientID %>");
                    tabla.find("tr:not(:first)").remove();

                    $.each(tareas, function(index, item) {
                        var fecha = new Date(
                            parseInt(item.Fecha.match(/\d+/)[0])
                        ).toLocaleDateString("es-CR");

                        var fila = "<tr>" +
                            "<td>" + item.Id + "</td>" +
                            "<td>" + item.Titulo + "</td>" +
                            "<td>" + item.Descripcion + "</td>" +
                            "<td>" + fecha + "</td>" +
                            "<td>" + item.Prioridad + "</td>" +
                            "<td>" + item.Estado + "</td>" +
                            "<td>" +
                            "<button type='button' class='btn btn-info' onclick='consultarTarea(" + item.Id + ")' title='Consultar'>" +
                            "<i class='bi bi-eye'></i>" +
                            "</button> " +
                            "<button type='button' class='btn btn-danger' onclick='eliminarTarea(" + item.Id + ")' title='Eliminar'>" +
                            "<i class='bi bi-trash'></i>" +
                            "</button>" +
                            "</td>" +
                            "</tr>";

                        tabla.append(fila);
                    });
                }
            });
        }









        function GuardarTarea() {
            $.ajax({
                type: "POST",
                url: "TareaWebForm.aspx/GuardarTarea",
                data: JSON.stringify({
                    titulo: $("#<%= txt_titulo.ClientID %>").val(),
                    descripcion: $("#<%= txt_descripcion.ClientID %>").val(),
                    fecha: $("#<%= txt_fecha.ClientID %>").val(),
                    prioridad: $("#<%= ddl_prioridad.ClientID %>").val(),
                    estado: $("#<%= ddl_estado.ClientID %>").val()

                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function() {
                    const alerta = document.getElementById('alerta-exito');


                    alerta.removeAttribute('hidden');
                    ListarTareas();

                 
                    setTimeout(() => {
                        alerta.setAttribute('hidden', 'hidden');
                    }, 6000);
                },
                error: function(xhr, status, error) {
               
                    alert("Error " + xhr.status + ": " + error);
                }


            })
        }
    </script>


</asp:Content>
