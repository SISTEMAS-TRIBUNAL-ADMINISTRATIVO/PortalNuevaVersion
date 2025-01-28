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
            Swal.fire({
                title: data.Titulo,
                width: 600,
                padding: "3em",
                color: "#716add",
                imageUrl: "https://media4.giphy.com/media/5Xo96FwiEmhaBQlmQi/giphy.gif?cid=6c09b952f7edsna1x5iezqgavcd3xux4c31hexe0y0zooi6c&ep=v1_gifs_search&rid=giphy.gif&ct=g",
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




