function init() {
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
    console.log("Botón #BtnModal clickeado"); // Depuración
    $.post("../../controller/avisosController.php?opcion=ComboBoxTipoAviso", function(data) {
        console.log("Respuesta del servidor:", data); // Depuración
        if (data) {
            console.log("Mostrando modal y llenando combo box"); // Depuración
            $('#ModalAgregarAviso').modal('show');
            $('#tipo_notificacion').html(data);
        } else {
            console.error("No se recibieron datos válidos para el combo box."); // Depuración
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error en la solicitud:", textStatus, errorThrown); // Depuración
    });
});

$(document).on("click", "#guardarAviso", function() {
    const tipoAviso = $("#tipo_notificacion").val();

    if (!tipoAviso) {
        alert("Por favor, selecciona un tipo de aviso.");
        return;
    }

    $.post("../../controller/avisosController.php?opcion=GuardarAviso", { tipo: tipoAviso }, function(response) {
        alert("Aviso guardado correctamente");
        $('#ModalAgregarAviso').modal('hide');
        tabla.ajax.reload(); // Recargar DataTable
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error al guardar el aviso:", textStatus, errorThrown);
        alert("Hubo un error al guardar el aviso. Por favor, inténtalo de nuevo.");
    });
});

function loadImage(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('preview-image');

    if (!preview) {
        console.error('El elemento #preview-image no existe en el DOM.');
        return;
    }

    if (!file) {
        console.log('No se seleccionó ningún archivo.');
        return;
    }

    if (!file.type.startsWith('image/')) {
        console.log('El archivo seleccionado no es una imagen.');
        return;
    }

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