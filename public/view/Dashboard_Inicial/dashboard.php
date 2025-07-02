<?php   session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Principal - TJAECH </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../public/css/style_dashboard.css">
    <link rel="icon" href="../../../public/images/LOGO_TJA.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-gradient">

<?php  require_once('../Header/header.php'); ?>

    <main class="container py-5">
        <div class="text-center mb-4">
            <h2 class="text-white">Sistemas Disponibles</h2>
        </div>
        <!-- Tarjeta de los sistemas -->
        <div class="row g-4" id="ContenedorSistemas">
            <!-- Aquí se cargarán los sistemas mediante AJAX -->
        </div>

      <div class="d-flex align-items-center justify-content-center" style="height: 45vh;">
        <div class=".row-cols-4" id="Contenedor_Notificaciones"></div>
      </div>
      
    </main>

    
    <?php  require_once('../Footer/footer.php'); ?>


     <script src="../../../public/vendors/jquery/dist/jquery.min.js"></script>
     <?php require_once("ModalDashboard.php"); ?>
     <script type="text/javascript" src="../../../public/js/dashboard.js"></script>
          
</body>
</html>
