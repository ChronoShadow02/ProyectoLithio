using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class UsuariosController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();
        #region MyRegion
        /// <summary>
        /// Metodo que trae la lista de usuarios
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult UsuariosLista()
        {
            List<pa_Usuarios_Select_Result> modeloVistaUsuarios = new List<pa_Usuarios_Select_Result> ();

            modeloVistaUsuarios = this.modeloBD.pa_Usuarios_Select().ToList();

            return View(modeloVistaUsuarios);
        }
        #endregion

    }
}