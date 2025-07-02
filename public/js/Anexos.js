  
    $(document).ready(function() {
        var id_equipo = getUrlParameter('ID');
    
        $('#Anexos').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('Anexos.php');
        
        $.post("../../controller/bienesInformaticosController.php?opcion=DetallesBienInfoXid", { id_equipo: id_equipo }, function(data) {
            try {
                $('#imagen_anexo').attr('src', data.imagen_anexo);
                
                if (data.pdf_anexo) {
                    $('#pdf_anexo').attr('src', data.pdf_anexo);
                    $('#no-file-message').hide(); // Ocultar mensaje
                } else {
                    $('#pdf_anexo').attr('src', 'no hay nada aqui'); // Limpiar el iframe
                    $('#no-file-message').show(); // Mostrar mensaje de no archivo
                }
            } catch (e) {
                console.error("Error al parsear JSON: ", e);
                console.log("Datos recibidos: ", data);
            }
        }, 'json');
    });
    
    });
