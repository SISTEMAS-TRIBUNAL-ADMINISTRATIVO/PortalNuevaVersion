<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - Portal de las Personas Servidoras Públicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../public/css/style_login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="login-card text-center">
        <img src="../../../public/images/LOGO_TJA.png" alt="LOGO_TJA.png">
        <div class="sub-title">Ingresa tus datos para identificarte como Persona Servidora Pública</div>

        <form class="mt-4" method="POST" id="registro_form">
            <div class="mb-3 text-start">
                <input type="text" class="form-control" id="curp" name="curp" required placeholder="CURP*">
            </div>
            <div class="mb-3 text-start">
                <input type="email" class="form-control" id="correo" name="correo" required placeholder="Correo personal*">
            </div>
            <button type="submit" class="btn btn-primary w-100">REGISTRARSE</button>
        </form>

        <footer class="mt-4">
            <img src="../../../public/images/Justicia_con_Humanismo.png" alt="Justicia con Humanismo" style="max-height: 60px;">
            <br>
            <a href="../../../index.php" class="btn btn-outline-secondary mt-2">Volver al inicio de sesión</a>
        </footer>
    </div>

    <script src="../../../public/vendors/jquery/dist/jquery.min.js"></script>
    <script src="../../JS/registro.js"></script>
</body>
</html>
