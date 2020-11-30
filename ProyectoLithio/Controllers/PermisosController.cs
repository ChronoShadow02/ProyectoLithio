using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class PermisosController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();
        // GET: Permisos
        public ActionResult PermisosLista()
        {
            List<pa_Permisos_Select_Result> modeloVista = new List<pa_Permisos_Select_Result>();

            modeloVista = this.modeloBD.pa_Permisos_Select().ToList();

            return View(modeloVista);
        }
    }
}