$(function () {
    validaPresentaciones();
});

function validaPresentaciones() {
    $("#frmPresentacion").validate({
        rules: {
            Nombre_Presentacion: {
                required: true,
                maxlength: 200
            }
        }
    });
}