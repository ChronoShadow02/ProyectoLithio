using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class RespaldosController : Controller
    {

        [HttpPost]
        public ActionResult CrearRespaldo()
        {
            string mensaje = "";
            string titulo = "";
            string icono = "";
            try
            {
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