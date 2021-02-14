$(function () {
    validaUsuarios();
});

function validaUsuarios() {
    $("#frmUsuario").validate({
        rules: {
            Nombre_Completo: {
                required: true,
                maxlength: 200
            },
            Correo_Electronico: {
                required: true,
                email: true,
                maxlength: 200
            },
            Contrasena_Usuario: {
                required:true,
                maxlength: 200
            }
        }
    });
}