using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoLithio.Models.ViewModel
{
    public class RecuperarPassViewModel
    {
        public string token { set; get; }

        public string Contrasena { get; set; }

        public string ContrasenaConfirmada { get; set; }
    }
}