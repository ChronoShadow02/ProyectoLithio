$(function () {
    CrearRespaldo();
});


//function abrirModalRespaldo() {
//    $("#btnModalCrearRespaldo").click(function () {
//        $("#modalRespaldo").modal("show")
//    });
//}

function CrearRespaldo() {

    $("#btnCrearRespaldo").click(function () {
        var url = "/Respaldos/CrearRespaldo";

        var parametros = {

        }
        var funcion = ProcesarCrearRespaldo;

        ejecutaAjax(url, parametros, funcion);
    });
}

function ProcesarCrearRespaldo(data) {
    var mensajeFuncion = data.mensaje;
    var iconoFuncion = data.icono;
    var tituloFuncion = data.titulo;
    Swal.fire({ title: tituloFuncion, text: mensajeFuncion, icon: iconoFuncion, showConfirmButton: true });
}