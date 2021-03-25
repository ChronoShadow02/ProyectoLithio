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
                    oCostos.Tipo_De_Cambio = model.Tipo_De_Cambio;
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
                this.ViewBag.Mensaje = "fallo" + ex.Message;
            }
            return View();
        }

        #region RetornaArticulosJSON
        /// <summary>
        /// Json que trae los codigos de los articulos 
        /// </summary>
        /// <returns></returns>
        //[HttpPost]
        public JsonResult RetornaArticulos(string search)
        {
            List<ArticulosViewModel> ArtVM = LithioBD.Articulos.Where(x => x.Codigo_Articulo.Contains(search)).Select(x => new ArticulosViewModel
            {
                Codigo_Articulo = x.Codigo_Articulo
            }).ToList();
            return new JsonResult { Data = ArtVM,JsonRequestBehavior = JsonRequestBehavior.AllowGet};
        }
        #endregion

        #region BuscaCodigo
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Codigo_Articulo"></param>
        /// <returns></returns>
        //Metodo que busca los demas datos del articulo utilizando el codigo para realizar la busqueda
        public ActionResult BuscaCodigo(string Codigo_Articulo)
        {
            //variables para cada uno de los campos que van a ir en la linea
            string Nombre_Articulo = "";

            try
            {
                pa_Costos_BusquedaCodigoArt_Result modeloBusquedaCodigo = new pa_Costos_BusquedaCodigoArt_Result();

                modeloBusquedaCodigo = this.LithioBD.pa_Costos_BusquedaCodigoArt(Codigo_Articulo).FirstOrDefault();

                Nombre_Articulo = modeloBusquedaCodigo.Nombre_Articulo;
            }
            catch (Exception ex)
            {


            }
            return Json(new { });
        }
#endregion
    }
}