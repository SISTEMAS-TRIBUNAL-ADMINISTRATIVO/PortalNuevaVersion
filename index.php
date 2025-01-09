<?php
session_start(); // Inicia la sesión

// Verifica si hay una sesión activa y destrúyela
if (isset($_SESSION['Enlace'])) {
    session_unset(); // Elimina todas las variables de sesión
    session_destroy(); // Destruye la sesión
    header("Location: logout.php"); // Redirige a la página de login (o alguna otra página que prefieras)
    exit();
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="public/images/TA PJECHIS.ico" />
    <title>Tribunal Administrativo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="style" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <script>
    // Bloquea el botón "Regresar" en el navegador
    if (window.history && window.history.pushState) {
        window.history.pushState("forward", null, window.location.href);
        window.onpopstate = function () {
            window.history.forward();
        };
    }
    </script>
   
  </head>
  <body class="">
    <section>
      <div class="row g-0">
      <div class="col-lg-7 d-none d-lg-block">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item img-cl min-vh-100 active">
              <a href="https://tachiapas.gob.mx/capacitaciones/" target="_blank">
                <img src="public/images/anuncios/4.jpg" class="vh-100 mw-100 mv-100 col-md-12">
              </a>
            </div>
            <div class="carousel-item min-vh-100">
              <a href="https://tachiapas.gob.mx/comite-igualdad/" target="_blank">
                <img src="public/images/anuncios/5.jpg" class="vh-100 mw-100 mv-100 col-md-12">
              </a>
            </div>

            <!-- Asegúrate de tener una tercera imagen si la necesitas -->
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Regresar</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
          </button>
        </div>
  </div>

        <div  style="background-color: #692e42; " class="col-lg-5 d-flex flex-column min-vh-100 position-relative backcolor">
        <div class="justify-content-center">
          <h3 class="fw-bold text-center pt-5" style="color: f0f2f5 ;"></h3>
        </div>
        <div class="container containerheight mt-2 pt-4 d-flex justify-content-center">
        <div class="card mt-5 shadow bg-white rounded">
          <div class="card-header">
            <div class="text-center social_icon">
              <span>
                <img src="public/images/logo circular.png" width="80" height="80" >
              </span>
            </div>
            <h3 class="fw-bold text-center">Tribunal Administrativo</h3>
          </div>
          <div class="card-body">
            <form id="login_form" method="POST" class="needs-validation frm_login" novalidate>
              <div class="input-group my-4">                
                <span class="input-group-text material-icons md-dark" id="inputGroup-sizing-default">perm_identity</span>
                  <input type="email" id="email" name="email" class="form-control" aria-label="Sizing example input" data-toggle="tooltip" data-placement="right" title="Ingresar correo electrónico" placeholder="Correo"  aria-describedby="inputGroup-sizing-default" required>
              </div>
              <div class="input-group">                
                <span class="input-group-text material-icons md-dark span-icon" id="inputGroup-sizing-default">vpn_key</span>
                  <input type="password" id="password" name="password" class="form-control" aria-label="Sizing example input" data-toggle="tooltip" data-placement="right" title="Ingresar Contraseña"  placeholder="Contraseña" aria-describedby="inputGroup-sizing-default" required>
              </div>
              <div class="mb-4"> 
                <input type="checkbox" id="showPassword"> Mostrar contraseña
              </div>
              <div class="d-grid mb-4">
                <input type="hidden" name="enviar" class="form-control" value="si">
                <button type="submit" class="btn btn-primary" title="Iniciar Sesión" name="iniciar_sesion" value="Iniciar sesión">Iniciar Sesion</button>
                    
              </div>
              <div class="d-flex justify-content-center">
                <a title="Olvidó su contraseña" href="Recuperar-contrasena.php">¿Olvidaste tu contraseña?</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <footer class="text-center bg-dark py-3 ">
      <div class="container text-white">Tribunal Administrativo del Poder Judicial del Estado de Chiapas | Todos los Derechos         Reservados | Blvd. Belisario Domínguez No. 1713, Col. Xamaipak, Tuxtla Gutiérrez, Chiapas.
        <a class="text-white" href="https://www.tachiapas.gob.mx/">www.tachiapas.gob.mx</a>
      </div>
    </footer> 
<script>
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
    var showPasswordCheckbox = document.getElementById("showPassword");
    var passwordInput = document.getElementById("password");

    showPasswordCheckbox.addEventListener("change", function() {
      if (showPasswordCheckbox.checked) {
        passwordInput.type = "text";
      } else {
        passwordInput.type = "password";
      }
    });
  </script>
    <script src="public/vendors/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="index.js"></script>
  </body>
</html>


