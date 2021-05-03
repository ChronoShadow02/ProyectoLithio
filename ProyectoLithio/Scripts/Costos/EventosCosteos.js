﻿/*Por aca se agregan los eventos para agregar lineas
 de los productos para el calculo y tambien para procesar la informacion para realizar
 el calculo del costeo*/
let indice = 0;

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

	console.log("Indice actual: " + indice);

	//Borrar el campo del autocomplete del codigo
	$("#txtCodigoArticuloAgregar").val("");

	//agregar los datos a la tabla dinamica
	let tabla = document.getElementById("TablaConceptos");
	//crear tr de forma autmatica
	let TR = document.createElement("tr");
	TR.setAttribute("id", "tr" + indice);

	// agregar los 'td' que hacen falta para indicar los campos a cargar (son como 10 campos pero solo se ven 8)
	let TDNombreProveedor = document.createElement("td");
	let TDCodigoArti = document.createElement("td");
	let TDNombreArticulo = document.createElement("td");
	let TDNombrePresentacion = document.createElement("td");
	let TDCantidadArticulos = document.createElement("td");
	let TDCostoArticulo = document.createElement("td");
	let TDCostoTotal = document.createElement("td");

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

	var num = typeof (indice);
	console.log(num);

	TDbtnEliminar.innerHTML = "<button type='button' class='btn btn-danger btn-sm' onclick='BorrarLine(" + indice + ");' id='btnind" + indice + "'>Borrar</button>";
	//TDbtnEliminar.innerHTML = "<button type='button' class='btn btn-danger btn-sm' onclick='BorrarLine(this);' id='btnind" + indice + "'>Borrar</button>";


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
	hiddenIndex.value = indice;
	hiddenIndex.type = "hidden";
	hiddenIndex.setAttribute("id", "hiddenIndex" + indice);

	//agregar hidden de nombre de proveedor
	hiddenNombreProveedor.name = "conceptos[" + indice + "].NombreProveedor";
	hiddenNombreProveedor.value = data.NombreProveedor;
	hiddenNombreProveedor.type = "hidden";
	hiddenNombreProveedor.setAttribute("id", "hiddenNombreProveedor" + indice);

	//agregar hidden de id de proveedor
	hiddenId_Proveedor.name = "conceptos[" + indice + "].Id_Proveedor";
	hiddenId_Proveedor.value = data.Id_Proveedor;
	hiddenId_Proveedor.type = "hidden";
	hiddenId_Proveedor.setAttribute("id", "hiddenId_Proveedor" + indice);

	//agregar hidden de codigo articulo
	hiddenCodigo.name = "conceptos[" + indice + "].Codigo_Articulo";
	hiddenCodigo.value = data.CodigoArti;
	hiddenCodigo.type = "hidden";
	hiddenCodigo.setAttribute("id", "hiddenCodigo" + indice);

	///agregar nombre de articulo
	hiddenNombreArticulo.name = "conceptos[" + indice + "].Nombre_Articulo";
	hiddenNombreArticulo.value = data.NombreArticulo;
	hiddenNombreArticulo.type = "hidden";
	hiddenNombreArticulo.setAttribute("id", "hiddenNombreArticulo" + indice);

	//se agrega los campos en la vista
	DivConceptos.appendChild(hiddenIndex);
	DivConceptos.appendChild(hiddenNombreProveedor);
	DivConceptos.appendChild(hiddenId_Proveedor);
	DivConceptos.appendChild(hiddenCodigo);
	DivConceptos.appendChild(hiddenNombreArticulo);

	indice = indice + 1;

}

function BorrarLineaCosteo(indiceBorrar) {
	try {

		$('#TablaConceptos').on('click', 'button[class="btn btn-danger btn-sm"]', function () {
			//remueve el tr de la tabla
			//$("tr" + indiceBorrar).remove();

			//Crear el nodo para despues eliminar los elementos del hidden
			var NodoPadre = document.getElementById("divConceptos");
			console.log(NodoPadre);

			NodoPadre.removeChild(document.getElementById("hiddenIndex" + indiceBorrar));

			NodoPadre.removeChild(document.getElementById("hiddenNombreProveedor" + indiceBorrar));

			NodoPadre.removeChild(document.getElementById("hiddenId_Proveedor" + indiceBorrar));

			NodoPadre.removeChild(document.getElementById("hiddenCodigo" + indiceBorrar));

			NodoPadre.removeChild(document.getElementById("hiddenNombreArticulo" + indiceBorrar));

		});
	} catch (e) {

		alert(e);
	}
}

function BorrarLinea(num) {

	try {

		//$('#TablaConceptos').on('click', 'button[class="btn btn-danger btn-sm"]', function () {

		//Crear el nodo para despues eliminar los elementos del hidden

		console.log(NodoPadre);
		//Eliminar los hidden de ese registro
		var NodoPadre = document.getElementById("divConceptos");
		//var hiddenIndexEliminar = document.getElementById("hiddenIndex" + num);
		//var hiddenNombreProveedorEliminar = document.getElementById("hiddenNombreProveedor" + num);
		//var hiddenId_ProveedorEliminar = document.getElementById("hiddenId_Proveedor" + num);
		//var hiddenCodigoEliminar = document.getElementById("hiddenCodigo" + num);
		//var hiddenNombreArticuloEliminar = document.getElementById("hiddenNombreArticulo" + num);
		NodoPadre.removeChild(document.getElementById("hiddenIndex" + num));

		//	var listatr = document.getElementById("tr");
		//console.log(hiddenNombreProveedorEliminar);
		NodoPadre.removeChild(document.getElementById("hiddenNombreProveedor" + num));


		//console.log(hiddenId_ProveedorEliminar);
		NodoPadre.removeChild(document.getElementById("hiddenId_Proveedor" + num));


		//console.log(hiddenCodigoEliminar);
		NodoPadre.removeChild(document.getElementById("hiddenCodigo" + num));


		//console.log(hiddenNombreArticuloEliminar);
		NodoPadre.removeChild(document.getElementById("hiddenNombreArticulo" + num));


		//NodoPadre.removechild(listatr).item(num);
		$(this).parents("tr").remove();

	} catch (e) {
		alert("error");;
	}
}


function BorrarLine(num) {

	try {
		$("#tr" + num).remove();
		var NodoPadre = document.getElementById("divConceptos");
		console.log(NodoPadre);

		NodoPadre.removeChild(document.getElementById("hiddenIndex" + num));

		NodoPadre.removeChild(document.getElementById("hiddenNombreProveedor" + num));

		NodoPadre.removeChild(document.getElementById("hiddenId_Proveedor" + num));

		NodoPadre.removeChild(document.getElementById("hiddenCodigo" + num));

		NodoPadre.removeChild(document.getElementById("hiddenNombreArticulo" + num));
	} catch (e) {
		alert("error");
		console.log(e);
	}
}