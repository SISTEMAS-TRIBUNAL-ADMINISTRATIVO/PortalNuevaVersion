var tabla;

function init()
{
    $("#formAgregarFormato").on("submit",function(e)
    {
        guardaryeditar(e);	
    });
}


$(document).on("click","#btnAgregarFormato", function()
{  
    $("#ModalNotificacion").modal('show');
});


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
    $.post("../../../controller/permisosExtrasController.php?opcion=AgregarFormato", function (data) 
    {
        data = JSON.parse(data);
        if (data.TienePermiso == 'SI') 
        {
            $("#btnAgregarFormato").show();
        }
    }); 


     tabla=$('#Formatos_informatica').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        "ajax":{
              url: '../../../controller/formatosController.php?opcion=TodosFormatos',
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
    


});

function recargarTabla() 
{
    $('#Formatos_informatica').DataTable().ajax.reload();
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
