$(document).ready(function()
{
    $.post("../../controller/notificacionesController.php?opcion=TodasNotificaciones", function (data) 
    {
        $('#Contenedor_Notificaciones').append(data);
    }); 

    $.post("../../controller/notificacionesController.php?opcion=NotificaionCumpleaños", function (data) 
    {
        data = JSON.parse(data);

        if(data.MostrarModal === "SI")
        {
           
        }
    }); 
});

function notificacionClick(idnotificacion) 
{
    $.post("../../controller/notificacionesController.php?opcion=NotificacionXid", { idnotificacion: idnotificacion }, function (data) 
    {
        data = JSON.parse(data);

        $('#Titulo').html(data.Titulo);
        $('#Imagen').attr('src', data.fotoBase64);
        $('#Mensaje_corto').html("<strong>MENSAJE: </strong>" + data.Mensaje);
        $('#Mensaje_Largo').html("<strong>DETALLES: </strong>" + data.Mensaje_largo);
        $('#Fecha').html("<strong>FECHA DE LA NOTIFICACIÓN: </strong>"+ data.fecha_notificacion);
        $('#ModalNotificacion').modal('show');
    }); 
  }




