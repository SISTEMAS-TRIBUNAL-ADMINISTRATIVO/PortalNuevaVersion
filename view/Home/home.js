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
                imageUrl: "../../public/images/cumple.jpg",
                background: "#fff url(/images/trees.png)",
                backdrop: `
                  rgba(0,0,123,0.4)
                  url("https://i.gifer.com/9DOQ.gif")
                  left top
                  no-repeat
                `
              });
        }
    }); 
});




