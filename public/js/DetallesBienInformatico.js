var tabla;

$(document).ready(function() 
{
    var id_equipo = getUrlParameter('ID');
    


    $.post("../../controller/bienesInformaticosController.php?opcion=DetallesBienInfoXid", { id_equipo: id_equipo },  function (data) {
        try {
        $('#Descripcion').val(data.Descripcion);
        $('#Marca').val(data.Marca);
        $('#Modelo').val(data.Modelo);
        $('#Serie').val(data.Serie);
        $('#Inventario').val(data.Inventario);
        $('#Origen_del_Equipo').val(data.Origen_del_Equipo);
        $('#MAC').val(data.MAC);
        $('#Factura').val(data.Factura);
        $('#Folio_Fiscal').val(data.Folio_Fiscal);
        $('#Fecha_Adsquisicion').val(data.Fecha_Adsquisicion);
        $('#Nombre_proveedor').val(data.Nombre_proveedor);
        $('#costo_original').val(data.costo_original);
        $('#costo_actual').val(data.costo_actual);
        $('#cuenta').val(data.cuenta);
        $('#subcuenta').val(data.subcuenta);
        $('#sub_subcuenta').val(data.sub_subcuenta);
        $('#licencia_publica').val(data.licencia_publica);
        $('#licencia_privada').val(data.licencia_privada);
        $('#fecha_caducidad').val(data.fecha_caducidad);
        $('#Caracteristicas').val(data.Caracteristicas);
        $('#comentarios_cuenta_contable').val(data.comentarios_cuenta_contable);
        $('#Disponibilidad').val(data.Disponibilidad);
        $('#licencia_privada_office').val(data.licencia_privada_office);
        $('#fecha_inicial_garantia').val(data.fecha_inicial_garantia);
        $('#fecha_final_garantia').val(data.fecha_final_garantia);
        $('#fecha_caducidad_office').val(data.fecha_caducidad_office);
        $('#imagen_equipo').attr('src', data.imagen_equipo);// Verifica el valor

        var id_empleado = data.fk_resguardante;
   


        if(data.tiene_cuenta_contable ==1)
            {
                $('#tiene_cuenta_contable').val('1');
            }

        if(data.tiene_garantia ==1)
            {
                $('#tiene_garantia').val('1');
            }
            


    $.post("../../controller/empleadosController.php?opcion=Xid", { id_empleado: id_empleado }, function(data) {
            $('#fk_resguardante').val(data.Empleado);
            $('#equipo_ubicacion').val(data.AREA);
    }, )

    
    } catch (e) {
        console.error("Error al parsear JSON: ", e);
        console.log("Datos recibidos: ", data);
    }
    },'json');





    
    $('#HistorialResguardo').on('show.bs.modal', function(e) 
    {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/HistorialResguardo.php', function() 
        {
        
        tabla=$('#historial').dataTable({
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
            "ajax":{
                url: '../../controller/resguardosController.php?opcion=Historial',
                type : "post",
                dataType : "json",						
                error: function(e){
                    console.log(e.responseText);	
                }
            },
            "bDestroy": true,
            "responsive": true,
            "bInfo":true,
            "iDisplayLength": 10,
            "autoWidth": false,
            "language": {
                "sProcessing":     "Procesando...",
                "sLengthMenu":     "Mostrar _MENU_ registros",
                "sZeroRecords":    "No se encontraron resultados",
                "sEmptyTable":     "Ningún dato disponible en esta tabla",
                "sInfo":           "Mostrando un total de _TOTAL_ registros",
                "sInfoEmpty":      "Mostrando un total de 0 registros",
                "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix":    "",
                "sSearch":         "Buscar:",
                "sUrl":            "",
                "sInfoThousands":  ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst":    "Primero",
                    "sLast":     "Último",
                    "sNext":     "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }     
        }).DataTable(); 
    });
    });


    
    
    $('#Mantenimiento').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/Mantenimiento.php'); // Ajusta la ruta según sea necesario
    });

    $('#FichasTecnicas').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/FichasTecnicas.php'); // Ajusta la ruta según sea necesario
    });

    $('#Anexos').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/Anexos.php');
        
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
    

    $('#MarcaModal').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/Marca.php'); // Ajusta la ruta según sea necesario
    });

    $('#FolioFacturaModal').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/FolioFactura.php'); // Ajusta la ruta según sea necesario
    });

    $('#FolioFacturaModal').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/FolioFactura.php'); // Ajusta la ruta según sea necesario
    });

    $('#IDpublicoAntivirus').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/IdPublicoAntivirus.php'); // Ajusta la ruta según sea necesario
    });

    $('#ModalLiceciaOffice').on('show.bs.modal', function(e) {
        var modal = $(this);
        modal.find('.modal-content').load('../modals/DetallesBienInformatico/LicenciaOffice.php'); // Ajusta la ruta según sea necesario
    });
    
    
    



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
    
    init();



});



