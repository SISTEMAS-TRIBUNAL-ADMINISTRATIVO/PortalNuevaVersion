<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Empleados</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

<!-- page content -->
<div class="right_col" role="main">
<h3>Panel Factura</h3>
  <!-- Botones Agregar y Editar -->
  <div class="mb-3">
        <button class="btn btn-primary btn-icon">
            <i class="bi bi-plus"></i> Agregar
        </button>
        <button class="btn btn-secondary btn-icon">
            <i class="bi bi-book"></i> Catalogos
        </button>
    </div>
<div class="container mt-4">
<table class="table table-striped jambo_table bulk_action" id="tablaFacturas">
                <thead class="table-primary">
                  <tr class="headings">
                    <th class="column-title text-center">Fecha</th>
                    <th class="column-title text-center">Folio</th>
                    <th class="column-title text-center">Folio Fiscal</th>
                    <th class="column-title text-center">Proveedor</th>
                    <th class="column-title text-center">Uso CFDI </th>
                    <th class="column-title text-center">Observaciones</th>
                    <th class="column-title text-center">Acciones</th>
                    </th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
            </div>
    
          </div>
        </div>
      </div>

  <!-- Tabla -->

</div>
    <!-- /page content -->
<?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
      require_once("../Footer/footerDataTable.php");
?>
    <script type="text/javascript" src="../Facturas/facturas.js"></script>
    </body>
</html>
<?php

} else {
  $conexion = new Conectar();
  session_unset(); // Elimina todas las variables de sesión
  session_destroy(); // Destruye la sesión completamente
  header("Location: " . $conexion->ruta() . "index.php"); // Redirige al inicio
  exit();
}
?>
