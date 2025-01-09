$(document).ready(function() {
    // Obtener el ID del usuario desde la URL
    var id_empleado = getUrlParameter('ID');

    // Cargar los datos del empleado en el formulario
    $.post("../../controller/empleadosController.php?opcion=Xid", { id_empleado: id_empleado }, function(data) {
        // Asegúrate de que los datos lleguen como JSON
        try {
            $('#nombre').val(data.Empleado);
            $('#ubicacion').val(data.AREA);
        } catch (e) {
            console.error("Error al parsear JSON: ", e);
            console.log("Datos recibidos: ", data);
        }
    }, 'json') // Especifica el tipo de datos esperado como 'json'
    

    // Configuración de la tabla
    tabla = $('#resguardosempleados').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [

        ],
        "ajax": {
            url: '../../controller/resguardosController.php?opcion=ResguardosEmpleadoXid',
            type: "post",
            data: { id_empleado: id_empleado },
            dataType: "json",
            error: function(e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        
        "bInfo": true,
        "iDisplayLength": 7,
        "autoWidth": true,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "sLoadingRecords": "Cargando...",
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
    });

    // Función para obtener parámetros de la URL
    function getUrlParameter(sParam) {
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
        return null; // Retornar null si el parámetro no se encuentra
    }

    $('#generatePdfButton').click(function() {
        var id_empleado = getUrlParameter('ID');
        window.location.href = 'generate_pdf.php?id_empleado=' + id_empleado;
    });
    
});
