function init() 
{
    $('#registro_form').on('submit', function(e) 
    {
        e.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: "../../../controller/loginController.php?opcion=Registro",
            data: formData,
            success: function(response) 
            {
                if (response.Validar == 1) 
                {
                    Swal.fire({
                            icon: "error",
                            title: "Error...",
                            text: "Los datos proporcionados ya están registrados en el sistema.",
                        });   
                } 
                else if (response.Validar == 2) 
                {
                    Swal.fire({
                            icon: "success",
                            title: "Registro exitoso",
                            text: "Se ha enviado un correo electrónico para validar tu cuenta.",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "verificarCodigo.php?validacion=" + encodeURIComponent(response.Autorizacion) + "&token=" + encodeURIComponent(response.PassTemp) + "&Enlace=" + encodeURIComponent(response.Enlace);
                            }
                        });
                } 
                else if (response.Validar == 3 )
                {
                    Swal.fire({
                            icon: "error",
                            title: "Error...",
                            text: "Por favor, contacta al área de Recursos Humanos para el registro de tus datos.",
                        });   
                } 
            }
        });
    });
}


$(document).ready(function() {
    init();
});
