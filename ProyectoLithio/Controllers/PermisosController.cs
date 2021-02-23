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
        [HttpGet]
        public ActionResult PermisosModifica(int Id_Usuario)
        {
            pa_PermisosRetornaID_Result modeloVista = new pa_PermisosRetornaID_Result();

            modeloVista = this.modeloBD.pa_PermisosRetornaID(Id_Usuario).FirstOrDefault();

            this.TipoUsuarioVB();//Metodo que indica los tipos de usuario en el sistema
            this.EstadoUsuario();
            return View(modeloVista);
        }
        #endregion

        #region PermisosModificaPost
        [HttpPost]
        public ActionResult PermisosModifica(pa_PermisosRetornaID_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;

            try
            {
                RegistrosAfectados = this.modeloBD.pa_Permisos_Update(modeloVista.Id_Usuario,
                                                                      modeloVista.Id_Estado_Usuario,
                                                                      modeloVista.Id_Tipo_Usuario);
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
                    mensaje = "Permisos Modificado";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    mensaje += ".No se pudo modificar";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                }
            }

            this.TipoUsuarioVB();
            this.EstadoUsuario();
            return View(modeloVista);
        }
        #endregion

        #region TipoUsuarioViewBag
        void TipoUsuarioVB()
        {
            this.ViewBag.ListaTipoUsuario = this.modeloBD.pa_TipoUsuario_Select().ToList();
        }
        #endregion

        #region EstadoUsuarioViewbag

        void EstadoUsuario()
        {
            this.ViewBag.ListaEstadoUsuario = this.modeloBD.pa_EstadoUsuario_Select().ToList();
        }
        #endregion
    }
}