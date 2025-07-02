<header class="d-flex justify-content-between align-items-center px-4 py-3 bg-white shadow-sm rounded">
  <!-- Contenido a la izquierda: logo, título, etc. -->
  <div>
    <h5 class="mb-0 text-dark"><strong>Tribunal de Justicia Administrativa del Estado de Chiapas</strong></h5>
  </div>

  <!-- Bloque de usuario al lado derecho -->
  <div class="d-flex align-items-center gap-3">
    <img src="<?php echo $_SESSION['fotoBase64']; ?>" alt="Foto de usuario"
         style="width: 70px; height: 70px; border-radius: 50%; object-fit: cover; border: 2px solid #c41c64;" />
    
    <div>
      <div class="dropdown">
        <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="perfilDropdown" data-bs-toggle="dropdown" aria-expanded="false">
          <h6 class="mb-0" style="color:#061e3c;">
            <strong><?php echo $_SESSION['nombre'] . " " . $_SESSION['paterno'] . " " . $_SESSION['materno']; ?></strong>
          </h6>
        </a>
        <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="perfilDropdown">
          <li><a class="dropdown-item" href="../MiPerfil/miperfil.php"><i class="bi bi-person-circle me-2"></i>Mi Perfil</a></li>
          <li><a class="dropdown-item" href="../Configuracion/configuracion.php"><i class="bi bi-gear me-2"></i>Configuración</a></li>
          <li><a class="dropdown-item" href="../CambioContrasena/cambiar.php"><i class="bi bi-key me-2"></i>Cambiar Contraseña</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item text-danger" href="#" id="btnCerrarSesion"><i class="bi bi-box-arrow-right me-2"></i>Cerrar Sesión</a></li>
        </ul>
      </div>
      <?php echo $_SESSION['email'] ?>
      <br>
      <?php echo $_SESSION['CURP'] ?>
    </div>
  </div>
</header>


<nav class="navbar navbar-expand-lg shadow-sm" style="background-color: #0b2c5e;">
  <div class="container-fluid px-4">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuPrincipal" aria-controls="menuPrincipal" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse ms-3" id="menuPrincipal">
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-white" href="../Dashboard_Inicial/dashboard.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="../FormatosAreaInformatic/FormatosInfoUsuario.php">Formatos</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" id="resguardosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Resguardos
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/view/Resguardo/resguardo_informatica.php">Materiales</a></li>
            <li><a class="dropdown-item" href="../Resguardo/resguardo_informatica.php">Informática</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="../Notificaciones/notificaciones.php">Avisos</a>
        </li>
        <?php if ($_SESSION["id_rol"] == "3") { ?>
          <li class="nav-item">
            <a class="nav-link text-white" href="../Usuario/todos_los_usuarios.php">Usuarios</a>
          </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</nav>
