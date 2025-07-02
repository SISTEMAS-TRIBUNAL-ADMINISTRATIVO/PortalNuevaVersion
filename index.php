<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Portal de las Personas Servidoras Públicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="public/css/style_login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="login-card text-center">
        <img src="public/images/LOGO_TJA.png" alt="LOGO_TJA.png">
        <div class="title">Tribunal de Justicia Administrativa</div>
        <div class="sub-title">Portal de las Personas Servidoras Públicas</div>

        <form class="mt-4" method="POST" id="login_form">
            <div class="mb-3 text-start">
                <input type="text" class="form-control" id="email" name="email" required placeholder="Correo Electrónico" >
            </div>
            <div class="mb-3 text-start">
                <input type="password" class="form-control" id="password" name="password" required placeholder="Contraseña" >
            </div>
            <button type="submit" class="btn btn-primary w-100">INICIAR SESIÓN</button>
        </form>

        <footer class="mt-4">
            <img src="public/images/Justicia_con_Humanismo.png" alt="Justicia con Humanismo" style="max-height: 60px;">
            <a href="ruta/a/la/vista/registro.php" class="mt-2 d-block text-decoration-none"> ¿Olvidaste tu usuario y/o contraseña? </a>
                <a href="public/view/Registro/registro.php" class="btn btn-secondary mt-2"> CREA TU CUENTA </a>
        </footer>
    </div>
     <script src="public/vendors/jquery/dist/jquery.min.js"></script>
     <script type="text/javascript" src="public/js/index.js"></script>
</body>
</html>
