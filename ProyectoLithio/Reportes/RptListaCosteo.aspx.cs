using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoLithio.Models;
namespace ProyectoLithio.Views.Reportes
{
    public partial class RptListaCosteo : System.Web.UI.Page
    {
        LithioBDEntities LithioBD = new LithioBDEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (LithioBD)
                {
                    //buscar los datos de los filtros

                    List<pa_ReporteListaCosteo_Result> modeloReporte = new List<pa_ReporteListaCosteo_Result>();

                    DateTime fechaInicial = Convert.ToDateTime(DateTime.Now);
                    DateTime fechaFinal = Convert.ToDateTime(DateTime.Now);

                    fechaInicial = fechaInicial.Date;
                    fechaFinal = fechaFinal.Date;
                    txtFechaInicial.Text = Convert.ToString(fechaInicial);
                    txtFechaFinal.Text = Convert.ToString(fechaFinal);

                    modeloReporte = this.LithioBD.pa_ReporteListaCosteo(null,null, fechaInicial, fechaFinal).ToList();


                    ReportDataSource rprds = new ReportDataSource("DataSetListaCosteo", modeloReporte);
                     
                    ///limpiar los datos de la fuente de datos
                    rpvCosteos.LocalReport.DataSources.Clear();

                    rpvCosteos.LocalReport.DataSources.Add(rprds);

                    //mostrar los datos del reporte
                    rpvCosteos.LocalReport.Refresh();
                }
            }
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {

            int? numeroCosteo = 0;
            string dua = "";
            DateTime fechaInicial;
            DateTime fechaFinal;
            //buscar los datos de los filtros

            List<pa_ReporteListaCosteo_Result> modeloReporte = new List<pa_ReporteListaCosteo_Result>();

            ///variables de los parametros del reporte
            ///

            if (txtNumeroCosteo.Text == "")
            {
                
                numeroCosteo = null;
            }
            else
            {
                numeroCosteo = Convert.ToInt32(txtNumeroCosteo.Text);
            }
            if (txtDUA.Text=="")
            {
                dua = null;
            }
            else {
                
                dua = txtDUA.Text;
            }
            if (txtFechaInicial.Text=="")
            {
                fechaInicial = Convert.ToDateTime(txtFechaInicial.Text);
            }
            else
            {
                fechaInicial = Convert.ToDateTime(txtFechaInicial.Text);
                fechaInicial = fechaInicial.Date;
            }
            if (txtFechaFinal.Text=="")
            {
                 fechaFinal = Convert.ToDateTime(txtFechaFinal.Text);
            }
            else
            {
                 fechaFinal = Convert.ToDateTime(txtFechaFinal.Text);
                fechaFinal = fechaFinal.Date;
            }
            



            modeloReporte = this.LithioBD.pa_ReporteListaCosteo(numeroCosteo, dua, fechaInicial, fechaFinal).ToList();


            ReportDataSource rprds = new ReportDataSource("DataSetListaCosteo", modeloReporte);

            ///limpiar los datos de la fuente de datos
            rpvCosteos.LocalReport.DataSources.Clear();

            rpvCosteos.LocalReport.DataSources.Add(rprds);

            //mostrar los datos del reporte
            rpvCosteos.LocalReport.Refresh();
        }
    }
}