<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TareaWebForm.aspx.cs" Inherits="SeguimientoTareasDiarias.WebForms.TareaWebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Tarea</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <asp:Label ID="Label6" runat="server" Text="Id asignado a la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_id" runat="server" CssClass="form-control" ReadOnly="true" Enabled="false"></asp:TextBox>

                    <asp:Label ID="Label1" runat="server" Text="Título de la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_titulo" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Label ID="Label2" runat="server" Text="Descripcion de la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_descripcion" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                    <asp:Label ID="Label3" runat="server" Text="Ingrese la fecha en que se debe hacer la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_fecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                    <asp:Label ID="Label4" runat="server" Text="Seleccione la prioridad de la tarea" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="edit_prioridad" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Alta" Value="Alta" />
                        <asp:ListItem Text="Media" Value="Media" />
                        <asp:ListItem Text="Baja" Value="Baja" />
                    </asp:DropDownList>

                    <asp:Label ID="Label5" runat="server" Text="Seleccione el estado de la tarea" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="edit_estado" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Pendiente" Value="Pendiente" />
                        <asp:ListItem Text="En ejecución" Value="En ejecución" />
                        <asp:ListItem Text="Finalizada" Value="Finalizada" />
                        <asp:ListItem Text="Fallida" Value="Fallida" />
                    </asp:DropDownList>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="editarTarea()">Guardar cambios</button>
                </div>
            </div>
        </div>
    </div>



    <div id="alerta-exito" role="alert" hidden="hidden"
        style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #d1e7dd; color: #0f5132; border: 1px solid #badbcc; border-radius: 6px; padding: 15px 20px; margin: 15px 0; font-size: 15px; font-weight: 500; display: flex; align-items: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
        <span style="font-size: 18px; margin-right: 10px;"><i class="bi bi-check"></i></span>
        <span id="mensajeExito"></span>
    </div>

    <h2>Registre tareas aquí</h2>

    <div>
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

    </div>

    











    <div>
        <h3>Filtrar datos</h3>
        <asp:Label ID="Label7" runat="server" Text="Buscar"></asp:Label>
        <asp:TextBox ID="criterio_buscar" runat="server"></asp:TextBox>


        <asp:Label ID="Label8" runat="server" Text="Prioridad"></asp:Label>
        <asp:DropDownList ID="criterio_prioridad" runat="server">
            <asp:ListItem Text="Alta" Value="Alta" />
            <asp:ListItem Text="Media" Value="Media" />
            <asp:ListItem Text="Baja" Value="Baja" />
        </asp:DropDownList>


        <asp:Label ID="Label9" runat="server" Text="Estado"></asp:Label>
        <asp:DropDownList ID="criterio_estado" runat="server">
            <asp:ListItem Text="Pendiente" Value="Pendiente" />
            <asp:ListItem Text="En ejecución" Value="En ejecución" />
            <asp:ListItem Text="Finalizada" Value="Finalizada" />
            <asp:ListItem Text="Fallida" Value="Fallida" />
        </asp:DropDownList>




    </div>




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





        function filtrarDatos() {

        }





        function editarTarea() {
            $.ajax({
                type: "POST",
                url: "TareaWebForm.aspx/EditarTarea",
                data: JSON.stringify({
                    idTarea: $("#<%= edit_id.ClientID %>").val(),
                    titulo: $("#<%= edit_titulo.ClientID %>").val(),
                    descripcion: $("#<%= edit_descripcion.ClientID %>").val(),
                    fecha: $("#<%= edit_fecha.ClientID %>").val(),
                    prioridad: $("#<%= edit_prioridad.ClientID %>").val(),
                    estado: $("#<%= edit_estado.ClientID %>").val()

                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    const alerta = document.getElementById('alerta-exito');

                    alerta.removeAttribute('hidden');
                    ListarTareas();
                    $("#mensajeExito")
                        .text("¡Tarea editada correctamente!");
                    var modalElemento = document.getElementById('modalEditar');
                    var modal = bootstrap.Modal.getInstance(modalElemento);

                    modal.hide();

                    setTimeout(() => {
                        alerta.setAttribute('hidden', 'hidden');
                    }, 6000);
                },
                error: function (xhr, status, error) {

                    alert("Error " + xhr.status + ": " + error);
                }


            })
        }

        function abrirModal(id) {
            $.ajax({
                type: "POST",
                url: "TareaWebForm.aspx/BuscarTarea",
                data: JSON.stringify({ idTarea: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var data = response.d;
                    $("[id$=edit_id]").val(data.Id);
                    $("[id$=edit_titulo]").val(data.Titulo);
                    $("[id$=edit_descripcion]").val(data.Descripcion);
                    $("[id$=edit_fecha]").val(data.Fecha);
                    $("[id$=edit_prioridad]").val(data.Prioridad);
                    $("[id$=edit_estado]").val(data.Estado);

                    var modal = new bootstrap.Modal(document.getElementById('modalEditar'));
                    modal.show();
                },
                error: function (xhr, status, error) {
                    alert("Error al cargar los datos: " + error);
                }
            });
        }

        function eliminarTarea(id) {
            if (confirm("¿Estás seguro de que deseas eliminar esta tarea?")) {
                $.ajax({
                    type: "POST",
                    url: "TareaWebForm.aspx/EliminarTarea",
                    data: JSON.stringify({ idTarea: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#fila-" + id).fadeOut("slow", function () {
                            $(this).remove();
                        });
                        ListarTareas();

                        $("#mensajeExito")
                            .text("¡Tarea eliminada correctamente!");

                        const alerta = document.getElementById('alerta-exito');
                        alerta.removeAttribute('hidden');

                        setTimeout(() => {
                            alerta.setAttribute('hidden', 'hidden');
                        }, 6000)



                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la petición: ", error);

                    }
                });
            }
        }

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

                    $.each(tareas, function (index, item) {


                        var fila = "<tr id='fila-" + item.Id + "'>" +
                            "<td>" + item.Id + "</td>" +
                            "<td>" + item.Titulo + "</td>" +
                            "<td>" + item.Descripcion + "</td>" +
                            "<td>" + item.Fecha + "</td>" +
                            "<td>" + item.Prioridad + "</td>" +
                            "<td>" + item.Estado + "</td>" +
                            "<td>" +
                            "<button type='button' class='btn btn-info' onclick='abrirModal(" + item.Id + ")' title='Abrir modal'>" +
                            "<i class='bi bi-pencil-square'></i>" +
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
                success: function () {
                    const alerta = document.getElementById('alerta-exito');

                    alerta.removeAttribute('hidden');
                    ListarTareas();
                    $("#mensajeExito")
                        .text("¡Tarea registrada correctamente!");

                    setTimeout(() => {
                        alerta.setAttribute('hidden', 'hidden');
                    }, 6000);
                },
                error: function (xhr, status, error) {

                    alert("Error " + xhr.status + ": " + error);
                }


            })
        }
    </script>


</asp:Content>
