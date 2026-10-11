using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeguimientoTareasDiarias.Models
{
    public class Tarea
    {
        public int Id { get; set; }
        public string Titulo { get; set; }

        public string Descripcion { get; set; }

        public string Fecha { get; set; }

        public string Prioridad { get; set; }

        public string Estado { get; set; }
    }
}