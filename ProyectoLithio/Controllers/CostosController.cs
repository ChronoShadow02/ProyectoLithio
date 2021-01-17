using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class CostosController : Controller
    {
        // GET: Costos
        [HttpGet]
        public ActionResult Costeo()
        {
            return View();
        }
    }
}