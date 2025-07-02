$(document).ready(function()
{
    $.post("../../../controller/catUbicacionController.php?opciones=cat_ubicaciones",function(data, status)
    {
        $('#C_areas').html(data);
    });


    $.post("../../../controller/catUbicacionController.php?opciones=cat_Pisos",function(data, status)
    {
        $('#C_Pisos').html(data);
    });


    $('#configuracion_form').on('submit', function (e) 
    {
        e.preventDefault();

        let nuevaContra = $('#nueva_contraseña').val();
        let confirmarContra = $('#confirmar_contraseña').val();
        let area = $('#C_areas').val();
        let Piso = $('#C_Pisos').val();
        let siglas = $('#siglas').val();

        // Validación de contraseñas
        if (nuevaContra !== confirmarContra) {
            Swal.fire({
                icon: 'error',
                title: 'Contraseñas no coinciden',
                text: 'Por favor, asegúrate de que ambas contraseñas sean iguales.'
            });
            return;
        }

        let formData = {
            nueva_contraseña: nuevaContra,
            area: area,
            siglas: siglas,
            Piso: Piso
        };

        $.ajax({
            type: "POST",
            url: "../../../controller/ConfiguracionInicialController.php?opcion=guardarConfiguracionInicial",
            data: formData,
            dataType: 'json',
            success: function (response) 
            {
                if (response.Respuesta === 1) 
                    {
                    Swal.fire({
                        icon: 'success',
                        title: 'Configuración guardada',
                        text: 'Tu contraseña ha sido actualizada y tu perfil está configurado.',
                        confirmButtonText: 'Iniciar sesión'
                    }).then(() => {
                        window.location.href = '../../../index.php';
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message || 'Ocurrió un problema al guardar la configuración.'
                    });
                }
            }
        });
    });
});

