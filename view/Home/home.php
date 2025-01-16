<?php 
  session_start();
  header("Cache-Control: no-cache, no-store, must-revalidate"); // HTTP 1.1.
  header("Pragma: no-cache"); // HTTP 1.0.
  header("Expires: 0"); // Expiración inmediata
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    
    require_once("../Head/head_meta.php");
?>
    <title>Inicio</title>
    <?php
      require_once("../Head/head_link.php");
      require_once("../Menu/MenuPrincipal.php");
    ?>
  
    <head>
      <title>Tribunal Administrativo</title>

      <!-- Asegurarnos de que los scripts de Bootstrap estén cargados correctamente -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    



    </head>

    <div class="right_col" role="main">
  <section>
    <!-- Carrusel -->
    <div class="row g-0">
      <div class="col-12 p-0">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <a href="https://tachiapas.gob.mx/capacitaciones/" target="_blank">
                <img src="../../public/images/anuncios/4.jpg" class="d-block w-100" alt="Imagen 1" style="height: 45vh; object-fit: cover;">
              </a>
            </div>
            <div class="carousel-item">
              <a href="https://tachiapas.gob.mx/comite-igualdad/" target="_blank">
                <img src="../../public/images/anuncios/5.jpg" class="d-block w-100" alt="Imagen 2" style="height: 45vh; object-fit: cover;">
              </a>
            </div>
          </div>
          <!-- Botones de navegación -->
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
    </div>
  </section>

  <!-- Contenedor de las cartas -->
    <div class="d-flex align-items-center justify-content-center" style="height: 45vh;">
      <div class="row g-3" id="Contenedor_Notificaciones" name="Contenedor_Notificaciones">
      </div>
    </div>
</div>


  </div>
  
    <?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
    ?>
    
    <script type="text/javascript" src="home.js"></script>

    <?php
    } else {
      $conexion = new Conectar();
      session_unset(); // Elimina todas las variables de sesión
      session_destroy(); // Destruye la sesión completamente
      header("Location: " . $conexion->ruta() . "logout.php"); // Redirige al inicio
      exit();
    }
    
  ?>  

  <style>
    /* Asegurarse de que el carrusel ocupe toda la altura y ancho de la pantalla */
    .carousel-item img {
      height: 100vh; /* Ocupa el 100% de la altura de la ventana */
      object-fit: cover; /* Asegura que la imagen cubra el área sin distorsión */
    }

    /* Para los botones de navegación (flechas) */
    .carousel-control-prev, .carousel-control-next {
      background-color: rgba(0, 0, 0, 0); /* Fondo semi-transparente */
      width: 100px;
      height: 100%;
      border: none;

    }

    .carousel-control-prev:hover, .carousel-control-next:hover {
      background-color: rgba(0, 0, 0, 0.4); /* Fondo más oscuro al pasar el ratón */
    }

    .carousel-control-prev-icon, .carousel-control-next-icon {
      filter: invert(1); /* Cambia los íconos a blancos */
    }
  </style>
