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

        public decimal Tipo_De_Cambio { get; set; }

        public List<Concepto> Conceptos { get; set; }
    }

    public class Concepto {

        public int Id_Articulo { get; set; }

        public string NombreProveedor { get; set; }

        public int Id_Proveedor { get; set; }

        public string Codigo_Articulo { get; set; }

        public string Nombre_Articulo { get; set; }

        public int IdPresentacion { get; set; }
        public string NombrePresentacion { get; set; }
        public double CantidadArticulos { get; set; }
        public float Costo_Por_Unidad_Dolares { get; set; }
    }
        
    
}