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

        #region PermisosLista
        // GET: Permisos
        public ActionResult PermisosLista()
        {
            List<pa_Permisos_Select_Result> modeloVista = new List<pa_Permisos_Select_Result>();

            modeloVista = this.modeloBD.pa_Permisos_Select().ToList();

            return View(modeloVista);
        }
        #endregion

        #region PermisosModifica
        /// <summary>
        /// Metodo que retorna el usuario dependiendo de su id
        /// </summary>
        /// <param name="Id_Usuario"></param>
        /// <returns></returns>
        public ActionResult PermisosModifica(int Id_Usuario)
        {
            pa_PermisosRetornaID_Result modeloVista = new pa_PermisosRetornaID_Result();

            modeloVista = this.modeloBD.pa_PermisosRetornaID(Id_Usuario).FirstOrDefault();

            return View(modeloVista);
        }
        #endregion
    }
}