<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles del usuario - TJAECH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../public/css/style_detallesUsuario.css">
</head>
<body>

<?php require_once('../Header/header.php'); ?>

<div class="container my-5">
    <div class="card p-4 mb-5">
        <div class="row" id="datosUsuarioGeneral" >
            <!-- Datos del usuario -->
        </div>
    </div>

    <!-- Tabla de permisos de sistemas -->
    <div class="card mb-5">
        <div class="card-header d-flex justify-content-between align-items-center text-align-center">
            TABLA DE PERMISOS DE SISTEMAS
        </div>
        <div class="card-body p-3">
             <button class="btn btn-sm btn-success" onclick="agregarPermisoSistema()">
                <i class="bi bi-plus-circle me-1"></i>Agregar Permiso
             </button>
            <br>
            <br>
            <div class="table-responsive">
                <table class="table table-bordered align-middle" id="TablaPermisosSistemas">
                    <thead>
                        <tr>
                            <th>Sistema</th>
                            <th>Rol</th>
                            <th>Fecha de Asignación</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Tabla de permisos extras -->
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            TABLA DE PERMISOS EXTRAS
        </div>
        <div class="card-body p-3">
            <button class="btn btn-sm btn-success" onclick="agregarPermisoExtra()">
                <i class="bi bi-plus-circle me-1"></i>Agregar Permiso Extra
            </button>
            <br>
            <br>
            <div class="table-responsive">
                <table class="table table-bordered align-middle" id="TablaPermisosExtras">
                    <thead>
                        <tr>
                            <th>Permiso</th>
                            <th>Sistema</th>
                            <th>Fecha de Asignación</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php require_once('../Footer/footer.php'); ?>

<script src="../../../public/vendors/jquery/dist/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../public/js/detalles_usuario.js"></script>
</body>
</html>
