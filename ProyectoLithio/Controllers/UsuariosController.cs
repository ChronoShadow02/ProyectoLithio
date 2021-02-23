using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Text;

namespace ProyectoLithio.Controllers
{
    public class UsuariosController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        string urlDominio = "http://localhost:58219/";

        #region UsuariosLista
        /// <summary>
        /// Metodo que trae la lista de usuarios
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult UsuariosLista()
        {
            List<pa_Usuarios_Select_Result> modeloVistaUsuarios = new List<pa_Usuarios_Select_Result>();

            modeloVistaUsuarios = this.modeloBD.pa_Usuarios_Select().ToList();

            return View(modeloVistaUsuarios);
        }
        #endregion

        #region UsuarioNuevo
        /// <summary>
        /// Metodo que muestra el formulario para ingresar un nuevo usuario
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult UsuariosNuevo()
        {
            return View();
        }
        #endregion

        #region UsuarioNuevoPost
        /// <summary>
        /// Metodo que ingresa el  registro de usuarios
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UsuariosNuevo(pa_Usuarios_SelectTodo_Result modeloVista)
        {
            int RegistrosAfectados = 0;
            string mensaje = "";
            try
            {
                RegistrosAfectados = this.modeloBD.pa_Usuarios_Insert(modeloVista.Nombre_Completo,
                                                                      modeloVista.Correo_Electronico,
                                                                      modeloVista.Contrasena_Usuario,
                                                                      2,
                                                                      2);
            }
            catch (Exception ex)
            {
                mensaje = "Hubo un error " + ex.Message;
            }
            finally
            {
                Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");
                if (RegistrosAfectados > 0)
                {
                    mensaje = "Usuario Registrado";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    mensaje += "No se pudo ingresar";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                }
            }
            return View();
        }
        #endregion

        #region UsuarioModifica
        [HttpGet]
        public ActionResult UsuarioModifica(int Id_Usuario)
        {
            pa_UsuariosRetornaID_Result modeloVista = new pa_UsuariosRetornaID_Result();

            modeloVista = this.modeloBD.pa_UsuariosRetornaID(Id_Usuario).FirstOrDefault();

            return View(modeloVista);
        }
        #endregion

        #region UsuarioModificaPost 

        public ActionResult UsuarioModifica(pa_UsuariosRetornaID_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;

            try
            {
                RegistrosAfectados = this.modeloBD.pa_UsuariosUpdate(modeloVista.Nombre_Completo,
                                                                     modeloVista.Correo_Electronico,
                                                                     modeloVista.Id_Usuario);
            }
            catch (Exception ex)
            {
                mensaje = "Ocurrio un error " + ex.Message;
            }
            finally
            {
                Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");
                if (RegistrosAfectados > 0)
                {
                    mensaje = "Usuario Modificado";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    mensaje += ".No se pudo modificar";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                }
            }
            return View(modeloVista);
        }
        #endregion


        #region RecuperarContrasena
        [HttpGet]
        public ActionResult RecuperarContrasena()
        {
            return View(); 
        }
        #endregion


        #region RecuperarContrasenaPost
        [HttpPost]
        public ActionResult RecuperarContrasena(string Correo_Electronico)
        {
            ///Forma de generar un token

            string token = GetSha256(Guid.NewGuid().ToString());

            pa_VerificarCorreoRecuperacionPass_Result modeloRecuperacionPass = new pa_VerificarCorreoRecuperacionPass_Result();

            modeloRecuperacionPass = this.modeloBD.pa_VerificarCorreoRecuperacionPass(Correo_Electronico).FirstOrDefault();

            Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");

            if (modeloRecuperacionPass != null)//Si el registro existe actualizar el campo de token
            {
                ///utilizar aca un sp para indicar la actualización del token
                this.modeloBD.pa_ActualizarTokenRecuperacionPass(Correo_Electronico, token);

                SendEmail(Correo_Electronico, token);
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
                if (modeloVista.token == null || modeloVista.token.Trim().Equals(""))
                {
                    return View("Bienvenida","Inicio");
                }
                var oUsuario = modeloBD.Usuarios.Where(d => d.Token_Recovery == modeloVista.token).FirstOrDefault();
                if (oUsuario == null)
                {
                    this.ViewBag.Error = "El token ha expirado";
                    return View("Login", "Index");
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
            return View("Login", "Index");
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

        private void SendEmail(string EmailDestino, string token)
        {
            try
            {
                string EmailOrigen = "angelandresvc007@gmail.com";
                string Contrasena = "Ir3n3b433$un4d10$4";
                string url = urlDominio + "/Usuarios/Recovery?token=" + token;
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