<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Detalles Empleado</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>


<div class="right_col" role="main">


<h3>Bienes Informaticos a su resguardo</h3>

  <!-- page content -->
  <form class="row g-3">
    <div class="col-md-5 mb-3">
      <label for="nombre" class="form-label">Nombre</label>
      <input type="text" class="form-control" id="NombreCompleto" value="" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-5 mb-3">
      <label for="ubicacion" class="form-label">Correo</label>
      <input type="text" class="form-control" id="Miemail" aria-describedby="validationServer03Feedback" value="" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
  </form>

<div>
    <button> descargar tabla</button>
</div>

  <div class="container mt-4">
    <table class="table table-striped jambo_table bulk_action" id="MisResguardos">
      <thead class="table-primary">
        <tr class="headings">
          <th class="column-title text-center">Descripcion</th>
          <th class="column-title text-center">Marca</th>
          <th class="column-title text-center">Modelo</th>
          <th class="column-title text-center">Serie</th>
          <th class="column-title text-center">Inventario</th>
          <th class="column-title text-center">Alta</th>
          <th class="column-title text-center">Observaciones</th>
          </th>
        </tr>
        <tr>
          <th class="bulk-actions" colspan="9">
            <a class="antoo" style="color:#fff; font-weight:400;">
              Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i>
            </a>
          </th>
        </tr>
      </thead>
      <tbody>
        <!-- Content here -->
      </tbody>
    </table>
  </div>

</div>



    <?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
      require_once("../Footer/footerDataTable.php");
    ?>
        <script type="text/javascript" src="../Resguardo/ResguardosBienesInformaticos.js"></script>
        </body>
    </html>
    <?php

          
    }else {
      $conexion = new Conectar();
      header("Location:" . $conexion->ruta() . "index.php");
    }
    ?>
