<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Nóminas - TJAECH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../public/css/style_dashboard.css">
    <link rel="icon" href="/public/images/LOGO_TJA.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="bg-gradient">

<?php  require_once('../Header/header.php'); ?>

    <main class="container py-5">
        <div class="table-responsive">
            <table class="table table-striped align-middle" id="tablanominas">
                <thead class="table-light text-center">
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha de timbrado</th>
                        <th>Concepto de nómina</th>
                        <th>Mensaje</th>
                        <th>XML</th>
                        <th>PDF</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </main>

    <?php  require_once('../Footer/footer.php'); ?>
    <?php require_once("modalNomina.php"); ?>
    <!-- Scripts al final -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../js/nomina.js"></script>
</body>
</html>
