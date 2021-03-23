/*Por aca se agregan los eventos para agregar lineas
 de los productos para el calculo y tambien para procesar la informacion para realizar
 el calculo del costeo*/

//Mandar como parametro el codigo del articulo para buscar los demas datos

function AgregarConcepto() {
    //Guardamos el valor del codigo ingresado
    let CodigoArticulo = $("#AgregarConcepto").val();

    //Se usa la funcion de ajax mandando el codigo 
    let url = "";
    let parametros = {};
    let funcion = ProcesaAgregarConcepto;

    ejecutaAjax(url, parametros, funcion);
}
// aca se procesa la infomacion para agregar el concepto a la tabla
function ProcesaAgregarConcepto(CodigoArt) {

}