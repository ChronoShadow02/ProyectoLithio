using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;
using ProyectoLithio.Models.ViewModel;
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

        [HttpPost]
        public ActionResult Costeo(CostosViewModel model)
        {
            try
            {
                using (LithioBD)
                {
                    Costos oCostos = new Costos();
                    //Se asigna a cada campo de la tabla los datos recolecados desde la vista
                    oCostos.Numero_Costos = model.Numero_Costos;
                    oCostos.DUA = model.DUA;
                    oCostos.Tipo_De_Cambio = model.Tipo_Cambio;
                    oCostos.Fecha_Creacion = DateTime.Now;
                    //Agrega los datos en la base de datos
                    LithioBD.Costos.Add(oCostos);
                    //guarda el registro del maestro en la base de datos
                    LithioBD.SaveChanges();

                    //Recorrer cada linea del maestro detalle
                    foreach (var OC in model.Conceptos)
                    {
                        Concepto oConcepto = new Concepto();
                        oConcepto.Codigo_Articulo = OC.Codigo_Articulo;

                    }

                    //guarda los registros en la base de datos
                    LithioBD.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw new Exception();
            }
            return View();
        }

        public JsonResult RetornaArticulos()
        {
            List<pa_RetornaArticulosAC_Result> ListaArticulos = this.LithioBD.pa_RetornaArticulosAC(null).ToList();

            return new JsonResult { Data = ListaArticulos, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}