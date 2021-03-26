
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
function ProcesaAgregarConcepto(data) {

    var num = 0;
    //Borrar el campo del autocomplete del codigo
    $("#txtCodigoArticuloAgregar").val("");
    
    //agregar los datos a la tabla dinamica
    let tabla = document.getElementById("TablaConceptos");
    //crear tr de forma autmatica
    let TR = document.createElement("tr");
    // agregar los 'td' que hacen falta para indicar los campos a cargar (son como 10 campos pero solo se ven 8)
    let TDNombreProveedor = document.createElement("td");
    let TDCodigoArti = document.createElement("td");
    let TDNombreArticulo = document.createElement("td");
    //let TDIdPresentacion = document.createElement("td");
    let TDNombrePresentacion = document.createElement("td");
    let TDCantidadArticulos = document.createElement("td");
    let TDCostoArticulo = document.createElement("td");
    //let TDId_Proveedor = document.createElement("td");
    let TDCostoTotal = document.createElement("td");
    let TDbtnEliminar = document.createElement("td");

    //se agregan los campos a la tabla
    TR.appendChild(TDNombreProveedor);
    TR.appendChild(TDCodigoArti);
    TR.appendChild(TDNombreArticulo);
    //TR.appendChild(TDIdPresentacion);
    TR.appendChild(TDNombrePresentacion);
    TR.appendChild(TDCantidadArticulos);
    TR.appendChild(TDCostoArticulo);
    //TR.appendChild(TDId_Proveedor);
    TR.appendChild(TDCostoTotal);
    TR.appendChild(TDbtnEliminar);


    //Se agrega el texto a los td
    TDNombreProveedor.innerHTML = data.NombreProveedor;
    TDCodigoArti.innerHTML=data.CodigoArti;
    TDNombreArticulo.innerHTML = data.NombreArticulo;
    //TDIdPresentacion.innerHTML = data.IdPresentacion;
    TDNombrePresentacion.innerHTML= data.NombrePresentacion;
    TDCantidadArticulos.innerHTML=data.CantidadArticulos;
    TDCostoArticulo.innerHTML ="¢"+data.CostoArticulo;
    //TDId_Proveedor.innerHTML=data.Id_Proveedor;
    TDCostoTotal.innerHTML = "<input type='number' class='form-control' value='' style='width:70px;'>";
    TDbtnEliminar.innerHTML = "<button class='btn btn-danger btn-sm'>Eliminar</button>";
    
    tabla.appendChild(TR);


    //Agregar hiddens
    let DivConceptos = document.getElementById("divConceptos");
    let hiddenIndex = document.createElement("input");
    let hiddenCodigo = document.createElement("input");
    let hiddenNombreArticulo = document.createElement("input");
    let hiddenIdPresentacion = document.createElement("input");
    let hiddenNombrePresentacion = document.createElement("input");
    let hiddenCostoArticulo = document.createElement("input");
    let hiddenId_Proveedor = document.createElement("input");
    let hiddenNombreProveedor = document.createElement("input");

    hiddenIndex.name = "conceptos.Index";
    hiddenIndex.value = num;
}