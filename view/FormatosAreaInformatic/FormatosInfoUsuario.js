function init() {
    // Initialize the DataTable
    tabla = $('#Formatos_informatica').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [

        ],
        "ajax": {
            url: '../../controller/formatosController.php?opcion=TodosFormatos',
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
            "sProcessing": "Procesando..."
        },
        "columnDefs": [
            { "targets": 0, "visible": false, "searchable": false },//
            { "targets": 4, "visible": false, "searchable": false } //Oculta la columna de ID
        ]
    });

    let selectedId = null;
    
// Evento para seleccionar curso al hacer clic en la fila de la tabla
$('#Formatos_informatica tbody').on('click', 'tr', function() {
    $('#Formatos_informatica tbody tr.selected').removeClass('selected'); // Remover selección de otras filas
    $(this).addClass('selected'); // Marcar la fila seleccionada

    const data = tabla.row(this).data();
    selectedId = data[0]; // Suponiendo que el ID está en la primera columna
    console.log("Formato seleccionado ID:", selectedId); // Para depuración
});
$('#saveFormat').on('click', function() {
    const fileInput = $('#archivo_formato')[0];

    // Verifica si hay un archivo
    if (fileInput.files.length === 0) {
        alert('Por favor, selecciona un archivo.'); // Alerta si no hay archivo
        return;
    }

    const file = fileInput.files[0];
    const reader = new FileReader();

    reader.onload = function(event) {
        const base64String = event.target.result.split(',')[1]; // Obtiene solo la parte base64
        const data = {
            fecha_formato: $('#fecha_formato').val(),
            nombre: $('#nombre').val(),
            archivo_formato: base64String, // Archivo en base64
            extencion_formato: file.name.split('.').pop() // Obtiene la extensión
        };

        // Envía los datos al servidor
        $.post('../../controller/formatosController.php?opcion=AgregarFormato', data)
            .done(function(response) {
                console.log(response); // Ver la respuesta sin procesar
                // Verifica si la respuesta es exitosa
                if (response.success) {
                    alert('Formato agregado con éxito.');
                    tabla.ajax.reload();
                    $('#addFormatosModal').modal('hide');
                    selectedId = null;
                } else {
                    alert('Error: ' + (response.error || 'Error al agregar Formato.'));
                }
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud:", textStatus, errorThrown);
                alert('Error en la conexión. Por favor, inténtelo de nuevo.');
            });
    };

    reader.onerror = function() {
        alert('Error al leer el archivo.');
    };

    // Lee el archivo como un URL Data y ejecuta el onload
    reader.readAsDataURL(file);
});

let oldFile = ''; // Variable para almacenar el archivo anterior

$('#editCourseBtn').on('click', function() {
    if (selectedCourseId) {
        $.post("../../controller/cursosController.php?opcion=CursosXid", { id_curso: selectedCourseId }, function(data) {
            console.log(data); // Ver la respuesta

            if (data && !data.error) {
                $('#edit_fecha_curso').val(data.fecha_curso);
                $('#edit_tema_curso').val(data.tema_curso);
                $('#edit_ponente_curso').val(data.ponente_curso);

                // Verifica que archivo_curso esté presente
                if (data.archivo_curso) {
                    const pdfData = 'data:application/pdf;base64,' + data.archivo_curso.trim();
                    $('#pdfViewerC').attr('src', pdfData);
                    $('#pdfViewerC').show();
                    $('#pdfMessage').hide();
                    oldFile = data.archivo_curso; // Guardar el archivo anterior
                } else {
                    $('#pdfViewerC').hide();
                    $('#pdfMessage').text('No hay PDF disponible.').show();
                }

                $('#edit_descripcion_curso').val(data.descripcion_curso);
                $('#editCourseModal').modal('show');
            } else {
                alert('No se encontró información para el curso seleccionado.');
            }
        }, 'json');
    } else {
        alert('Por favor, selecciona un curso para editar.');
    }
});
$('#updateCourse').on('click', function() {
    if (selectedCourseId) {
        const newFile = $('#new_pdf')[0].files[0]; // Obtener el nuevo archivo

        // Verificar el tamaño del archivo
        if (newFile && newFile.size > 5 * 1024 * 1024) { // 5 MB en bytes
            alert('El archivo excede el tamaño máximo permitido de 5 MB.');
            return; // Salir de la función si el archivo es demasiado grande
        }

        const data = {
            id_curso: selectedCourseId,
            fecha_curso: $('#edit_fecha_curso').val(),
            tema_curso: $('#edit_tema_curso').val(),
            ponente_curso: $('#edit_ponente_curso').val(),
            archivo_curso: newFile ? null : oldFile, // Usar el archivo anterior si no hay nuevo
            descripcion_curso: $('#edit_descripcion_curso').val()
        };

        // Si hay un nuevo archivo, convertirlo a base64
        if (newFile) {
            const reader = new FileReader();
            reader.onload = function(event) {
                data.archivo_curso = event.target.result.split(',')[1]; // Extraer solo la parte base64
                sendUpdateRequest(data);
            };
            reader.readAsDataURL(newFile);
        } else {
            sendUpdateRequest(data); // Enviar la solicitud si no hay nuevo archivo
        }
    } else {
        alert('Por favor, selecciona un curso para editar.');
    }
});

function sendUpdateRequest(data) {
    $.post('../../controller/cursosController.php?opcion=ActualizarCurso', data)
        .done(function(response) {
            console.log("Respuesta del servidor:", response); // Log de la respuesta

            if (response.success) {
                alert('Curso actualizado con éxito.');
                location.reload(); // Recargar la página
            } else {
                alert('Error: ' + (response.message || 'Error al actualizar curso.'));
            }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud:", textStatus, errorThrown, jqXHR.responseText);
            alert('Error en la conexión. Detalles: ' + jqXHR.responseText);
        });
}



// Manejar el evento de clic en el botón de eliminación de curso
$('#deleteCourseBtn').on('click', function() {
    if (selectedId) {
        // Solo mostrar el modal si hay un curso seleccionado
        $('#delete_id_curso').val(selectedId);
        $('#deleteCourseModal').modal('show');
    } else {
        alert('Por favor, selecciona un curso para eliminar.');
    }
});

// Manejar el evento de clic en el botón de confirmación de eliminación
$('#confirmDeleteForm').on('click', function() {
    $.post('../../controller/formatosController.php?opcion=EliminarFormato', { id_formato: selectedId }, function(response) {
        if (response.success) {
            alert('Curso eliminado con éxito.');
            tabla.ajax.reload();
            $('#deleteFormatosModal').modal('hide');
            selectedId = null; // Reiniciar selección
        } else {
            alert('Error al eliminar curso.');
        }
    });
});

   // Evento para el botón de descarga
   $('#Formatos_informatica tbody').on('click', 'button[id^="download-btn-"]', function() {
    const base64Data = $(this).data('base64');
    const extencion = $(this).data('extencion');
    const nombreArchivo = $(this).data('nombre'); // Obtener el nombre del archivo
    descargarArchivo(base64Data, extencion, nombreArchivo);
});

}

function descargarArchivo(base64Data, extencion, nombreArchivo) {
    const mimeType = getMimeType(extencion);
    const link = document.createElement('a');
    link.href = `data:${mimeType};base64,${base64Data}`;
    link.download = `${nombreArchivo}.${extencion}`; // Usar el nombre del archivo desde la base de datos
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link); // Limpiar el DOM
}


function getMimeType(extencion) {
switch (extencion.toLowerCase()) {
    case 'pdf':
        return 'application/pdf';
    case 'doc':
    case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    case 'xls':
    case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    default:
        return 'application/octet-stream'; // Tipo por defecto
}
}

    $(document).ready(function() {
        init();
    });

