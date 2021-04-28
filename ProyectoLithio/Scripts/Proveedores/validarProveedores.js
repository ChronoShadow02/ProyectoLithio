$(function () {
    validaProveedores();
    $("#Costo_Maritimo").attr("disabled", "true");
    $("#Costo_Terrestre").attr("disabled", "true");
    $("#Costo_Maritimo").maskMoney({ thousands: '', decimal: ',' });
    $("#Costo_Terrestre").maskMoney({ thousands: '', decimal: ',' });
    validaCostoMaritimo();
    validaCostoTerrestre();
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
            },
            Tiene_Costo_Maritimo: {
                required: true
            },
            Tiene_Costo_Terrestre: {
                required: true
            }
        }
    });
}

function validaCostoMaritimo() {
    $("#Tiene_Costo_MaritimoSi").click(function () {
        $("#Costo_Maritimo").removeAttr("disabled");
    });

    $("#Tiene_Costo_MaritimoNo").click(function () {
        $("#Costo_Maritimo").attr("disabled", "true");
        $("#Costo_Maritimo").maskMoney({ thousands: '', decimal: ',' });
    });
}

function validaCostoTerrestre() {
    $("#Tiene_Costo_TerrestreSi").click(function () {
        $("#Costo_Terrestre").removeAttr("disabled");
    });

    $("#Tiene_Costo_TerrestreNo").click(function () {
        $("#Costo_Terrestre").attr("disabled", "true");
        $("#Costo_Terrestre").maskMoney({ thousands: '', decimal: ',' });
    });
}