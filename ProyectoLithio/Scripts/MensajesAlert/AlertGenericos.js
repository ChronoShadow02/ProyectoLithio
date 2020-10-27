function AlertExito(mensaje) {
    Swal.fire({
        title: 'Exito!',
        text: '' + mensaje + '',
        icon: 'success',
        showConfirmButton: true
    })
}
function AlertFallo(mensaje) {
    Swal.fire({
        title: 'Vaya...',
        icon: 'error',
        text: '' + mensaje + '',
        showConfirmButton: true
    })
}
