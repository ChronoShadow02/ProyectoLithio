using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoLithio.Models.ViewModel
{
    public class CostosViewModel
    {
        public int Numero_Costos { get; set; }

        public string DUA { get; set; }

        public double Tipo_Cambio { get; set; }

        public DateTime Fecha_Creacion { get; set; }

        public List<Concepto> Conceptos { get; set; }
    }

    public class Concepto { 

        public int Id_Articulo { get; set; }

        public string Codigo_Articulo { get; set; }

        public string Nombre_Articulo { get; set; }


    }
        
    
}