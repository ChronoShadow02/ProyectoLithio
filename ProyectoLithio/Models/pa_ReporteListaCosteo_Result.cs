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
    
    public partial class pa_ReporteListaCosteo_Result
    {
        public int Id_Costo { get; set; }
        public int Numero_Costos { get; set; }
        public string DUA { get; set; }
        public decimal Tipo_De_Cambio { get; set; }
        public string Codigo_Articulo { get; set; }
        public string Nombre_Articulo { get; set; }
        public string Nombre_Presentacion { get; set; }
        public string Nombre_Proveedor { get; set; }
        public int Unidades_Articulos { get; set; }
        public double Costo_Por_Unidad_Dolares { get; set; }
        public double Costo_Total_Dolares { get; set; }
        public Nullable<double> Total_Costo_Dolares { get; set; }
        public Nullable<double> ProbCostoTotalCompra { get; set; }
        public Nullable<double> DistCostoMaritimo { get; set; }
        public Nullable<double> DistCostoTerrestre { get; set; }
        public Nullable<double> MontoCostoPorArticuloMar { get; set; }
        public Nullable<double> MontoCostoPorArticuloTer { get; set; }
        public Nullable<double> Total_CosteoPorArticuloMar { get; set; }
        public Nullable<double> Total_CosteoPorArticuloTer { get; set; }
        public Nullable<double> Total_CosteoTotal { get; set; }
        public System.DateTime Fecha_Creacion { get; set; }
    }
}
