function init() {
    

    $(document).ready(function()
    {
    $.post("../../controller/usuarioController.php?opcion=Miperfil", function (data) 
        {
       const nombreCompleto = `${data.Nombre} ${data.Paterno} ${data.Materno}`;
                $('#NombreCompleto').val(nombreCompleto); // Asegúrate de que el ID del input sea correcto
                $('#Miemail').val(data.Correo);
        }); 
    });

    // Configuración de la tabla
    tabla = $('#MisResguardos').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [
        ],
        "ajax": {
            url: '../../controller/resguardosController.php?opcion=ResguardosxEmpleado',
            type: "post",
            dataType: "json",
            error: function(e) {
                console.log("Error al cargar los datos: ", e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 10,
        "autoWidth": true,
        "language": {
            "sProcessing": "Procesando...",
            // Otras opciones de idioma...
        }
    });
}

$(document).ready(function() {
    init(); // Llama a la función init cuando el documento esté listo
});
