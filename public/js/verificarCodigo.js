$('#codigo_form').on('submit', function(e) {
    e.preventDefault();

    var validacion = getUrlParameter('validacion');
    var token = getUrlParameter('token');
    var Enlace = getUrlParameter('Enlace');
    

    var formData = new FormData(this);
    formData.append("validacion", validacion);
    formData.append("token", token);
    formData.append("Enlace", Enlace);


    $.ajax({
        type: "POST",
        url: "../../../controller/loginController.php?opcion=verificarCodigo",
        data: formData,
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
                    title: "Tu cuenta ha sido verificada correctamente.",
                    text: "Ahora puedes iniciar sesión en el sistema utilizando tus credenciales, correo y CURP como contraseña.",
                }).then((result) => {
                    if (result.isConfirmed) 
                    {
                        window.location.href = "../../../index.php";
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