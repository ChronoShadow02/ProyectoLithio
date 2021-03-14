$(function () {
    CargaArticulos();
});

function CargaArticulos() {
    var url = "/Costos/RetornaArticulos";

    var parametros = {
        search: $("#txtCodigoArticuloAgregar").val()
    };

    $("#txtCodigoArticuloAgregar").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: url,
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(parametros),
                success: function (data) {
                    response($.map(data, function (item) {
                        return {
                            label: item.Codigo_Articulo,
                            value: item.Codigo_Articulo
                        }
                    }));
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    var errorMessage = jqXhr.status + ': ' + jqXhr.statusText;
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: '' + errorThrown + errorMessage + '',
                        showConfirmButton: true
                    })
                }
            });
        }
    });
}

