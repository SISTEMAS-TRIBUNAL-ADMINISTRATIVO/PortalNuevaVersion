function init() {
    // Initialize the DataTable
    tabla = $('#TablaAvisos').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [
            
        ],
        "ajax": {
            url: '../../controller/avisosController.php?opcion=Avisos',
            type: "post",
            dataType: "json",
            error: function(e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 9,
        "autoWidth": true,
        "language": {
            "sProcessing": "Procesando...",
            // ... other language settings
        }
    });


    $.post("../../controller/avisosController.php?opcion=ComboBoxTipoAviso",function(data, status)
    {
        $('#tipo_notificacion').html(data);
    });
    

    
    
}

$(document).ready(function() {
    init();
});


