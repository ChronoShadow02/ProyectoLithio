using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoLithio.Controllers
{
    public class PaisesController : Controller
    {
        LithioBDEntities modeloBD = new LithioBDEntities();

        #region PaisesLista

        // GET: Paises
        /// <summary>
        /// Metodo que muestra la lista de países
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PaisesLista()
        {
            List<pa_Paises_Select_Result> modeloListaPaises = new List<pa_Paises_Select_Result>();

            modeloListaPaises = this.modeloBD.pa_Paises_Select().ToList();

            return View(modeloListaPaises);
        }

        #endregion PaisesLista

        #region PaisesNuevo

        /// <summary>
        /// Metodo que Muestra un formulario para ingresar un nuevo país
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PaisesNuevo()
        {
            return View();
        }

        #endregion PaisesNuevo

        #region PaisNuevoPost

        [HttpPost]
        /// <summary>
        /// Metodo que ingresa un nuevo país
        /// </summary>
        /// <returns></returns>
        public ActionResult PaisesNuevo(pa_Paises_Select_Result modeloVista)
        {
            string mensaje = "";
            int RegistrosAfectados = 0;
            bool PaisExiste=true;
            try
            {
                pa_Paises_ExistePais_Result PaisVerifica = new pa_Paises_ExistePais_Result();
                PaisVerifica = modeloBD.pa_Paises_ExistePais(modeloVista.Nombre_Pais).FirstOrDefault();
                if (PaisVerifica != null)///Si no es igual a null o ya existe el dato
                {
                    PaisExiste=true;
                }
                else 
                {
                    RegistrosAfectados = this.modeloBD.pa_Paises_Insert(modeloVista.Nombre_Pais,
                                                                        modeloVista.Sigla_Pais,
                                                                        modeloVista.Moneda_Pais);
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
                    mensaje = "País Registrado";

                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    if (PaisExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Este país ya existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
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

        #endregion PaisNuevoPost

        #region PaisModifica

        [HttpGet]
        public ActionResult PaisModifica(int Id_Pais)
        {
            pa_PaisesRetornaID_Result modeloVista = new pa_PaisesRetornaID_Result();

            modeloVista = this.modeloBD.pa_PaisesRetornaID(Id_Pais).FirstOrDefault();

            return View(modeloVista);
        }

        #endregion PaisModifica

        #region PaisModificaPost

        [HttpPost]
        public ActionResult PaisModifica(pa_PaisesRetornaID_Result modeloVista)
        {

            string mensaje = "";
            int RegistrosAfectados = 0;
            bool PaisExiste = true;
            try
            {
                //pa_Paises_ExistePais_Result PaisVerifica = new pa_Paises_ExistePais_Result();
                //PaisVerifica = modeloBD.pa_Paises_ExistePais(modeloVista.Nombre_Pais).FirstOrDefault();

                //if (PaisVerifica != null)///Si no es igual a null o ya existe el dato
                //{
                  //  if (PaisVerifica.Nombre_Pais == modeloVista.Nombre_Pais)
                    //{
                        RegistrosAfectados = this.modeloBD.pa_Paises_Update(modeloVista.Id_Pais,
                                                                            modeloVista.Nombre_Pais,
                                                                            modeloVista.Sigla_Pais,
                                                                            modeloVista.Moneda_Pais);
                    //}
                //}
                //else
                //{
                        //PaisExiste = false;
                //}
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
                    mensaje = "País Modificado";
                    Response.Write("<script language = javascript > Swal.fire({title: 'Exito!',text:'" + mensaje + "',icon: 'success',showConfirmButton: true})</script>");
                }
                else
                {
                    /*if (!PaisExiste)
                    {
                        Response.Write("<script language = javascript > Swal.fire({title: 'Este país ya existe!',text:'" + "" + "',icon: 'error',showConfirmButton: true})</script>");
                    }*/
                    //else
                    //{
                        mensaje += "No se pudo modificar";
                        Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
                    //}
                }
            }
            
            return View(modeloVista);
        }

        #endregion PaisModificaPost
    }
}