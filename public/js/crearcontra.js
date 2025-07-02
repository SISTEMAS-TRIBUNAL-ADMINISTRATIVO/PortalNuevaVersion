
$('#contrasena_form').on('submit', function(e) {
    e.preventDefault();

    const pass1 = $('#password').val();
    const pass2 = $('#confirmar_password').val();
    const validacion = getUrlParameter('validacion'); // Obtenemos el token/código de validación

    if (pass1 !== pass2) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Las contraseñas no coinciden.'
                });
                return;
            }

    $.ajax({
        type: "POST",
        url: "../../../controller/loginController.php?opcion=verificarCodigo",
        data:
        {   password: pass1,
            validacion: validacion
        },
        contentType: false,  
        processData: false,  
        dataType: "json",  
        success: function(response) {
            if (response.Validar == 2) {
                Swal.fire({
                    icon: "error",
                    title: "Error...",
                    text: "El código ingresado no es correcto.",
                });
            } else if (response.Validar == 1) {
                Swal.fire({
                    icon: "success",
                    title: "Verificado",
                    text: "El código ingresado es correcto.",
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "crearcontra.php?validacion=" + encodeURIComponent(response.Autorizacion);
                    }
                });
            }
        }
    });
});


function getUrlParameter(sParam) 
 {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
    return null;
}
