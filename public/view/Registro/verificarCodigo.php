<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../public/css/style_login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="login-card text-center">
        <img src="../../../public/images/LOGO_TJA.png" alt="LOGO_TJA.png">
        <div class="sub-title">Código de verificación de tu cuenta</div>

        <form class="mt-4" method="POST" id="codigo_form">
            <div class="mb-3 text-start">
                <input type="text" class="form-control" id="codigover" name="codigover" required placeholder="Ingresa el código de verificación*">
            </div>
            <button type="submit" class="btn btn-primary w-100">VERIFICAR</button>
        </form>

        <footer class="mt-4">
            <img src="../../../public/images/Justicia_con_Humanismo.png" alt="Justicia con Humanismo" style="max-height: 60px;">
            <br>
        </footer>
    </div>
    <script src="../../../public/vendors/jquery/dist/jquery.min.js"></script>
    <script src="../../JS/verificarCodigo.js"></script>
</body>
</html>                                                                                                                                                                                                                          