using ProyectoLithio.Models;
using System;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class LoginController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        string urlDominio= "http://localhost:58219/";

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
        public ActionResult VerificaLogin(pa_RetornaUsuarioCorreoPwd_Select_Result pModelo)
        {

            ///Busca el usuario tomando en cuenta el usuario y contraseña
            pa_RetornaUsuarioCorreoPwd_Select_Result usuarioBuscar = 
                this.modeloBD.pa_RetornaUsuarioCorreoPwd_Select(pModelo.Correo_Electronico, pModelo.Contrasena_Usuario).FirstOrDefault();

            if (usuarioBuscar == null)
            {
                //Permanece en index del controlador Login
                //Muestra un mensaje de error
                this.ModelState.AddModelError("", "Usuario o contraseña inválidos.");
                this.ViewBag.UsuarioLogueado = false;
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
        }

        #endregion IndexPost

        #region CerrarSesion
        /// <summary>
        /// Cierra la sesion y establece los valores de la sesion en null
        /// </summary>
        /// <returns></returns>
        public ActionResult CerrarSesion()
        {
            ///establecer los datos de sesion 
            ///que cuando el layout consulte por dichos datos
            ///re-direccione al login
            this.Session["logueado"] = null;

            this.Session["datosUsuario"] = null;
            
            return RedirectToAction("Index", "Login");
        }
        #endregion

        #region startRecovery
        /// <summary>
        /// Metodo que inicia el proceso de olvidar contraseña
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult StartRecovery()
        {
            return View();
        }
        #endregion

        #region startRecoveryPost
        /// <summary>
        /// Metodo que inicia el proceso de procesar y enviar el correo de recuperacion de  contraseña
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult StartRecovery(string Correo_Electronico)
        {
            ///Forma de generar un token

            string token = GetSha256(Guid.NewGuid().ToString());

            pa_VerificarCorreoRecuperacionPass_Result modeloRecuperacionPass = new pa_VerificarCorreoRecuperacionPass_Result();

            modeloRecuperacionPass = this.modeloBD.pa_VerificarCorreoRecuperacionPass(Correo_Electronico).FirstOrDefault();

            Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");

            if (modeloRecuperacionPass!=null)//Si el registro existe actualizar el campo de token
            {
                ///utilizar aca un sp para indicar la actualización del token
                this.modeloBD.pa_ActualizarTokenRecuperacionPass(Correo_Electronico, token);

                SendEmail(Correo_Electronico,token);
                Response.Write("<script language = javascript > Swal.fire({title: 'Favor verificar el correo!',text:'" + "" + "',icon: 'success',showConfirmButton: true})</script>");
            }
            else
            {
                Response.Write("<script language = javascript > Swal.fire({title: 'Este correo no existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
            }
            return View();
        }
        #endregion

        #region Recovery
        /// <summary>
        /// Metodo donde ya se recibe el correo para hacer el cambio de contraseña
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Recovery(string token)
        {
            Models.ViewModel.RecuperarPassViewModel modeloVista = new Models.ViewModel.RecuperarPassViewModel();
            modeloVista.token = token;
            using (modeloBD)
            {
                if (modeloVista.token==null || modeloVista.token.Trim().Equals(""))
                {
                    return View("Index");
                }
                var oUsuario = modeloBD.Usuarios.Where(d => d.Token_Recovery == modeloVista.token).FirstOrDefault();
                if (oUsuario == null)
                {
                    this.ViewBag.Error = "El token ha expirado";
                    return View("Index");
                }
            }
            return View();
        }
        #endregion

        #region RecoveryPost
        [HttpPost]
        public ActionResult Recovery(Models.ViewModel.RecuperarPassViewModel modeloVista)
        {
            try
            {
                using (modeloBD)
                {
                    var oUsuario = modeloBD.Usuarios.Where(d => d.Token_Recovery == modeloVista.token).FirstOrDefault();

                    if (oUsuario != null)
                    {
                        oUsuario.Contrasena_Usuario = modeloVista.Contrasena;
                        oUsuario.Token_Recovery = null;
                        modeloBD.Entry(oUsuario).State = System.Data.EntityState.Modified;
                        modeloBD.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            this.ViewBag.Mensaje = "Contraseña modificada con éxito";
            return View("Index");
        }
        #endregion

        #region Helpers
        private string GetSha256(string str)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        private void SendEmail(string EmailDestino,string token)
        {
            try
            {
                string EmailOrigen = "angelandresvc007@gmail.com";
                string Contrasena = "Ir3n3b433$un4d10$4";
                string url = urlDominio+"/Login/Recovery?token="+token;
                MailMessage oMailMessage = new MailMessage(EmailOrigen, EmailDestino, "Recuperación de contraseña",
                    "<p>Correo para recuperación de contraseña</p><br>" +
                    "<a href='" + url + "'>Click para recuperar</a>");

                oMailMessage.IsBodyHtml = true;

                SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
                oSmtpClient.EnableSsl = true;
                oSmtpClient.UseDefaultCredentials = false;
                oSmtpClient.Port = 587;
                oSmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, Contrasena);

                oSmtpClient.Send(oMailMessage);
            }
            catch (Exception ex) 
            {
                string error = ex.Message;
                Console.WriteLine(error);
            }
        }
        #endregion
    }
}