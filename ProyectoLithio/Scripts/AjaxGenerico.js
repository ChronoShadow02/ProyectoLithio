function ejecutaAjax(url, parametros, funcionSuccess) {
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(parametros),
        success: function (data, textStatus, jQxhr) {
            funcionSuccess(data);
        },
        error: function (jqXhr, textStatus, errorThrown) {
            var errorMessage = jqXhr.status + ': ' + jqXhr.statusText
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '' + errorThrown + errorMessage+ '',
                showConfirmButton: true
            })
        }
    });
}