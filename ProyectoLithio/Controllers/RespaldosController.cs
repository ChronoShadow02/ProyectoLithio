using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;
namespace ProyectoLithio.Controllers
{
    public class RespaldosController : Controller
    {

        LithioBDEntities LithioBD = new LithioBDEntities();

        [HttpPost]
        public ActionResult CrearRespaldo()
        {
            string mensaje = "";
            string titulo = "";
            string icono = "";
            try
            {
                ///ejecuta el procedimiento de respaldo
                this.LithioBD.pa_CrearRespaldo();

                mensaje = "Respaldo hecho de forma existosa!";
                titulo = "Éxito";
                icono = "success";

            }
            catch (Exception ex)
            {
                mensaje = "Hubo un error" + ex.Message;
                titulo = "Hubo un error";
                icono = "error";
            }

            return Json(
                new { mensaje = mensaje, titulo = titulo,icono = icono}
                );
        }

    }
}