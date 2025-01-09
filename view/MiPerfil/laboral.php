<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Datos Laboral</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

<!-- page content -->
<div class="right_col" role="main">
<h3>Datos Laborales</h3>
  <!-- FORM 2-->
  <form class="row g-3">
  <div class="col-md-6  mb-3">
      <label for="validationServer02" class="form-label">CATEGORÍA</label>
      <input type="text" class="form-control" id="categoria" value="AUXILIAR ADMINISTRATIVO" readonly>
      <div class="valid-feedback"></div>
</div>
    <div class="col-md-3  mb-3">
      <label for="validationServer03" class="form-label">PREFIJO</label>
      <input type="text" class="form-control" id="prefijo" aria-describedby="validationServer03Feedback" value="" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
    <div class="col-md-3">
      <label for="validationServer01" class="form-label">FECHA DE ALTA</label>
      <input type="text" class="form-control" id="fecha_de_alta" value="03/09/2024" readonly>
      <div class="valid-feedback"></div>
    </div>
  </form>
  <!-- FORM 2-->
  <form class="row g-3">
    <div class="col-md-3">
      <label for="validationServer01" class="form-label">NÚMERO DE ENLACE</label>
      <input type="text" class="form-control" id="numero_de_enlace" value="51" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-3">
      <label for="validationServer02" class="form-label">NÚMERO DE PLAZA</label>
      <input type="text" class="form-control" id="numero_de_plaza" value="150" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-6">
      <label for="validationServer02" class="form-label">CATEGORÍA</label>
      <input type="text" class="form-control" id="categoria" value="AUXILIAR ADMINISTRATIVO" readonly>
      <div class="valid-feedback"></div>
    </div>
  </form>

  <!-- FORM 2-->
  <form class="row g-3 ">
    <div class="col-md-4">
      <label for="validationServer01" class="form-label">BANCO</label>
      <input type="text" class="form-control" id="banco" value="HSBC" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-4">
      <label for="validationServer03" class="form-label">NÚMERO DE CUENTA BANCARIA</label>
      <input type="text" class="form-control" id="numero_de_cuenta_bancaria" aria-describedby="validationServer03Feedback" value="6422375981" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
    <div class="col-md-4">
      <label for="validationServer03" class="form-label">CLABE INTERBANCARIA</label>
      <input type="text" class="form-control" id="clabe_interbancaria" aria-describedby="validationServer03Feedback" value="87282923452043284" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
  </form>

  <!-- FORM 3-->
  <form class="row g-3">
    <div class="col-md-4">
      <label for="validationServer01" class="form-label">FECHA DE ALTA SEGURO SOCIAL</label>
      <input type="text" class="form-control" id="fecha_de_alta_del_seguro_social" value="51" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-4">
      <label for="validationServer03" class="form-label">NÚMERO DE SEGURO SOCIAL</label>
      <input type="text" class="form-control" id="numero_de_seguro_social" aria-describedby="validationServer03Feedback" value="6422375981" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
  </form>

  <!-- Tabla -->
  <div class="table-responsive mt-4">
    <table id="tableescolaridad" class="table table-striped">
      <thead>
        <tr>
          <th>ESCOLARIDAD</th>
          <th>PROFESION</th>
          <th>DOCUMENTO</th>
          <th>AÑO</th>
        </tr>
      </thead>
      <tbody>

      </tbody>
    </table>
  </div>
</div>
    <!-- /page content -->
<?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
      require_once("../Footer/footerDataTable.php");
?>
    <script type="text/javascript" src="../MiPerfil/laboral.js"></script>
    </body>
</html>
<?php

      
}else {
  $conexion = new Conectar();
  header("Location:" . $conexion->ruta() . "index.php");
}
?>



