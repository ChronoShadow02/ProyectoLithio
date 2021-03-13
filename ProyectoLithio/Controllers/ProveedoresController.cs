using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class ProveedoresController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        #region ProveedoresLista
        // GET: Lista de proveedores
        [HttpGet]
        public ActionResult ProveedoresLista()
        {
            List<pa_Proveedores_Select_Result> modeloVista = new List<pa_Proveedores_Select_Result>();

            modeloVista = this.modeloBD.pa_Proveedores_Select().ToList();

            return View(modeloVista);
        }
        #endregion

        #region ProveedoresNuevo
        /// <summary>
        /// Metodo que forma el formulario de registro de proveedores
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ProveedoresNuevo()
        {
            this.MostrarPaises();
            return View();
        }
        #endregion

        #region ProveedoresNuevoPost
        /// <summary>
        /// Metodo que ingresa el registro de proveedores
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ProveedoresNuevo(pa_Proveedores_Select_Result modeloVista)
        {
            int RegistrosAfectados = 0;
            string mensaje = "";
            bool ProveedorExiste = true;
            try
            {
                pa_Proveedores_ExisteProveedor_Result ProveedorVerifica = new pa_Proveedores_ExisteProveedor_Result();
                ProveedorVerifica = this.modeloBD.pa_Proveedores_ExisteProveedor(modeloVista.Codigo_Proveedor,modeloVista.Nombre_Proveedor).FirstOrDefault();
                if (ProveedorVerifica!=null)
                {
                    ProveedorExiste = true;
                }
                else{
                    RegistrosAfectados = this.modeloBD.pa_Proveedores_Insert(modeloVista.Nombre_Proveedor,
                                                                         modeloVista.Codigo_Proveedor,
                                                                         modeloVista.Id_Pais);
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
                    mensaje = "Proveedor Registrado";

                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    if (ProveedorExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Este proveedor ya existe! o los valores son incorrectos',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    else
                    {
                        mensaje += "No se pudo ingresar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                }
            }
            this.MostrarPaises();
            return View(modeloVista);
        }
        #endregion

        #region ProveedoresModifica
        /// <summary>
        /// Metodo que retorna los datos rependiendo del id_proveedor
        /// </summary>
        /// <param name="Id_Proveedor"></param>
        /// <returns></returns>
        public ActionResult ProveedoresModifica(int Id_Proveedor)
        {
            pa_ProveedoresRetornaID_Result modeloVista = new pa_ProveedoresRetornaID_Result();


            modeloVista = this.modeloBD.pa_ProveedoresRetornaID(Id_Proveedor).FirstOrDefault();

            this.MostrarPaises();

            return View(modeloVista);
        }
        #endregion

        #region ProveedoresModificaPost
        /// <summary>
        /// Metodo que retorna los datos rependiendo del id_proveedor
        /// </summary>
        /// <param name="Id_Proveedor"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ProveedoresModifica(pa_ProveedoresRetornaID_Result modeloVista)
        {
            int RegistrosAfectados = 0;
            string mensaje = "";
            //bool ProveedorExiste = true;
            try
            {
                /*pa_Proveedores_ExisteProveedor_Result ProveedorVerifica = new pa_Proveedores_ExisteProveedor_Result();
                ProveedorVerifica = this.modeloBD.pa_Proveedores_ExisteProveedor(modeloVista.Codigo_Proveedor, modeloVista.Nombre_Proveedor).FirstOrDefault();
                if (ProveedorVerifica != null)
                {
                    ProveedorExiste = true;
                }
                else
                {*/
                    RegistrosAfectados = this.modeloBD.pa_Proveedores_Update(modeloVista.Id_Proveedor,
                                                                             modeloVista.Codigo_Proveedor,
                                                                             modeloVista.Nombre_Proveedor,
                                                                             modeloVista.Id_Pais);
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
                    mensaje = "Proveedor Modificado";

                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    /*if (ProveedorExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Este proveedor ya existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
                    }
                    else
                    {*/
                        mensaje += "No se pudo ingresar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    //}
                }
            }
            this.MostrarPaises();   
            return View(modeloVista);
        }
        #endregion

        #region MostrarPaisesViewBag
        void MostrarPaises()
        {
            List<pa_Paises_Select_Result> listaPaises = this.modeloBD.pa_Paises_Select().ToList();

            ViewBag.ListaPaises = listaPaises;
        }
        #endregion
    }
}