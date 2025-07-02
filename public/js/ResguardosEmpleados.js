var tabla;

$(document).ready(function() 
{
    tabla = $('#MisResguardos').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [

        ],
        "ajax": {
            url: '../../../controller/resguardosController.php?opcion=ResguardosxEmpleado',
            type: "post",
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


    $.post("../../../controller/resguardosController.php?opcion=ResguardosxEmpleadoPDF", function(data, status) 
    {
        $('#verResguardoPdf').data('file', 'data:application/pdf;base64,' + data.pdf_resguardo);
        $('#verResguardoPdf').data('filename', 'Mi_Resguardo_Informatico.pdf');
    });

});

$('#verResguardoPdf').on('click', function () 
{
    const fileData = $(this).data('file');
    const filename = $(this).data('filename');

    if (!fileData) {
        alert("Archivo no disponible.");
        return;
    }

    $('#previewFrame').attr('src', fileData);
    $('#modalNombreArchivo').text(filename);

    $('#btnDescargarArchivo')
        .attr('href', fileData)
        .attr('download', filename);


    const modal = new bootstrap.Modal(document.getElementById('modalDescarga'));
    modal.show();
});
