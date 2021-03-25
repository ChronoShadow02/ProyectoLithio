/*Por aca se agregan los eventos para agregar lineas
 de los productos para el calculo y tambien para procesar la informacion para realizar
 el calculo del costeo*/
$(function () {
    AgregarConcepto();
})
//Mandar como parametro el codigo del articulo para buscar los demas datos

function AgregarConcepto() {

    $("#AgregarConcepto").click(function () {
        //Guardamos el valor del codigo ingresado
        let Codigo_Articulo = $("#txtCodigoArticuloAgregar").val();
        if (Codigo_Articulo.length==0) {
            return false;
        } else {
            //Se usa la funcion de ajax mandando el codigo 
            let url = "/Costos/BuscaCodigo";
            let parametros = {
                Codigo_Articulo: Codigo_Articulo
            };
            let funcion = ProcesaAgregarConcepto;

            ejecutaAjax(url, parametros, funcion);
        }

    });
    
}
// aca se procesa la infomacion para agregar el concepto a la tabla
function ProcesaAgregarConcepto(CodigoArt) {
    alert("sirve");
}