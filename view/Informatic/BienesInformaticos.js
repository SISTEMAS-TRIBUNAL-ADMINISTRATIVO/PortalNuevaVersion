var tabla;

function init(){
   
}

$(document).ready(function()
{

    tabla=$('#bienesinformaticos').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        buttons: [		          
            //'copyHtml5',
            //'excelHtml5',
            //'csvHtml5',
            // 'pdfHtml5'
                ],
        "ajax":{
            url: '../../controller/bienesInformaticosController.php?opcion=TodosBienesInformaticos',
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
}   
);


/* function ver(id_equipo){
    window.open('http://localhost/PortalNuevaVersion/view/Informatic/DetallesBienInformatico.php?ID='+ id_equipo +'');
} */

function ver(id_equipo){
    $.post("../../controller/URL.php?op=PortalTA", function (data) {
        data = JSON.parse(data);
        // Concatenación de la URL correcta
        window.open(data.Url_PortalTA + 'view/Informatic/DetallesBienInformatico.php?ID='+ id_equipo +'');
    });
}


init();
