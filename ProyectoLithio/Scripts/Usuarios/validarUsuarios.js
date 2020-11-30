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