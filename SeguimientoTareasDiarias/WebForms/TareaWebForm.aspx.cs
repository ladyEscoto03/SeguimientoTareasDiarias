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
        private int Id = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GuardarTarea(string titulo, string descripcion, DateTime fecha, string prioridad, string estado)
        {
            Tarea tarea = new Tarea();
            tarea.Titulo = titulo;
            tarea.Descripcion = descripcion;
            tarea.Fecha = fecha;
            tarea.Prioridad = prioridad;
            tarea.Estado = estado;

            ListaTareas.Add(tarea);
            return "¡Tarea guardada correctamente! " + fecha;
        }
        [WebMethod]
        public static List<Tarea> ListarTareas()
        {
            return ListaTareas;
        }

    }
}