$(function () {
    validarPermisos();
});

function validarPermisos() {
    $("#frmPermisos").validate({
        rules: {
            Id_Tipo_Usuario: {
                required: true
            },
            Id_Estado_Usuario: {
                required: true
            }
        }
    });
}