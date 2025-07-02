var tabla;

function init()
{
    $('#formNewPassword').on('submit', function(e) 
    {
        e.preventDefault();
        var formData = $(this).serialize();
        var pass = $("#NewPassword").val();
        var newpass = $("#confirmarpassword").val();

        if (pass !== newpass) 
        {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Las contraseñas no coinciden.",
            });
        }
        else
        {
            $.ajax({
                type: "POST",
                url: "../../../controller/usuarioController.php?opcion=CambiarPassword",
                data: formData,
                success: function(response) 
                {
                    if(response.Validar==1)
                    {
                        Swal.fire({
                            icon: "success",
                            title: "Guardado con éxito",
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }
                }
            });
        }
        });
}

$(document).ready(function()
{
    Swal.fire({
        icon: "warning",
        title: "Atención",
        text: "Si detecta algún error en sus datos personales o laborales, comuníquese con el Área de Recursos Humanos para su corrección.",
        footer: '<a href="#">Tribunal de Justicia Administrativa del Estado de Chiapas</a>'
    });


    $.post("../../../controller/usuarioController.php?opcion=Miperfil", function (data) 
    {
        $('#Nombre').val(data.emp_nombres);
        $('#ApellidoPaterno').val(data.emp_paterno);
        $('#ApellidoMaterno').val(data.emp_materno);
        $('#RFC').val(data.emp_rfc);
        $('#CURP').val(data.emp_curp);
        $('#Sexo').val(data.sex_descripcion);
        $('#Domicilio').val(data.emp_domicilio);
        $('#Municipio').val(data.mun_domicilio);
        $('#Colonia').val(data.col_descripcion);
        $('#Telefono').val(data.emp_telpart);
        $('#EstadoCivil').val(data.civ_descripcion);
        $('#TipoSangre').val(data.san_descripcion);
        $('#Nacionalidad').val(data.nac_descripcion);
        $('#CorreoPersonal').val(data.emp_correoper);
        $('#LugarNacimiento').val(data.mun_nacimiento);
        $('#TipoVivienda').val(data.viv_descripcion);
        $('#NumeroEnlace').val(data.emp_enlace);
        $('#Prefijo').val(data.pre_descripcion);
        $('#Banco').val(data.ban_descripcion);
        $('#CuentaBancaria').val(data.emp_clabe);
        $('#NumeroSeguroSocial').val(data.emp_numeross);
        $('#FechaAlta').val(data.emp_ingresogobierno);
        $('#CodigoSAT').val(data.emp_cp_sat);
    }); 

    tabla=$('#tableescolaridad').dataTable({
        "aProcessing": true,
        "aServerSide": false,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        buttons: [		          

                ],
        "ajax":{
            url: '../../../controller/usuarioController.php?opcion=DatosAcademicos',
            type : "post",
            dataType : "json",						
            error: function(e){
                console.log(e.responseText);	
            }
        },
        "bDestroy": false,
        "responsive": true,
        "bInfo":false,
        "iDisplayLength": 10,
        "autoWidth": false,
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Mostrando un total de _TOTAL_ registros",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix":    "",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",

            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }     
    }).DataTable(); 
});

init();


