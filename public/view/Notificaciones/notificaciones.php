<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Notificaciones - TJAECH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../public/css/style_dashboard.css">
    <link rel="icon" href="/public/images/LOGO_TJA.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="bg-gradient">

<?php  require_once('../Header/header.php'); ?>

    <main class="container py-5"> 
        <button type='button' id='btnAgregarNotificacion' class='btn btn-inline btn-secondary' style="display: none;"> Agregar Aviso</button>
        <br><br>
        <div class="table-responsive">
            <table class="table table-striped align-middle" id="TablaNotificaciones">
                <thead class="table-light text-left">
                    <tr>
                        <th>Notificación</th>
                        <th>Mensaje</th>
                        <th>A quien se Notifica</th>
                        <th>Fecha de creación</th>
                        <th>Estado de notificación</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </main>

    <?php  require_once('../Footer/footer.php'); ?>
    <?php require_once("modalAgregarNotificacion.php"); ?>

    <!-- Scripts al final -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../js/administrador_notificaciones.js"></script>
</body>
</html>
