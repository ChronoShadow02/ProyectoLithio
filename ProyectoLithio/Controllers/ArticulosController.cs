using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;

namespace ProyectoLithio.Controllers
{
    public class ArticulosController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        #region ArticulosLista
        // GET: Articulos
        [HttpGet]
        public ActionResult ArticulosLista()
        {
            List<pa_Articulos_Select_Result> modeloVista = new List<pa_Articulos_Select_Result>();

            modeloVista = this.modeloBD.pa_Articulos_Select().ToList();

            return View(modeloVista);
        } 
        #endregion
    }
}