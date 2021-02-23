 using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class PresentacionesController : Controller
    {
        #region Modelo de base de datos

        private LithioBDEntities modeloBD = new LithioBDEntities();

        #endregion Modelo de base de datos

        #region PresentacionesLista

        [HttpGet]
        public ActionResult PresentacionesLista()
        {
            List<pa_Presentaciones_Select_Result> modeloVista = new List<pa_Presentaciones_Select_Result>();

            modeloVista = this.modeloBD.pa_Presentaciones_Select().ToList();

            return View(modeloVista);
        }

        #endregion PresentacionesLista

        #region PresentacionesNuevo

        /// <summary>
        /// Metodo que retorna un formulario para ingresar la nueva presentacion
        /// </summary>
        /// <returns>Vista();</returns>
        [HttpGet]
        public ActionResult PresentacionesNuevo()
        {
            return View();
        }

        #endregion PresentacionesNuevo

        #region PresentacionesNuevoPost

        [HttpPost]
        public ActionResult PresentacionesNuevo(pa_Presentaciones_Select_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;
            bool PresentacionExiste = true;
            try
            {
                pa_Presentaciones_ExistePresentacion_Result PresentacionVerifica = new pa_Presentaciones_ExistePresentacion_Result();
                PresentacionVerifica = this.modeloBD.pa_Presentaciones_ExistePresentacion(modeloVista.Nombre_Presentacion).FirstOrDefault();

                if (PresentacionVerifica!=null)
                {
                    PresentacionExiste = true;
                }
                else
                {
                    RegistrosAfectados = this.modeloBD.pa_Presentaciones_Insert(modeloVista.Nombre_Presentacion);
                }
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
                    mensaje = "Presentación registrada.";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    if (PresentacionExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Esta presentación ya existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    else
                    {
                        mensaje += "No se pudo ingresar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                }
            }
            return View(modeloVista);
        }

        #endregion PresentacionesNuevoPost

        #region PresentacionesModifica

        [HttpGet]
        public ActionResult PresentacionesModifica(int Id_Presentacion)
        {
            pa_PresentacionesRetornaID_Result modeloVista = new pa_PresentacionesRetornaID_Result();

            modeloVista = this.modeloBD.pa_PresentacionesRetornaID(Id_Presentacion).FirstOrDefault();

            return View(modeloVista);
        }

        #endregion PresentacionesModifica

        #region PresentacionesModificaPost

        [HttpPost]
        public ActionResult PresentacionesModifica(pa_PresentacionesRetornaID_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;
            //bool PresentacionExiste = true;
            try
            {
              /*  pa_Presentaciones_ExistePresentacion_Result PresentacionVerifica = new pa_Presentaciones_ExistePresentacion_Result();
                PresentacionVerifica = this.modeloBD.pa_Presentaciones_ExistePresentacion(modeloVista.Nombre_Presentacion).FirstOrDefault();

                if (PresentacionVerifica != null)
                {
                    PresentacionExiste = true;
                }
                else
                {*/
                    RegistrosAfectados = this.modeloBD.pa_Presentaciones_Update(modeloVista.Id_Presentacion, modeloVista.Nombre_Presentacion);
                //}
                
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
                    mensaje = "Presentación modificada.";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    /*if (PresentacionExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Esta presentación ya existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    else
                    {*/
                        mensaje += "No se pudo ingresar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    //}
                }
            }
            return View(modeloVista);
        }

        #endregion PresentacionesModificaPost
    }
}