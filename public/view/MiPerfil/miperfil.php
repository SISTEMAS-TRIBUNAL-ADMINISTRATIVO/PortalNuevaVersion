<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Datos Personales - TJAECH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../public/css/style_dashboard.css">
    <link rel="icon" href="/public/images/LOGO_TJA.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="bg-gradient">
<?php require_once('../Header/header.php'); ?>

<main class="container py-4">
    <div class="row">
        <!-- Columna Datos Personales -->
        <div class="col-md-6">
            <div class="border rounded-3 mb-3">
                <div class="bg-secondary text-white p-2 rounded-top text-center " >
                    <strong>PERSONAL</strong>
                </div>
                <div class="p-3">
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" readonly id="Nombre">
                        </div>
                        <div class="col-md-6">
                            <label>Apellido Paterno</label>
                            <input type="text" class="form-control" readonly id="ApellidoPaterno">
                        </div>
                    </div>
                    <div class="row mb-2">
                         <div class="col-md-6">
                            <label>Apellido Materno</label>
                            <input type="text" class="form-control" readonly id="ApellidoMaterno">
                        </div>
                        <div class="col-md-6">
                            <label>RFC</label>
                            <input type="text" class="form-control" readonly id="RFC">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>CURP</label>
                            <input type="text" class="form-control" readonly id="CURP">
                        </div>
                        <div class="col-md-6">
                            <label>Sexo</label>
                            <input type="text" class="form-control" readonly id="Sexo">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <label>Domicilio</label>
                            <input type="text" class="form-control" readonly id="Domicilio">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Municipio</label>
                            <input type="text" class="form-control" readonly id="Municipio">
                        </div>
                        <div class="col-md-6">
                            <label>Colonia</label>
                            <input type="text" class="form-control" readonly id="Colonia">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="text" class="form-control" readonly id="Telefono">
                        </div>
                        <div class="col-md-6">
                            <label>Estado Civil</label>
                            <input type="text" class="form-control" readonly id="EstadoCivil">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Tipo de Sangre</label>
                            <input type="text" class="form-control" readonly id="TipoSangre">
                        </div>
                        <div class="col-md-6">
                            <label>Nacionalidad</label>
                            <input type="text" class="form-control" readonly id="Nacionalidad">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <label>Correo Personal</label>
                            <input type="text" class="form-control" readonly id="CorreoPersonal">
                        </div>
                    </div>
                    <div class="row mb-2">
                       <div class="col-md-6">
                            <label>Lugar de Nacimiento</label>
                            <input type="text" class="form-control" readonly id="LugarNacimiento">
                        </div>
                        <div class="col-md-6">
                            <label>Tipo de Vivienda</label>
                            <input type="text" class="form-control" readonly id="TipoVivienda">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Columna Datos Laborales -->
        <div class="col-md-6">
            <div class="border rounded-3 mb-3 ">
                <div class="bg-secondary text-white p-2 rounded-top text-center ">
                    <strong>LABORAL</strong>
                </div>
                <div class="p-3">
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Número de Enlace</label>
                            <input type="text" class="form-control" readonly id="NumeroEnlace">
                        </div>
                        <div class="col-md-6">
                            <label>Prefijo</label>
                            <input type="text" class="form-control" readonly id="Prefijo">
                        </div>
                    </div>
                    <div class="row mb-2">
                         <div class="col-md-6">
                            <label>Banco</label>
                            <input type="text" class="form-control" readonly id="Banco">
                        </div>
                        <div class="col-md-6">
                            <label>Cuenta Bancaria / CLABE</label>
                            <input type="text" class="form-control" readonly id="CuentaBancaria">    
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <label>Correo Institucional</label>
                            <input type="text" class="form-control" readonly id="CorreoInstitucional">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <label>Número de Seguro Social</label>
                            <input type="text" class="form-control" readonly id="NumeroSeguroSocial">
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <label>Fecha de alta</label>
                            <input type="text" class="form-control" readonly id="FechaAlta">
                        </div>
                        <div class="col-md-6">
                            <label>Código SAT</label>
                            <input type="text" class="form-control" readonly id="CodigoSAT">
                        </div>
                    </div>

                </div>
            </div>

            <div class="border rounded-3 mb-3 ">
                <div class="bg-secondary text-white p-2 rounded-top text-center ">
                    <strong>ESCOLARIDAD</strong>
                </div>
            </div>
            <div class="table-responsive mt-4">
                <table id="tableescolaridad" class="table table-striped">
                <thead>
                    <tr>
                    <th>ESCOLARIDAD</th>
                    <th>PROFESION</th>
                    <th>DOCUMENTO</th>
                    <th>AÑO</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
                </table>
            </div>
        </div>
    </div> 
</main>

<?php require_once('../Footer/footer.php'); ?>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../js/miperfil.js"></script>
</body>
</html>
