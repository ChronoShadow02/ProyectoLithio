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

        #region UsuariosLista
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
                RegistrosAfectados = this.modeloBD.pa_Usuarios_Insert(modeloVista.Primer_Nombre,
                                                                      modeloVista.Primer_Apellido,
                                                                      modeloVista.Segundo_Apellido,
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
        public ActionResult UsuarioModifica()
        {
            
            return View();
        }
        #endregion
    }
}