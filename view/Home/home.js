$(document).ready(function()
{
    $.post("../../controller/notificacionesController.php?opcion=TodasNotificaciones", function (data) 
    {
        //$('#Contenedor_Notificaciones').html(data);
        $('#Contenedor_Notificaciones').append(data);
    }); 
});




