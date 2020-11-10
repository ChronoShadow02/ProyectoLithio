$(function () {
    validaProveedores();
});

function validaProveedores() {
    $("#frmProveedores").validate({
        rules: {
            Nombre_Proveedor: {
                required: true,
                maxlength: 200
            },
            Codigo_Proveedor: {
                required: true,
                maxlength: 200
            },
            Id_Pais: {
                required: true
            }
        }
    });
}