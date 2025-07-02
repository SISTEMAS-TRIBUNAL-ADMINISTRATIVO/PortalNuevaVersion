$(document).ready(function()
{
    $.post("../../../controller/dashboardController.php?opcion=AccesosSistemas", function (data) 
    {
        $('#ContenedorSistemas').append(data);
    }); 

        $.post("../../../controller/notificacionesController.php?opcion=TodasNotificaciones", function (data) 
    {
        $('#Contenedor_Notificaciones').append(data);
    }); 

    $.post("../../../controller/notificacionesController.php?opcion=NotificaionCumpleaños", function (data) 
    {
        data = JSON.parse(data);

        if(data.MostrarModal === "SI")
        {
           Swal.fire({
                title: data.Mensaje,
                width: 600,
                padding: "3em",
                color: "#716add",
                imageUrl: data.fotoBase64,
                background: "#fff url(/images/trees.png)",
                backdrop: `
                  rgba(0,0,123,0.4)
                  url("")
                  left top
                  no-repeat
                `
              });
        }
    }); 
});

function notificacionClick(idnotificacion) 
{
    $.post("../../../controller/notificacionesController.php?opcion=NotificacionXid", { idnotificacion: idnotificacion }, function (data) 
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
