$(function () {
    validaUsuarios();
});

function validaUsuarios() {
    $("#frmUsuario").validate({
        rules: {
            Primer_Nombre: {
                required: true,
                maxlength: 200
            },
            Primer_Apellido: {
                required: true,
                maxlength: 200
            },
            Segundo_Apellido: {
                required: true,
                maxlength: 200
            },
            Nombre_Usuario: {
                required: true,
                maxlength: 200
            },
            Contrasena_Usuario: {
                required: true,
                maxlength: 200
            }
        }
    });
}