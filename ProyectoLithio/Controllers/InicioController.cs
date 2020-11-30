using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class InicioController : Controller
    {
        // GET: Inicio
        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult Bienvenida()
        {
            bool sesionIniciada = false;
            if (this.Session["logueado"] != null)
            {
                sesionIniciada = Convert.ToBoolean(this.Session["logueado"]);
            }
            if (sesionIniciada == true)
            {
                /// se "reconstruye " los datos del modelo accediendo al objeto Session
                pa_RetornaUsuarioCorreoPwd_Select_Result modelo = (pa_RetornaUsuarioCorreoPwd_Select_Result) this.Session["datosUsuario"];

                return View(modelo);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
            
        }
    }
}