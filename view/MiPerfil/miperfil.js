function init()
{
    $('#formNewPassword').on('submit', function(e) 
    {
        e.preventDefault();
        var formData = $(this).serialize();
        var pass = $("#NewPassword").val();
        var newpass = $("#confirmarpassword").val();

        if (pass !== newpass) 
        {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Las contraseñas no coinciden.",
            });
        }
        else
        {
            $.ajax({
                type: "POST",
                url: "../../controller/usuarioController.php?opcion=CambiarPassword",
                data: formData,
                success: function(response) 
                {
                    if(response.Validar==1)
                    {
                        Swal.fire({
                            icon: "success",
                            title: "Guardado con éxito",
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }
                }
            });
        }
        });
}

$(document).ready(function()
{
    $.post("../../controller/usuarioController.php?opcion=Miperfil", function (data) 
    {
        $('#Nombre').val(data.Nombre);
        $('#Paterno').val(data.Paterno);
        $('#Materno').val(data.Materno);
        $('#Tipo_de_sangre').val(data.Sangre);
        $('#RFC').val(data.Rfc);
        $('#CURP').val(data.Curp);
        $('#Estado_civil').val(data.Civil);
        $('#CP').val(data.CP);
        $('#Domicilo').val(data.Domicilio);
        $('#Telefono').val(data.Telefono);
        $('#Correo').val(data.Correo);
        $('#CP_SAT').val(data.CP_SAT);
    }); 
});

init();


