$(function () {
    validaCorreoContrasena();
});

function validaCorreoContrasena() {
    $("#frmRecuperarContraseña").validate({
        rules: {
            Correo_Electronico: {
                email: true,
                required:true
            }
        }
    });
}