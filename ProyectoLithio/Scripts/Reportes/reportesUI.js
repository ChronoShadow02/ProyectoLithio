$(function () {
    formatoDatepicker();
    CreaFiltrosFechas();
});
function CreaFiltrosFechas() {
    $("#txtFechaInicial").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "c:c+8",
        dateFormat: "dd/mm/yy"
    });
    $("#txtFechaFinal").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "c:c+8",
        dateFormat: "dd/mm/yy"
    });
}
function formatoDatepicker() {
    $(function ($) {
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '<Ant',
            nextText: 'Sig>',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            dayNamesMin: ['D', 'L', 'M', 'X', 'J', 'V', 'S'],
            weekHeader: 'Sem', dateFormat: 'dd/mm/yy',
            firstDay: 1, isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
    });
        
}