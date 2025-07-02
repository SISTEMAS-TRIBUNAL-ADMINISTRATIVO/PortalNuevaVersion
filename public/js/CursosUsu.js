function init() {
    // Initialize the DataTable
    tabla = $('#tablaCursos').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [

        ],
        "ajax": {
            url: '../../controller/cursosController.php?opcion=TodosLosCursos',
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
            { "targets": 0, "visible": false, "searchable": false } // Oculta la columna de ID
        ]
    });

    let selectedCourseId = null;
    
// Evento para seleccionar curso al hacer clic en la fila de la tabla
$('#tablaCursos tbody').on('click', 'tr', function() {
    $('#tablaCursos tbody tr.selected').removeClass('selected'); // Remover selección de otras filas
    $(this).addClass('selected'); // Marcar la fila seleccionada

    const data = tabla.row(this).data();
    selectedCourseId = data[0]; // Suponiendo que el ID está en la primera columna
    console.log("Curso seleccionado ID:", selectedCourseId); // Para depuración
});
    
            
$('#saveCourse').on('click', function() {
    const fileInput = $('#archivo_curso')[0]; // Asegúrate de que este sea el input del archivo
    const maxFileSizeMB = 5; // Límite en MB
    const maxFileSizeBytes = maxFileSizeMB * 1024 * 1024; // Convertir MB a bytes

    // Verificar si hay un archivo y su tamaño
    if (fileInput.files.length > 0) {
        const fileSize = fileInput.files[0].size; // Tamaño del archivo en bytes

        if (fileSize > maxFileSizeBytes) {
            alert('El tamaño máximo permitido es de ' + maxFileSizeMB + ' MB.'); // Alerta de tamaño
            return; // Salir de la función si el archivo es demasiado grande
        }
    }

    const data = {
        fecha_curso: $('#fecha_curso').val(),
        tema_curso: $('#tema_curso').val(),
        ponente_curso: $('#ponente_curso').val(),
        archivo_curso: $('#archivo_curso').data('base64'), // Usar el base64 almacenado
        descripcion_curso: $('#descripcion_curso').val()
    };

    $.post('../../controller/cursosController.php?opcion=AgregarCurso', data)
        .done(function(response) {
            console.log(response); // Ver la respuesta
            if (response.success) {
                alert('Curso agregado con éxito.');
                tabla.ajax.reload();
                $('#addCourseModal').modal('hide');
                selectedCourseId = null; // Reiniciar selección
            } else {
                alert('Error: ' + (response.message || 'Error al agregar curso.'));
            }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud:", textStatus, errorThrown);
            alert('Error en la conexión. Por favor, inténtelo de nuevo.');
        });
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
    if (selectedCourseId) {
        // Solo mostrar el modal si hay un curso seleccionado
        $('#delete_id_curso').val(selectedCourseId);
        $('#deleteCourseModal').modal('show');
    } else {
        alert('Por favor, selecciona un curso para eliminar.');
    }
});

// Manejar el evento de clic en el botón de confirmación de eliminación
$('#confirmDelete').on('click', function() {
    $.post('../../controller/cursosController.php?opcion=EliminarCurso', { id_curso: selectedCourseId }, function(response) {
        if (response.success) {
            alert('Curso eliminado con éxito.');
            tabla.ajax.reload();
            $('#deleteCourseModal').modal('hide');
            selectedCourseId = null; // Reiniciar selección
        } else {
            alert('Error al eliminar curso.');
        }
    });
});



    //Codifica para subirlo en BASE64
        $('#archivo_curso').on('change', function() {
            var file = $(this)[0].files[0];
            if (file) {
                var reader = new FileReader();
        
                reader.onload = function(e) {
                    // Obtener el contenido en base64
                    var base64data = e.target.result.split(',')[1]; // Solo la parte base64
                    
                    // Almacenar el base64 en un data attribute para su uso posterior
                    $('#archivo_curso').data('base64', base64data);
                };
        
                // Leer el archivo como Data URL
                reader.readAsDataURL(file);
            }
        });

        $('#tablaCursos tbody').on('click', 'a.view-file', function() {
            const fileContent = $(this).data('file');
            
            fileContent.startsWith('data:application/pdf')
                $('#pdfViewer').attr('src', fileContent); // Usar la cadena Base64 directamente
                $('#pdfViewer').show();
                $('#fileViewer').hide(); // Ocultar el visualizador de texto

            
            $('#DescargarPDF').attr('data-file', fileContent);
            $('#DescargarPDF').show();
            $('#fileModal').modal('show');
        });
        
        $('#DescargarPDF').on('click', function() {
            const fileContent = $(this).attr('data-file');
            const base64Data = fileContent.split(',')[1]; // Get the Base64 part
        
            // Create a Blob from the Base64 data
            const byteCharacters = atob(base64Data);
            const byteNumbers = new Uint8Array(byteCharacters.length);
        
            for (let i = 0; i < byteCharacters.length; i++) {
                byteNumbers[i] = byteCharacters.charCodeAt(i);
            }
        
            const blob = new Blob([byteNumbers], { type: 'application/pdf' }); // Set to PDF type
        
            // Create a link element to trigger the download
            const a = document.createElement('a');
            const url = URL.createObjectURL(blob);
            a.href = url;
            a.download = 'Presentacion_del_curso.pdf'; // Set filename for download
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url); // Free up memory
        });
        

}
    $(document).ready(function() {
        init();
    });

