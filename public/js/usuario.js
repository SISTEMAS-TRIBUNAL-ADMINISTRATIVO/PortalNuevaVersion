var tabla;

$(document).ready(function () 
{
    tabla = $('#tablausuarios').dataTable({
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
            url: '../../../controller/usuarioController.php?opcion=TodoslosUsuarios',
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
});


function verUsuario(enlace)
{
    window.location.href = '../../view/Usuario/detalles_usuario.php?Enlace=' + enlace;
}


function editarUsuario(Enlace)  
{
    $.post("../../../controller/usuarioController.php?opcion=UsuarioXid", { Enlace: Enlace }, function (data) 
    {
            $('#imagen_user').attr('src', data.imagen_user);
            $('#editEnlace').val(data.enlace);
            $('#editNombres').val(data.nombres);
            $('#editApellidoP').val(data.paterno);
            $('#editApellidoM').val(data.materno);
            $('#editCurp').val(data.curp);
            $('#editEmail').val(data.email);
            $('#editTelefono').val(data.telefono);
            $('#editSiglas').val(data.siglas);
            $('#editSexo').val(data.sexo);
            $('#editPrefijo').val(data.prefijo);
            $('#editDescripcionPrefijo').val(data.descripcion_prefijo);
            $('#modalEditarUsuario').modal('show');
            cargarAreasYSeleccionar(data.fk_area_pertenece_siga);
    }); 
  }

function cargarAreasYSeleccionar(valorSeleccionado) 
{
    $.post("../../../controller/catUbicacionController.php?opciones=cat_ubicaciones", function(data, status) {
        $('#editAreaPertenece').html(data);
        $('#editAreaPertenece').val(valorSeleccionado);
    });
}
