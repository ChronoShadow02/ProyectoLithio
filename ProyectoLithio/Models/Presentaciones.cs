//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoLithio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Presentaciones
    {
        public Presentaciones()
        {
            this.Articulos = new HashSet<Articulos>();
            this.Costo_Concepto = new HashSet<Costo_Concepto>();
            this.Costo_ConceptoAux = new HashSet<Costo_ConceptoAux>();
        }
    
        public int Id_Presentacion { get; set; }
        public string Nombre_Presentacion { get; set; }
    
        public virtual ICollection<Articulos> Articulos { get; set; }
        public virtual ICollection<Costo_Concepto> Costo_Concepto { get; set; }
        public virtual ICollection<Costo_ConceptoAux> Costo_ConceptoAux { get; set; }
    }
}
