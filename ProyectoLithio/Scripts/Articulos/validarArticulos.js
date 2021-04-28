$(function () {
    validaArticulos();    
});


function validaArticulos() {
    $("#frmArticulos").validate({
        rules: {
            Codigo_Articulo: {
                required: true,
                maxlength: 200
            },
            Nombre_Articulo: {
                required: true,
                maxlength: 200
            },
            Descripcion_Articulo: {
                maxlength: 200
            },
            Cantidad_Articulo: {
                required: true,
                digits: true
            },
            Costo_Articulo: {
                required: true,
                digits:true
            },
            Costo_Anterior_Articulo: {
                required: true,
                digits: true
            },
            Id_Proveedor: {
                required: true
            },
            Id_Presentacion: {
                required: true
            }
        }
    });
}