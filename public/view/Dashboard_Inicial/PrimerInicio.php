<?php   session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Configuración Inicial - TJAECH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../public/css/style_primer_inicio.css">
</head>


<header class="d-flex justify-content-between align-items-center p-3 shadow bg-white">
    <div class="d-flex align-items-center gap-3">
        <img src="<?php echo $_SESSION["fotoBase64"]; ?>" alt="Foto de usuario" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; margin-left: 50px;">
        <div>
            <h5 class="mb-0 text-dark"><strong><?php echo $_SESSION["Mensaje"]?></strong></h5>
            <h5 class="mb-0 text-dark"><strong><?php echo $_SESSION["nombre"] ?></strong></h5>
            <small class="text-muted">Tribunal de Justicia Administrativa del Estado de Chiapas</small>
        </div>
    </div>
    <img src="../../../public/images/LOGO_TJA.png" alt="Logo Gobierno" height="100">
</header>


<nav class="navbar navbar-expand-lg navbar-dark bg-secondary shadow-sm">
    <div class="container-fluid">
        <div class="collapse navbar-collapse ms-5" id="menuPrincipal">
            
        </div>
    </div>
</nav>


<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4">
                   <div class="alert alert-info text-center" role="alert">
                       Por seguridad debes cambiar tu contraseña temporal y completar tu información personal para continuar con el uso del sistema.
                    </div>

                    <form id="configuracion_form">
                        <div class="mb-3">
                            <label for="nueva_contraseña" class="form-label">Nueva Contraseña</label>
                            <input type="password" class="form-control" id="nueva_contraseña" name="nueva_contraseña" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmar_contraseña" class="form-label">Confirmar Contraseña</label>
                            <input type="password" class="form-control" id="confirmar_contraseña" name="confirmar_contraseña" required>
                        </div>
                        <div class="mb-3">
                            <label for="area" class="form-label">Área a la que pertenece</label>
                            <select class="form-select" id="C_areas" name="C_areas" required>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="area" class="form-label">Número de Piso</label>
                            <select class="form-select" id="C_Pisos" name="C_Pisos" required>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="siglas" class="form-label">Siglas de tu nombre</label>
                            <input type="text" class="form-control" id="siglas" name="siglas" placeholder="Ej: JFVN" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Guardar configuración</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php  require_once('../Footer/footer.php'); ?>

    <script src="../../../public/vendors/jquery/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../../js/primerInicio.js"></script>
</body>
</html>
