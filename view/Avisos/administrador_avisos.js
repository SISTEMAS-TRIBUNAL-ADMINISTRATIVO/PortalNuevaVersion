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


$(document).on("click", "#BtnModal", function() {
    $.post("../../controller/avisosController.php?opcion=ComboBoxTipoAviso", function(data) {
        console.log("Respuesta del servidor:", data);
        $('#tipo_notificacion').empty().append(data);
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

function loadImage(event) {
    const file = event.target.files[0];
    
    // Verifica que se haya seleccionado un archivo
    if (!file) {
      console.log('No se seleccionó ningún archivo.');
      return;
    }

    // Verifica si el archivo es una imagen
    if (!file.type.startsWith('image/')) {
      console.log('El archivo seleccionado no es una imagen.');
      return;
    }

    const preview = document.getElementById('preview-image');
    const reader = new FileReader();

    reader.onload = function(e) {
      console.log('Imagen cargada correctamente.');
      preview.src = e.target.result;  // Establece la imagen cargada
    };

    reader.onerror = function() {
      console.log('Hubo un error al leer el archivo.');
    };

    reader.readAsDataURL(file); // Lee el archivo como URL de datos
}        