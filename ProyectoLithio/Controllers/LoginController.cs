using ProyectoLithio.Models;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class LoginController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        #region Index

        /// <summary>
        /// Metodo que muestra la pantalla de login
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        #endregion Index

        #region VerificaLoginPost

        /// <summary>
        ///
        /// </summary>
        /// <param name="pModelo"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult VerificaLogin(pa_RetornaUsuarioPwd_Select_Result pModelo)
        {
            ///Busca el usuario tomando en cuenta el usuario y contraseña
            pa_RetornaUsuarioPwd_Select_Result usuarioBuscar = 
                this.modeloBD.pa_RetornaUsuarioPwd_Select(pModelo.Nombre_Usuario, pModelo.Contrasena_Usuario).FirstOrDefault();

            if (usuarioBuscar == null)
            {
                //Permanece en index del controlador Login
                //Muestra un mensaje de error
                this.ModelState.AddModelError("", "Usuario o contraseña inválidos.Por favor verifique.");

                return View("Index");
            }
            else
            {
                ///Se crean variables de sesion para que 
                ///el Layout consulte por esas paginas y no redireccione al login
                this.Session.Add("logueado",true);
                ///Se agrega todo el modelo del usuario
                this.Session.Add("datosUsuario",usuarioBuscar);
                return RedirectToAction("Bienvenida","Inicio");
            }
            return View();
        }

        #endregion IndexPost
    }
}