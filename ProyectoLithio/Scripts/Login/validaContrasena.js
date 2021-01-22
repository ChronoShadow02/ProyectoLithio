$(function () {
    validaCorreoContrasena();
});

function validaCorreoContrasena() {
    $("#frmRecuperarContraseña").validate({
        rules: {
            Contrasena: {
                maxlength: 200,
                required:true
            },
            ContrasenaConfirmada: {
                maxlength: 200,
                equalTo: "#Contrasena",
                required: true
            }
        }
    });
}