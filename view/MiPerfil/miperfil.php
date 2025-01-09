<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Mi perfil</title>
    <?php
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

    <div class="right_col" role="main">

    <h3>Datos Personales</h3>

  <form id="formNewPassword" method="POST">
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationDefault01">Nombre</label>
      <input type="text" class="form-control" id="Nombre" placeholder="First name" value="" required disabled>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationDefault02">Apellido paterno</label>
      <input type="text" class="form-control" id="Paterno" placeholder="Last name" value="" required disabled>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationDefault05">Apellido Materno</label>
      <input type="text" class="form-control" id="Materno" placeholder="" required disabled>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationDefault03">Domicilio</label>
      <input type="text" class="form-control" id="Domicilo" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationDefault04">C.P.(Codigo Postal Sat)</label>
      <input type="text" class="form-control" id="CP_SAT" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationDefault05">Estado Civil</label>
      <input type="text" class="form-control" id="Estado_civil" placeholder="" required disabled>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationDefault05">Curp</label>
      <input type="text" class="form-control" id="CURP" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationDefault05">RFC</label>
      <input type="text" class="form-control" id="RFC" placeholder="" required disabled>
    </div>
    <div class="col-md-2 mb-3">
      <label for="validationDefault05">Tipo de sangre </label>
      <input type="text" class="form-control" id="Tipo_de_sangre" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationDefault05">Teléfono</label>
      <input type="text" class="form-control" id="Telefono" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationDefault05">Correo</label>
      <input type="text" class="form-control" id="Correo" placeholder="" required disabled>
    </div>
    <div class="col-md-3 mb-3 ">
      <label for="validationDefault04">C.P.(Codigo Postal)</label>
      <input type="text" class="form-control" id="CP" placeholder="" required disabled>
    </div>
    <div class="col-md-12 mb-6 ">
    </div>
  <div class="form-group">


  <div class="container mt-5">
    <h3 class="mb-4 text-center">Cambiar Contraseña</h3>
    <div class="row g-3">
        <!-- Campo para Nueva Contraseña -->
        <div class="col-md-6">
            <label for="nuevaContraseña" class="form-label">Nueva Contraseña</label>
            <input type="password" class="form-control form-control-lg" id="NewPassword" name="NewPassword" placeholder="" required>
        </div>

        <!-- Campo para Confirmar Contraseña -->
        <div class="col-md-6">
            <label for="confirmarContraseña" class="form-label">Confirmar Contraseña</label>
            <input type="password" class="form-control form-control-lg" id="confirmarpassword" name="confirmarpassword" placeholder="" required>
        </div>
    </div>

    <div class="mt-4 text-center">
        <button type="submit" id="savePassword" class="btn btn-lg btn-primary">Confirmar</button>
    </div>
</div>

<!-- CSS personalizado -->
<style>
    /* Resaltar el borde del campo cuando está en foco */
    .form-control:focus {
        border-color: #007bff;  /* Azul claro de Bootstrap */
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);  /* Sombra sutil */
    }
</style>

    </form>
    </div>
   </div>
  </div>

  </div>
 
     
    </div>
  </div>


  <?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
?>
       <script type="text/javascript" src="../MiPerfil/miperfil.js"></script>
    </body>
</html>
<?php

      
}else {
  $conexion = new Conectar();
  header("Location:" . $conexion->ruta() . "index.php");
}
?>
