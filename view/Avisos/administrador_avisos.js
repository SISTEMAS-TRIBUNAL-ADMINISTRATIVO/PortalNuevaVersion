function init() {
    // Inicializar DataTable
    tabla = $('#TablaAvisos').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [],
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
        }
    });
}

$(document).ready(function() {
    init();
});

// Evento para abrir el modal y cargar el combo de tipos de aviso
$(document).on("click", "#BtnModal", function() { 
    $.post("../../controller/avisosController.php?opcion=ComboBoxTipoAviso", function(data) {
        $('#tipo_notificacion').html(data);
        $('#ModalAgregarAviso').modal('show');
    });
});

// Evento para guardar un nuevo aviso (si lo necesitas)
$(document).on("click", "#guardarAviso", function() {
    var tipoAviso = $("#tipo_notificacion").val();

    $.post("../../controller/avisosController.php?opcion=GuardarAviso", { tipo: tipoAviso }, function(response) {
        alert("Aviso guardado correctamente");
        $('#ModalAgregarAviso').modal('hide');
        tabla.ajax.reload(); // Recargar DataTable
    });
});
                                                                                                            