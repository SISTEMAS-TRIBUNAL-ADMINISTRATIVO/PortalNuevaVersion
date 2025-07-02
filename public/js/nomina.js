var tabla;

$(document).ready(function () 
{
    tabla = $('#tablanominas').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
        "ajax": {
            url: '../../../controller/nominasController.php?opcion=NominasEmpleado',
            type: "post",
            dataType: "json",
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
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


    $('#tablanominas tbody').on('click', '.view-file', function(e) 
    {
        e.preventDefault();

        const archivo = $(this).data('file'); // data:application/xxx;base64,...
        const nombre = $(this).data('filename') || "archivo";
        const tipo = $(this).data('tipo') || "Archivo";

        $("#modalNombreArchivo").text(nombre);
        $("#btnDescargarArchivo").attr("href", archivo);
        $("#btnDescargarArchivo").attr("download", nombre);

        const preview = document.getElementById("previewFrame");

        try {
            const base64 = archivo.split(',')[1];
            const byteCharacters = atob(base64);

            const byteNumbers = new Array(byteCharacters.length);
            for (let i = 0; i < byteCharacters.length; i++) {
                byteNumbers[i] = byteCharacters.charCodeAt(i);
            }

            const byteArray = new Uint8Array(byteNumbers);

            let blob;
            if (tipo === "PDF") {
                blob = new Blob([byteArray], { type: "application/pdf" });
            } else if (tipo === "XML") {
               blob = new Blob([byteArray], { type: "text/plain" }); // en vez de text/xml
            }

            if (blob) {
                const url = URL.createObjectURL(blob);
                preview.src = url;
            } else {
                preview.src = "";
            }
        } catch (err) {
            console.error("Error al procesar el archivo:", err);
            preview.src = "";
        }

        const modal = new bootstrap.Modal(document.getElementById("modalDescarga"));
        modal.show();
});


});
