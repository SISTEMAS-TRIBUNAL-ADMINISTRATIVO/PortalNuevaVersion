var tablaPermisosSistemas;


function CargarpermisosSistemas(Enlace)
{

    tablaPermisosSistemas = $('#TablaPermisosSistemas').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": false,
        lengthChange: false,
        colReorder: true,
        info: false, 
        "ajax": {
            url: '../../../controller/usuarioController.php?opcion=ListaDePermisosDeSistemas',
            type: "post",
            data: { Enlace: Enlace },
            dataType: "json",
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": false,
        "iDisplayLength": 9,
        "autoWidth": true,
        "autoHeight": false,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    }).DataTable();

}

var tablaPermisosSistemas;


function CargarpermisosExtras(Enlace)
{

    tablaPermisosSistemas = $('#TablaPermisosExtras').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": false,
        lengthChange: false,
        colReorder: true,
        info: false, 
        "ajax": {
            url: '../../../controller/usuarioController.php?opcion=ListaDePermisosExtras',
            type: "post",
            data: { Enlace: Enlace },
            dataType: "json",
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": false,
        "iDisplayLength": 9,
        "autoWidth": true,
        "autoHeight": false,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    }).DataTable();

}

$(document).ready(function()
{
    const Enlace = getUrlParameter('Enlace');

    $.post("../../../controller/usuarioController.php?opcion=DetallesUsuarioXid", { Enlace: Enlace }, function (data) 
    {
        $('#datosUsuarioGeneral').html(data);
    }); 

    CargarpermisosSistemas(Enlace);
    CargarpermisosExtras(Enlace);

});


function getUrlParameter(sParam) 
 {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
    return null;
}
