$(function () {
    CreaEventos();
});


function CreaEventos() {
    $("#btnAgregarPais").on("click", function () {
      ///asignar a la variable formulario
      ///el resultado del selector

        var formulario = $("#frmPais");

        //Se ejecuta el metodo de validación
        formulario.validate();

        ///si el formulario es válido, proceder a
        ///ejecutar la función invocarMetodoPost
        if (formulario.valid()) {
            AgregarPais();
        }
    });
}
function AgregarPais() {
    var url = "Paises/PaisesNuevo";

    var parametros = {
        Nombre_Pais: $("#Nombre_Pais").val(),
        Sigla_Pais: $("#Sigla_Pais").val(),
        Moneda_Pais: $("#Moneda_Pais").val()
    }

    var funcion = ProcesarRsultadoAgregarPais;

    ejecutaAjax(url, parametros, funcion);
}
function ProcesarRsultadoAgregarPais(data) {

    ///si la cantidad de registros afectados es 0 entonces recargar la página
    if (data.registrosAfectados > 0) {
        ///es .mensaje porque la función devuelve
        ///un objeto JSON que posee una propiedad
        ///llamada mensaje
        Swal.fire({
            title: 'Exito!',
            text: '' + data.mensaje + '',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
        location.reload();
    } else {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '' + data.mensaje + '',
            showConfirmButton: false,
            timer: 1500
        })
    }
}
