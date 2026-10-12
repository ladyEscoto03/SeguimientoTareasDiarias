<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TareaWebForm.aspx.cs" Inherits="SeguimientoTareasDiarias.WebForms.TareaWebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content border-0 shadow rounded-4 overflow-hidden">
                <div class="modal-header bg-primary text-white px-4 py-3">
                    <h1 class="modal-title modal-title fs-5 fw-semibold" id="exampleModalLabel">Editar Tarea</h1>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <asp:Label ID="Label6" runat="server" Text="Id asignado a la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_id" runat="server" CssClass="form-control" ReadOnly="true" Enabled="false"></asp:TextBox>

                    <asp:Label ID="Label1" runat="server" Text="Título de la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_titulo" runat="server" CssClass="form-control" ValidationGroup="EditarTarea"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="edit_titulo" ErrorMessage="Este campo es obligatorio y no puede quedar vacío" ForeColor="Red" Display="Dynamic" ValidationGroup="EditarTarea"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="edit_titulo" ValidationExpression=".{5,60}" ErrorMessage="El título debe tener entre 5 y 60 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="EditarTarea"></asp:RegularExpressionValidator>
                    <br />


                    <asp:Label ID="Label2" runat="server" Text="Descripcion de la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_descripcion" runat="server" CssClass="form-control" TextMode="MultiLine" ValidationGroup="EditarTarea"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="edit_descripcion" ErrorMessage="La descripción es obligatoria" ForeColor="Red" Display="Dynamic" ValidationGroup="EditarTarea"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="edit_descripcion" ValidationExpression="^[\s\S]{10,250}$" ErrorMessage="La descripción no puede superar los 250 caracteres o ser menor a 10 caracteres"  ForeColor="Red" Display="Dynamic" ValidationGroup="EditarTarea"></asp:RegularExpressionValidator>
                    <br />


                    <asp:Label ID="Label3" runat="server" Text="Ingrese la fecha en que se debe hacer la tarea" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="edit_fecha" runat="server" CssClass="form-control" TextMode="Date" ValidationGroup="EditarTarea"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="edit_fecha" ErrorMessage="La fecha es obligatoria" ForeColor="Red" Display="Dynamic" ValidationGroup="EditarTarea"></asp:RequiredFieldValidator>
                    <br />


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
                    <button type="button" class="btn btn-primary"
                        onclick="if (!Page_ClientValidate('EditarTarea')) return false; editarTarea();">
                        Guardar cambios
                    </button>
                </div>
            </div>
        </div>
    </div>



    <div id="alerta-exito" role="alert" hidden="hidden"
        style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #d1e7dd; color: #0f5132; border: 1px solid #badbcc; border-radius: 6px; padding: 15px 20px; margin: 15px 0; font-size: 15px; font-weight: 500; display: flex; align-items: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
        <span style="font-size: 18px; margin-right: 10px;"><i class="bi bi-check"></i></span>
        <span id="mensajeExito"></span>
    </div>

    <div id="alerta-error" role="alert" hidden="hidden"
        style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8d7da; color: #842029; border: 1px solid #f5c2c7; border-radius: 6px; padding: 15px 20px; margin: 15px 0; font-size: 15px; font-weight: 500; display: flex; align-items: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
        <span style="font-size: 18px; margin-right: 10px;"><i class="bi bi-exclamation-triangle"></i></span>
        <span id="mensajeError"></span>
    </div>


    <h2>Registre tareas aquí</h2>

    <div>
        <asp:Label ID="lbl_titulo" runat="server" Text="Ingrese título de la tarea" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txt_titulo" runat="server" CssClass="form-control" ValidationGroup="RegistroTarea"></asp:TextBox>

        <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txt_titulo" ErrorMessage="Este campo es obligatorio y no puede quedar vacío" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTituloExt" runat="server" ControlToValidate="txt_titulo" ValidationExpression=".{5,60}" ErrorMessage="El título debe tener entre 5 y 60 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RegularExpressionValidator>
        <br />



        <asp:Label ID="lbl_descripcion" runat="server" Text="Ingrese una descripcion" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txt_descripcion" runat="server" CssClass="form-control" TextMode="MultiLine" ValidationGroup="RegistroTarea"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txt_descripcion" ErrorMessage="La descripción es obligatoria" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="revDescripcionExt" runat="server" ControlToValidate="txt_descripcion" ValidationExpression="^[\s\S]{10,250}$" ErrorMessage="La descripción no puede superar los 250 caracteres o ser menor a 10 caracteres" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="lbl_fecha" runat="server" Text="Ingrese la fecha en que se debe hacer la tarea" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txt_fecha" runat="server" CssClass="form-control" TextMode="Date" ValidationGroup="RegistroTarea"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txt_fecha" ErrorMessage="La fecha es obligatoria" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lbl_prioridad" runat="server" Text="Seleccione la prioridad de la tarea" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddl_prioridad" runat="server" CssClass="form-control" ValidationGroup="RegistroTarea">
            <asp:ListItem Text="Seleccione una opción" Value="" Selected="True" />
            <asp:ListItem Text="Alta" Value="Alta" />
            <asp:ListItem Text="Media" Value="Media" />
            <asp:ListItem Text="Baja" Value="Baja" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvPrioridad" runat="server" ControlToValidate="ddl_prioridad" InitialValue="" ErrorMessage="Debe seleccionar una prioridad" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RequiredFieldValidator>

        <br />
        <asp:Label ID="lbl_estado" runat="server" Text="Seleccione el estado de la tarea" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddl_estado" runat="server" CssClass="form-control" ValidationGroup="RegistroTarea">
            <asp:ListItem Text="Seleccione una opción" Value="" Selected="True" />
            <asp:ListItem Text="Pendiente" Value="Pendiente" />
            <asp:ListItem Text="En ejecución" Value="En ejecución" />
            <asp:ListItem Text="Finalizada" Value="Finalizada" />
            <asp:ListItem Text="Fallida" Value="Fallida" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="ddl_estado" InitialValue="" ErrorMessage="Debe seleccionar un estado" ForeColor="Red" Display="Dynamic" ValidationGroup="RegistroTarea"></asp:RequiredFieldValidator>
        <br />
        <asp:Button
            ID="btn_submit"
            runat="server"
            CssClass="btn-primary"
            Text="Registrar tarea"
            OnClientClick="if (!Page_ClientValidate('RegistroTarea')) return false; GuardarTarea();"
            ValidationGroup="RegistroTarea"
            CausesValidation="true" />

    </div>













    <div>
        <h3>Filtrar datos</h3>


        <asp:Label ID="Label8" runat="server" Text="Prioridad"></asp:Label>
        <asp:DropDownList ID="criterio_prioridad" runat="server">
            <asp:ListItem Text="Seleccione una opción" Value="" Selected="True" />
            <asp:ListItem Text="Alta" Value="Alta" />
            <asp:ListItem Text="Media" Value="Media" />
            <asp:ListItem Text="Baja" Value="Baja" />
        </asp:DropDownList>


        <asp:Label ID="Label9" runat="server" Text="Estado"></asp:Label>
        <asp:DropDownList ID="criterio_estado" runat="server">
            <asp:ListItem Text="Seleccione una opción" Value="" Selected="True" />
            <asp:ListItem Text="Pendiente" Value="Pendiente" />
            <asp:ListItem Text="En ejecución" Value="En ejecución" />
            <asp:ListItem Text="Finalizada" Value="Finalizada" />
            <asp:ListItem Text="Fallida" Value="Fallida" />
        </asp:DropDownList>

        <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Text="Buscar" OnClientClick="filtrarDatos(); return false;" />



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


            var prioridad = $("#<%= criterio_prioridad.ClientID %>").val();
            var estado = $("#<%= criterio_estado.ClientID %>").val();
            const alerta = document.getElementById('alerta-error');


            var datosEnviar = {

                prioridad: prioridad,
                estado: estado
            };

            $.ajax({
                type: "POST",
                url: "TareaWebForm.aspx/FiltroTareas",
                data: JSON.stringify(datosEnviar),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {

                    var listaTareas = response.d;
                    var tabla = $("#<%= Table1.ClientID %>");

                    tabla.find("tr:not(:first)").remove();

                    if (listaTareas.length === 0) {
                        $("#alerta-error").removeAttr("hidden");
                        $("#mensajeError").text(
                            "No hay coincidencias con los datos buscados"
                        );
                        setTimeout(() => {
                            alerta.setAttribute('hidden', 'hidden');
                        }, 6000);
                        return;
                    }


                    $.each(listaTareas, function (index, item) {

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
                },

                error: function (xhr, status, error) {
                    console.error("Error al buscar tareas:", error);
                    console.error(xhr.responseText);
                }
            });

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
