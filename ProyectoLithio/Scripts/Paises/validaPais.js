$(function () {
    validaPais();
});

function validaPais() {
    $("#frmPais").validate({
        rules: {
            Nombre_Pais: {
                required: true,
                maxlength: 200
            },
            Sigla_Pais: {
                required: true,
                maxlength: 3,
                minlength: 3
            },
            Moneda_Pais: {
                required: true,
                maxlength: 200
            }
        }
    });
}