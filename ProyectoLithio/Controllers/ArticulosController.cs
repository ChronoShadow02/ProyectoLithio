using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;

namespace ProyectoLithio.Controllers
{
    public class ArticulosController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        #region ArticulosLista
        /// <summary>
        /// Lista de artículos
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ArticulosLista()
        {
            List<pa_Articulos_Select_Result> modeloVista = new List<pa_Articulos_Select_Result>();

            modeloVista = this.modeloBD.pa_Articulos_Select().ToList();

            return View(modeloVista);
        }
        #endregion


        #region ArticulosNuevo
        /// <summary>
        /// Formulario de Articulos Nuevo
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ArticulosNuevo()
        {
            this.PresentacionViewBag();
            this.ProveedorViewBag();
            return View();
        }
        #endregion

        #region ArticulosNuevoPost
        [HttpPost]
        public ActionResult ArticulosNuevo(pa_Articulos_Select_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;
            bool ExisteCodigo=true;
            try
            {
                pa_Articulos_ExisteArticulosCodigo_Result VerificaCodigo = new pa_Articulos_ExisteArticulosCodigo_Result();
                VerificaCodigo = this.modeloBD.pa_Articulos_ExisteArticulosCodigo(modeloVista.Codigo_Articulo).FirstOrDefault();

                if (VerificaCodigo!=null)
                {
                    ExisteCodigo = true;
                }
                else
                {
                    RegistrosAfectados = this.modeloBD.pa_Articulos_Insert(modeloVista.Codigo_Articulo,
                                                                       modeloVista.Nombre_Articulo,
                                                                       modeloVista.Descripcion_Articulo,
                                                                       modeloVista.Cantidad_Articulo,
                                                                       modeloVista.Costo_Articulo,
                                                                       modeloVista.Costo_Anterior_Articulo,
                                                                       modeloVista.Id_Proveedor,
                                                                       modeloVista.Id_Presentacion
                                                                       );
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
                    mensaje = "Artículo Registrado";
                    Response.Write("<script language = javascript >Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true}); </script>");
                }
                else
                {
                    if (ExisteCodigo == true)
                    {
                        mensaje = "El artículo ya existe!";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    else
                    {
                        mensaje += "No se pudo ingresar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    
                }
            }
            this.PresentacionViewBag();
            this.ProveedorViewBag();
            return View();
        }
        #endregion

        #region ArticulosModifica
        [HttpGet]
        public ActionResult ArticulosModifica(int Id_Articulo)
        {
            pa_ArticulosRetornaID_Result modeloVista = new pa_ArticulosRetornaID_Result();

            modeloVista = this.modeloBD.pa_ArticulosRetornaID(Id_Articulo).FirstOrDefault();
            this.PresentacionViewBag();
            this.ProveedorViewBag();
            return View(modeloVista);
        }
        #endregion

        #region ArticulosModificaPost
        [HttpPost]
        public ActionResult ArticulosModifica(pa_ArticulosRetornaID_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;
            try
            {
                RegistrosAfectados = this.modeloBD.pa_Articulos_Update(modeloVista.Id_Articulo,
                                                                       modeloVista.Codigo_Articulo,
                                                                       modeloVista.Nombre_Articulo,
                                                                       modeloVista.Descripcion_Articulo,
                                                                       modeloVista.Cantidad_Articulo,
                                                                       modeloVista.Costo_Articulo,
                                                                       modeloVista.Costo_Anterior_Articulo,
                                                                       modeloVista.Id_Proveedor,
                                                                       modeloVista.Id_Presentacion);
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
                    mensaje = "Artículo Modificado";
                    Response.Write("<script language = javascript >Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true}); </script>");
                }
                else
                {
                    mensaje += "No se pudo ingresar";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                }
            }
            this.PresentacionViewBag();
            this.ProveedorViewBag();
            return View(modeloVista);
        }
        #endregion

        #region PresentacionViewBag
        void PresentacionViewBag()
        {
            this.ViewBag.ListaPresentaciones = this.modeloBD.pa_Presentaciones_Select().ToList();
        }
        #endregion

        #region ProveedorViewBag
        void ProveedorViewBag()
        {
            this.ViewBag.ListaProveedores = this.modeloBD.pa_Proveedores_Select().ToList();
        }
        #endregion
    }
}