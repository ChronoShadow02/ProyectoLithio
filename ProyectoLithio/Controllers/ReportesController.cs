using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;
namespace ProyectoLithio.Controllers
{
    

    public class ReportesController : Controller
    {
        // GET: Reportes


        LithioBDEntities LithioBD = new LithioBDEntities();

        [HttpGet]
        public ActionResult ReporteListaCosteo()
        {
            using (LithioBD)
            {

                List<ProyectoLithio.Models.pa_ReporteListaCosteo_Result> pa_ReporteListas = new List<pa_ReporteListaCosteo_Result>();

                pa_ReporteListas = this.LithioBD.pa_ReporteListaCosteo(null, null, null, null).ToList();

                return View(pa_ReporteListas);
            }
        }
    }
}