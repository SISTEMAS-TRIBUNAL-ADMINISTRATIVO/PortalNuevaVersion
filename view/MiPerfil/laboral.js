var tabla;

function init(){
   
}

$(document).ready(function()
{
    $.post("../../controller/usuarioController.php?opcion=DatosLaborales", function (data) 
    {
        $('#prefijo').val(data.prefijo);
        $('#fecha_de_alta').val(data.fecha_de_alta);
        $('#numero_de_enlace').val(data.numero_de_plaza);
        $('#numero_de_plaza').val(data.numero_de_enlace);
        $('#categoria').val(data.categoria);
        $('#banco').val(data.banco);
        $('#numero_de_cuenta_bancaria').val(data.numero_de_cuenta_bancaria);
        $('#clabe_interbancaria').val(data.clabe_interbancaria);
        $('#fecha_de_alta_del_seguro_social').val(data.fecha_de_alta_del_seguro_social);
        $('#numero_de_seguro_social').val(data.numero_de_seguro_social);
    });
    
    tabla=$('#tableescolaridad').dataTable({
        "aProcessing": true,
        "aServerSide": false,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        buttons: [		          

                ],
        "ajax":{
            url: '../../controller/usuarioController.php?opcion=DatosAcademicos',
            type : "post",
            dataType : "json",						
            error: function(e){
                console.log(e.responseText);	
            }
        },
        "bDestroy": false,
        "responsive": true,
        "bInfo":false,
        "iDisplayLength": 10,
        "autoWidth": false,
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Mostrando un total de _TOTAL_ registros",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix":    "",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",

            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }     
    }).DataTable(); 
}   
);


init();
