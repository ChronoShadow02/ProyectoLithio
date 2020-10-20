using Microsoft.SqlServer.Server;
using ProyectoLithio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        #endregion

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
        #endregion

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
                try
                {
                    RegistrosAfectados = this.modeloBD.pa_Paises_Insert(modeloVista.Nombre_Pais,
                                                                        modeloVista.Sigla_Pais,
                                                                        modeloVista.Moneda_Pais);

                }
                catch (Exception ex)
                {
                    mensaje = "Hubo un error " + ex.Message;
                }
                finally
                {
                    if (RegistrosAfectados > 0)
                    {
                        mensaje = "País Registrado.";
                    }
                    else
                    {
                        mensaje += "No se pudo ingresar.";
                    }
                }
            Response.Write("<script language=javascript>alert('" + mensaje + "');</script>");
            return View(modeloVista);
        }
        #endregion

        #region PaisModifica
            [HttpGet]
            public ActionResult PaisModifica(int Id_Pais)
            {
                pa_PaisesRetornaID_Result modeloVista = new pa_PaisesRetornaID_Result();

                modeloVista = this.modeloBD.pa_PaisesRetornaID(Id_Pais).FirstOrDefault();

                return View(modeloVista);
            }
        #endregion
        #region PaisModificaPost
            public ActionResult PaisModifica(pa_PaisesRetornaID_Result modeloVista)
            {
                string mensaje = "";
                int RegistrosAfectados = 0; 

                try
                {
                    RegistrosAfectados = this.modeloBD.pa_Paises_Update(modeloVista.Id_Pais,
                                                                        modeloVista.Nombre_Pais,
                                                                        modeloVista.Sigla_Pais,
                                                                        modeloVista.Moneda_Pais);
                }
                catch (Exception ex)
                {
                    mensaje = "Ocurrio un error " + ex.Message;
                }
                finally
                {
                    if (RegistrosAfectados > 0)
                    {
                        mensaje = "Registro Modificado";
                    }
                    else
                    {
                        mensaje += ".No se pudo modificar";
                    }
                }
            Response.Write("<script language=javascript>alert('" + mensaje + "');</script>");
            return View(modeloVista);
            }
        #endregion
    }
}