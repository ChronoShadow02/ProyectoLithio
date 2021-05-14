using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoLithio.Models;
using ProyectoLithio.Models.ViewModel;
namespace ProyectoLithio.Controllers
{
    public class CostosController : Controller
    {
        LithioBDEntities LithioBD = new LithioBDEntities();

        #region CosteoGet
        // GET: Costos
        [HttpGet]
        public ActionResult Costeo()
        {
            return View();
        }
        #endregion

        #region CosteoPost
        [HttpPost]
        public ActionResult Costeo(CostosViewModel model)
        {
            int registrosAfectados = 0;
            string mensaje = "";
            try
            {
                using (LithioBD)
                {
                    Costos oCostos = new Costos();
                    //Se asigna a cada campo de la tabla los datos recolecados desde la vista
                    oCostos.Numero_Costos = model.Numero_Costos;
                    oCostos.DUA = model.DUA;
                    oCostos.Tipo_De_Cambio = model.Tipo_De_Cambio;
                    oCostos.Fecha_Creacion = DateTime.Now;
                    //Agrega los datos en la base de datos
                    LithioBD.Costos.Add(oCostos);
                    //guarda el registro del maestro en la base de datos
                    LithioBD.SaveChanges();

                    //Recorrer cada linea del maestro detalle para guardar los datos
                    foreach (var OC in model.Conceptos)
                    {
                        registrosAfectados = this.LithioBD.pa_Costo_ConceptoAux(oCostos.Id_Costo,
                                                                                OC.Codigo_Articulo,
                                                                                OC.Nombre_Articulo,
                                                                                OC.IdPresentacion,
                                                                                OC.NombrePresentacion,
                                                                                OC.Id_Proveedor,
                                                                                OC.NombreProveedor,
                                                                                OC.CantidadArticulos,
                                                                                OC.Costo_Por_Unidad_Dolares,
                                                                                OC.CantidadArticulos * OC.Costo_Por_Unidad_Dolares);


                    }

                    //guarda los registros en la base de datos
                    LithioBD.SaveChanges();


                    //aca se va a realizar el orden de los articulos por proveedor

                    List<pa_CostoAUX_OrdenarProveedor_Result> ordenarProveedor = this.LithioBD.pa_CostoAUX_OrdenarProveedor(oCostos.Id_Costo).ToList();

                    //contamos cuantos proveedores hay en ese costeo

                    List<pa_CostoContarProveedor_Result> pa_CostoContarProveedor = new List<pa_CostoContarProveedor_Result>();

                    pa_CostoContarProveedor = this.LithioBD.pa_CostoContarProveedor(oCostos.Id_Costo).ToList();

                    ///se recorre todas las lineas del costeo dependioendo de la cantidad de proveedores
                    ///para indicar el precio total de las lineas de cada proveedor
                    foreach (var opa_CostoContarProveedor in pa_CostoContarProveedor)
                    {
                        foreach (var OordenarProveedor in ordenarProveedor)
                        {
                            if (opa_CostoContarProveedor.Nombre_Proveedor == OordenarProveedor.Nombre_Proveedor)
                            {
                                //actualiza el precio de cada articulo dependiendo de cada proveedor
                                this.LithioBD.pa_updatePrecioFinalLineasCosteo(oCostos.Id_Costo, OordenarProveedor.Nombre_Proveedor, opa_CostoContarProveedor.CostoTotalporProveedor);

                                //Actualiza el "procentaje de cada articulo en el costeo"
                                this.LithioBD.pa_CostoProbUpdate(oCostos.Id_Costo, OordenarProveedor.Id_Costo_Concepto_AUX, OordenarProveedor.Nombre_Proveedor, OordenarProveedor.Costo_Total_Dolares / opa_CostoContarProveedor.CostoTotalporProveedor);

                                //obtener los impuestos de los proveedores
                                List<pa_CostoObtenerImpuestos_Result> obtenerImpuestos = new List<pa_CostoObtenerImpuestos_Result>();

                                obtenerImpuestos = this.LithioBD.pa_CostoObtenerImpuestos().ToList();

                                //HACER UN RETURN DEL ARTICULO
                                pa_CosteoRetornaID_Result pa_CosteoRetornaID = new pa_CosteoRetornaID_Result();
                                pa_CosteoRetornaID = this.LithioBD.pa_CosteoRetornaID(OordenarProveedor.Id_Costo_Concepto_AUX).FirstOrDefault();

                                //utilizar el registro encontrado para
                                double ProbCostoTotalCompra = Convert.ToDouble(pa_CosteoRetornaID.ProbCostoTotalCompra);
                                double Costo_Maritimo = Convert.ToDouble(pa_CosteoRetornaID.Costo_Maritimo);

                                //GUARDAR EL FLETE MARITIMO
                                this.LithioBD.pa_CostoDistCostoMaritimoUpdate(ProbCostoTotalCompra * Costo_Maritimo,pa_CosteoRetornaID.Id_Costo_Concepto_AUX);

                                double Costo_Terrestre = Convert.ToDouble(pa_CosteoRetornaID.Costo_Terrestre);

                                //Guardar EL FLETE TERRESTRE
                                this.LithioBD.pa_CostoDistCostoTerrestreUpdate(ProbCostoTotalCompra * Costo_Terrestre, pa_CosteoRetornaID.Id_Costo_Concepto_AUX);

                                ///se utiliza nuevamente la variable para obtener los nuevos datos de la distribucion
                                ///del costeo maritimo y terrestre

                                pa_CosteoRetornaID = this.LithioBD.pa_CosteoRetornaID(OordenarProveedor.Id_Costo_Concepto_AUX).FirstOrDefault();

                                //guardar el costeo real a sumar a cada articulo MARITIMO
                                this.LithioBD.pa_CosteoMontoMaritimo(pa_CosteoRetornaID.DistCostoMaritimo/pa_CosteoRetornaID.Unidades_Articulos,pa_CosteoRetornaID.Id_Costo_Concepto_AUX);

                                //guardar el costeo real a sumar a cada articulo TERRESTRE
                                this.LithioBD.pa_CosteoMontoTerrestre(pa_CosteoRetornaID.DistCostoTerrestre/pa_CosteoRetornaID.Unidades_Articulos,pa_CosteoRetornaID.Id_Costo_Concepto_AUX);


                                ///se utiliza nuevamente la variable para obtener los nuevos datos de la distribucion
                                ///del costeo maritimo y terrestre

                                pa_CosteoRetornaID = this.LithioBD.pa_CosteoRetornaID(OordenarProveedor.Id_Costo_Concepto_AUX).FirstOrDefault();

                                double MontoCostoPorArticuloMar = Convert.ToDouble(pa_CosteoRetornaID.MontoCostoPorArticuloMar);

                                double MontoCostoPorArticuloTer = Convert.ToDouble(pa_CosteoRetornaID.MontoCostoPorArticuloTer);

                                double resultadoMontoTotalCosteoMar = MontoCostoPorArticuloMar + pa_CosteoRetornaID.Costo_Total_Dolares;

                                double resultadoMontoTotalCosteoTer = MontoCostoPorArticuloTer + pa_CosteoRetornaID.Costo_Total_Dolares;

                                //se guarda el costeo total del articulo MARITIMO
                                this.LithioBD.pa_CosteoMontoTotal_CosteoPorArticuloMar(resultadoMontoTotalCosteoMar, pa_CosteoRetornaID.Id_Costo_Concepto_AUX);


                                //se guarda el costeo total del articulo MARITIMO
                                this.LithioBD.pa_CosteoMontoTotal_CosteoPorArticuloTer(resultadoMontoTotalCosteoTer, pa_CosteoRetornaID.Id_Costo_Concepto_AUX);


                                //Se agrega el costo total del costeo a cada articulo con los 2  fletes
                                this.LithioBD.pa_CosteoMontoTotal( (MontoCostoPorArticuloTer+ MontoCostoPorArticuloMar)+ pa_CosteoRetornaID.Costo_Total_Dolares, pa_CosteoRetornaID.Id_Costo_Concepto_AUX);
                            }
                        }
                    }
                }
                Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");

            }
            catch (Exception ex)
            {
                mensaje = "Hubo un error " + ex.Message;
                mensaje += "No se pudo ingresar";
                Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
            }
            mensaje = "Costeo Exitoso";
            Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + mensaje + "',icon: 'error',showConfirmButton: true})</script>");
            return View();
        }
        #endregion

        #region RetornaArticulosJSON
        /// <summary>
        /// Json que trae los codigos de los articulos 
        /// </summary>
        /// <returns></returns>
        //[HttpPost]
        public JsonResult RetornaArticulos(string search)
        {
            List<ArticulosViewModel> ArtVM = LithioBD.Articulos.Where(x => x.Codigo_Articulo.Contains(search)).Select(x => new ArticulosViewModel
            {
                Codigo_Articulo = x.Codigo_Articulo
            }).ToList();
            return new JsonResult { Data = ArtVM, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        #endregion

        #region BuscaCodigo
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Codigo_Articulo"></param>
        /// <returns></returns>
        //Metodo que busca los demas datos del articulo utilizando el codigo para realizar la busqueda
        public ActionResult BuscaCodigo(string Codigo_Articulo)
        {
            //variables para cada uno de los campos que van a ir en la linea
            string NombreArticulo = "";
            string CodigoArti = "";
            int IdPresentacion = 0;
            string NombrePresentacion = "";
            int CantidadArticulos = 0;
            double CostoArticulo = 0;
            int Id_Proveedor = 0;
            string NombreProveedor = "";
            try
            {
                pa_Costos_BusquedaCodigoArt_Result modeloBusquedaCodigo = new pa_Costos_BusquedaCodigoArt_Result();

                modeloBusquedaCodigo = this.LithioBD.pa_Costos_BusquedaCodigoArt(Codigo_Articulo).FirstOrDefault();

                //se guarda los datos que trajo el codigo de alticulo para agregarlo al 
                NombreArticulo = modeloBusquedaCodigo.Nombre_Articulo;
                CodigoArti = modeloBusquedaCodigo.Codigo_Articulo;
                IdPresentacion = modeloBusquedaCodigo.Id_Presentacion;
                NombrePresentacion = modeloBusquedaCodigo.Nombre_Presentacion;
                CantidadArticulos = modeloBusquedaCodigo.Cantidad_Articulo;
                CostoArticulo = modeloBusquedaCodigo.Costo_Articulo;
                Id_Proveedor = modeloBusquedaCodigo.Id_Proveedor;
                NombreProveedor = modeloBusquedaCodigo.Nombre_Proveedor;
            }
            catch (Exception ex)
            {
                Response.Write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script> <br>");

                Response.Write("<script language = javascript > Swal.fire({title: 'Falló!',text:'" + ex.Message + "',icon: 'error',showConfirmButton: true})</script>");

            }
            return Json(new
            {

                //Se indica los nombres a utilizar en el js
                //Recordar que json es llave:valor
                NombreArticulo = NombreArticulo,
                CodigoArti = CodigoArti,
                IdPresentacion = IdPresentacion,
                NombrePresentacion = NombrePresentacion,
                CantidadArticulos = CantidadArticulos,
                CostoArticulo = CostoArticulo,
                Id_Proveedor = Id_Proveedor,
                NombreProveedor = NombreProveedor
            });

        }
        #endregion
    }
}