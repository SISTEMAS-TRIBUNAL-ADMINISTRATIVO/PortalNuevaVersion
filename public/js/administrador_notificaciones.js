var tabla;

function init()
{
    $("#formAgregarNotificacion").on("submit",function(e)
    {
        guardaryeditar(e);	
    });
}

//Botón para agregar notificación
$(document).on("click","#btnAgregarNotificacion", function()
{  
    $("#modalAgregarNotificacion").modal('show');

    //cargar los select de tipo de notificación
    $.post("../../../controller/notificacionesController.php?opcion=cat_Tipo_de_aviso", function(data, status) 
    {
        $('#tipoNotificacion').html(data);
    });

    //cargar los select de área de notificación
    $.post("../../../controller/catUbicacionController.php?opciones=cat_ubicaciones", function(data, status) 
    {
        $('#areaNotificacion').html(data);
    });
});

// Control de checkbox para notificación programada
$('#notificacionProgramada').on('change', function () 
{
  if ($(this).is(':checked')) 
{
    $('#campoFechaProgramado, #campoVigencia').removeClass('d-none');
  } else 
  {
    $('#campoFechaProgramado, #campoVigencia').addClass('d-none');
  }
});



function seleccionarUsuario(id, nombre)
{
  $('#usuarioNotificacion').val(nombre);
  $('#idUsuarioSeleccionado').val(id);
  $('#resultadoBusquedaUsuarios').empty();
}



function guardaryeditar(e)
{ 
    e.preventDefault();
	var formData = new FormData($("#formAgregarFormato")[0]);
    $.ajax({
        url: "../../../controller/formatosController.php?opcion=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(response)
        {
            $('#formAgregarFormato')[0].reset();
            $("#ModalNotificacion").modal('hide');
            $('#Formatos_informatica').DataTable().ajax.reload();

            Swal.fire({
                        title: 'Guardado con éxito',
                        icon: 'success',
                        confirmButtonText: 'Aceptar',
                        confirmButtonColor: '#28a745'
                    });
        }
    }); 
}


$(document).ready(function()
{     
    $.post("../../../controller/permisosExtrasController.php?opcion=AgregarNotificacion", function (data) 
    {
        data = JSON.parse(data);
        if (data.TienePermiso == 'SI') 
        {
            $("#btnAgregarNotificacion").show();
        }
    }); 


     tabla=$('#TablaNotificaciones').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        "ajax":{
              url: '../../../controller/notificacionesController.php?opcion=ListarNotificaciones',
            type : "post",
            dataType : "json",						
            error: function(e){
                console.log(e.responseText);	
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo":true,
        "iDisplayLength": 9,
        "autoWidth": true,
        "autoHeight": false,
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Mostrando un total de _TOTAL_ registros",
            "sInfoEmpty":      "Mostrando un total de 0 registros",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix":    "",
            "sSearch":         "Buscar:",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst":    "Primero",
                "sLast":     "Último",
                "sNext":     "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }     
    }).DataTable(); 
    

    $('#tipoNotificacion').on('change', function () 
  {
    const valor = $(this).val();

    // Ocultar ambos campos al cambiar
    $('#campoAreaNotificacion').addClass('d-none');
    $('#campoBuscarUsuario').addClass('d-none');

    // Mostrar según la selección
    if (valor === '2') 
    {
      $('#campoAreaNotificacion').removeClass('d-none');
    } else if (valor === '3' || valor === '4') 
    {
      $('#campoBuscarUsuario').removeClass('d-none');
    }
  });


    let busquedaTimeout;

    $('#usuarioNotificacion').on('input', function () {
        const criterio = $(this).val().trim();

        clearTimeout(busquedaTimeout);

        if (criterio.length < 3) {
            $('#resultadoBusquedaUsuarios').empty();
            return;
        }

        busquedaTimeout = setTimeout(() => {
            $.ajax({
                url: '../../../controller/usuarioController.php?opcion=buscarUsuarios',
                method: 'POST',
                data: { criterio: criterio },
                success: function (data) {
                    // Asegúrate de que solo haces .html() con la respuesta HTML
                    $('#resultadoBusquedaUsuarios').html(data);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error); // Esto es lo que ves en consola
                    Swal.fire('Error', 'Error al buscar usuarios.', 'error');
                }
            });
        }, 500);
    });
});


function recargarTabla() 
{
    $('#TablaNotificaciones').DataTable().ajax.reload();
}

$(document).on("click", ".eliminar-formato", function () {
    const idFormato = $(this).data("id");

    Swal.fire({
        title: "¿Estás seguro?",
        text: "Este formato será eliminado permanentemente.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Sí, eliminar",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) 
            {
                $.post("../../../controller/formatosController.php?opcion=eliminar", { id_formato: idFormato }, function (response) 
                {
                    recargarTabla() ;
                     Swal.fire({
                        title: 'Eliminado',
                        icon: 'success',
                        confirmButtonText: 'Aceptar',
                        confirmButtonColor: '#28a745'
                    });
                });
            }
    });
});

init();
