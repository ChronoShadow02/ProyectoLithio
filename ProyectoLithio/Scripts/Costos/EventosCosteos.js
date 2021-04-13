/*Por aca se agregan los eventos para agregar lineas
 de los productos para el calculo y tambien para procesar la informacion para realizar
 el calculo del costeo*/
var num = 0;

$(function () {
	AgregarConcepto();
})

//Mandar como parametro el codigo del articulo para buscar los demas datos

function AgregarConcepto() {

	$("#AgregarConcepto").click(function () {
		//Guardamos el valor del codigo ingresado
		let Codigo_Articulo = $("#txtCodigoArticuloAgregar").val();
		if (Codigo_Articulo.length == 0) {
			return false;
		}
		else {
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

	//Borrar el campo del autocomplete del codigo
	$("#txtCodigoArticuloAgregar").val("");

	//agregar los datos a la tabla dinamica
	let tabla = document.getElementById("TablaConceptos");
	//crear tr de forma autmatica
	let TR = document.createElement("tr");
	TR.setAttribute("id", "tr"+num+"");
	// agregar los 'td' que hacen falta para indicar los campos a cargar (son como 10 campos pero solo se ven 8)
	let TDNombreProveedor = document.createElement("td");
	let TDCodigoArti = document.createElement("td");
	let TDNombreArticulo = document.createElement("td");
	let TDNombrePresentacion = document.createElement("td");
	let TDCantidadArticulos = document.createElement("td");
	let TDCostoArticulo = document.createElement("td");
	let TDCostoTotal = document.createElement("td");
	///agregar los campos de flete maritimo
	let TDUsaFlete = document.createElement("td");
	let TDCostoFlete = document.createElement("td");
	//agregar el boton de eliminar
	let TDbtnEliminar = document.createElement("td");

	//se agregan los campos a la tabla
	TR.appendChild(TDNombreProveedor);
	TR.appendChild(TDCodigoArti);
	TR.appendChild(TDNombreArticulo);
	TR.appendChild(TDNombrePresentacion);
	TR.appendChild(TDCantidadArticulos);
	TR.appendChild(TDCostoArticulo);
	TR.appendChild(TDCostoTotal);
	TR.appendChild(TDUsaFlete);
	TR.appendChild(TDCostoFlete);
	//agregar el boton de eliminar
	TR.appendChild(TDbtnEliminar);


	//Se agrega el texto a los td
	TDNombreProveedor.innerHTML = data.NombreProveedor;
	TDCodigoArti.innerHTML = data.CodigoArti;
	TDNombreArticulo.innerHTML = data.NombreArticulo;
	TDNombrePresentacion.innerHTML = data.NombrePresentacion;
	TDCantidadArticulos.innerHTML = data.CantidadArticulos;
	TDCostoArticulo.innerHTML = "¢" + data.CostoArticulo;
	TDCostoTotal.innerHTML = "¢" + (data.CantidadArticulos * data.CostoArticulo);

	TDUsaFlete.innerHTML = "<input type='checkbox' class='form-check-input' id='chkUsaFlete" + num + "' onclick='ArticuloUsaFlete(" + num +")'> Si";
	TDCostoFlete.innerHTML = "<input type='text' class='form-control' value='' style='width:70px;' id='txtUsaFlete"+num+" '>";
	TDbtnEliminar.innerHTML = "<button class='btn btn-danger btn-sm glyphicon glyphicon-trash' onclick='BorrarLineaCosteo(" + num +");'></button>";

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

	//agregar hidden de index
	hiddenIndex.name = "conceptos.Index";
	hiddenIndex.value = num;
	hiddenIndex.type = "hidden";
	hiddenIndex.setAttribute("id", "hiddenIndex" + num);

	//agregar hidden de nombre de proveedor
	hiddenNombreProveedor.name = "conceptos[" + num + "].NombreProveedor";
	hiddenNombreProveedor.value = data.NombreProveedor;
	hiddenNombreProveedor.type = "hidden";
	hiddenNombreProveedor.setAttribute("id", "hiddenNombreProveedor" + num);

	//agregar hidden de id de proveedor
	hiddenId_Proveedor.name = "conceptos[" + num + "].Id_Proveedor";
	hiddenId_Proveedor.value = data.Id_Proveedor;
	hiddenId_Proveedor.type = "hidden";
	hiddenId_Proveedor.setAttribute("id", "hiddenId_Proveedor" + num);

	//agregar hidden de codigo articulo
	hiddenCodigo.name = "conceptos[" + num + "].Codigo_Articulo";
	hiddenCodigo.value = data.CodigoArti;
	hiddenCodigo.type = "hidden";
	hiddenCodigo.setAttribute("id", "hiddenCodigo" + num);

	///agregar nombre de articulo
	hiddenNombreArticulo.name = "conceptos[" + num + "].Nombre_Articulo";
	hiddenNombreArticulo.value = data.NombreArticulo;
	hiddenNombreArticulo.type = "hidden";
	hiddenNombreArticulo.setAttribute("id", "hiddenNombreArticulo" + num);

	//se agrega los campos en la vista
	DivConceptos.appendChild(hiddenIndex);
	DivConceptos.appendChild(hiddenNombreProveedor);
	DivConceptos.appendChild(hiddenId_Proveedor);
	DivConceptos.appendChild(hiddenCodigo);
	DivConceptos.appendChild(hiddenNombreArticulo);

	num++;
}

function BorrarLineaCosteo(indice) {

	$('#TablaConceptos').on('click', 'button[class="btn btn-danger btn-sm glyphicon glyphicon-trash"]', function () {
		$(this).parents("tr").remove();
		//Crear el nodo para despues eliminar los elementos del hidden
		var NodoPadre = document.getElementById("divConceptos");

		//Eliminar los hidden de ese registro
		var hiddenIndexEliminar = document.getElementById("hiddenIndex" + indice);
		NodoPadre.removeChild(hiddenIndexEliminar);

		var hiddenNombreProveedorEliminar = document.getElementById("hiddenNombreProveedor" + indice);
		NodoPadre.removeChild(hiddenNombreProveedorEliminar);

		var hiddenId_ProveedorEliminar = document.getElementById("hiddenId_Proveedor" + indice);
		NodoPadre.removeChild(hiddenId_ProveedorEliminar);

		var hiddenCodigoEliminar = document.getElementById("hiddenCodigo" + indice);
		NodoPadre.removeChild(hiddenCodigoEliminar);

		var hiddenNombreArticuloEliminar = document.getElementById("hiddenNombreArticulo" + indice);
		NodoPadre.removeChild(hiddenNombreArticuloEliminar);
	});
}



//
function ArticuloUsaFlete(indice) {
	//V
	var VerificarChkFlete = document.getElementById("chkUsaFlete" + indice);
	//Se valida si el articulo utiliza el 
	if (VerificarChkFlete.checked) {
		
	} else {
	$("#txtUsaFlete").attr("disabled");
    }
}