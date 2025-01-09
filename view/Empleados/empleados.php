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
<h3>Empleados</h3>

<div class="container mt-4">
<table class="table table-striped jambo_table bulk_action" id="tablaempleados">
                <thead class="table-primary">
                  <tr class="headings">
                    <th class="column-title text-center">PLAZA</th>
                    <th class="column-title text-center">ENLACE</th>
                    <th class="column-title text-center">EMPLEADO</th>
                    <th class="column-title text-center">CATEGORIA</th>
                    <th class="column-title text-center">AREA </th>
                   <th class="column-title no-link last text-center"><span class="nobr">Información</span> 
                    </th>
                  </tr>
                    
                    <th class="bulk-actions" colspan="6">
                      <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
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
    <script type="text/javascript" src="../Empleados/empleados.js"></script>
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
