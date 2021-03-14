using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;
namespace ProyectoLithio.Controllers
{
    public class CostosController : Controller
    {
        LithioBDEntities LithioBD = new LithioBDEntities();

        // GET: Costos
        [HttpGet]
        public ActionResult Costeo()
        {
            return View();
        }

        
        public JsonResult RetornaArticulos()
        {
            List <pa_RetornaArticulosAC_Result> ListaArticulos  = this.LithioBD.pa_RetornaArticulosAC().ToList();

            return new JsonResult { Data = ListaArticulos, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}