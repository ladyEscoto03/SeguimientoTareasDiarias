using Microsoft.Ajax.Utilities;
using SeguimientoTareasDiarias.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeguimientoTareasDiarias.WebForms
{
    public partial class TareaWebForm : System.Web.UI.Page
    {
        private static List<Tarea>ListaTareas = new List<Tarea>();
        private static int TareaId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static void GuardarTarea(string titulo, string descripcion, string fecha, string prioridad, string estado)
        {
            Tarea tarea = new Tarea();
            tarea.Id = ++TareaId;
            tarea.Titulo = titulo;
            tarea.Descripcion = descripcion;
            tarea.Fecha = fecha;
            tarea.Prioridad = prioridad;
            tarea.Estado = estado;

            ListaTareas.Add(tarea);
        }
        [WebMethod]
        public static List<Tarea> ListarTareas()
        {
            return ListaTareas;
        }

        [WebMethod]
        public static void EliminarTarea(int idTarea)
        {
            Tarea tarea= ListaTareas.Find(t => t.Id == idTarea);
            ListaTareas.Remove(tarea);
        }

        [WebMethod]
        public static Tarea BuscarTarea(int idTarea) {
            Tarea tarea = ListaTareas.Find(t => t.Id == idTarea);
            return tarea;
        }

        [WebMethod]
        public static void editarTarea(int idTarea, string titulo, string descripcion, string fecha, string prioridad, string estado) {

            Tarea tarea = BuscarTarea(idTarea);
            tarea.Descripcion = descripcion;
            tarea.Fecha = fecha;
            tarea.Prioridad = prioridad;
            tarea.Estado = estado;

        }
    }
}