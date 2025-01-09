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


<div class="right_col" role="main">
<h3>Bienes Informaticos a su resguardo</h3>

  <form class="row g-3">
    <button type="submit" class="btn btn-link" title="Agregar" name="Agregar" value="">
      <i class="fa fa-plus"></i> Agregar
    </button>
    <button type="submit" class="btn btn-link" title="Ubicacion" name="Ubicacion" value="">
      <i class="fa fa-user"></i> Asignar Resguardante
    </button>
    <button type="submit" class="btn btn-link" title="Carta Responsiva" name="Carta Responsiva" value="">
      <i class="fa fa-map-marker"></i> Bienes informaticos por areas
    </button>
    <button type="submit" class="btn btn-link" title="Propiedad del Servidor" name="Propiedad del Servidor" value="">
      <i class="fa fa-exclamation-triangle"></i> Dar de Baja Funcional
    </button>
  </form>


<div class="container mt-4">
<table class="table table-striped jambo_table bulk_action" id="bienesinformaticos">
                <thead class="table-primary">
                  <tr class="headings">
                  <th class="column-title text-center">ID</th>
                    <th class="column-title text-center">Descripcion</th>
                    <th class="column-title text-center">Marca</th>
                    <th class="column-title text-center">Modelo</th>
                    <th class="column-title text-center">Serie</th>
                    <th class="column-title text-center">Inventario </th>
                    <th class="column-title text-center">Origen del Equipo </th>
                    <th class="column-title text-center">Factura </th>
                    <th class="column-title text-center">Fecha de Adquisicion </th>
                    <th class="column-title text-center">Costo Original </th>
                    <th class="column-title text-center">Disponibilidad</th>
                   <th class="column-title no-link last text-center"><span class="nobr">Ver</span> </th>           
                  </tr>
                    
                    <th class="bulk-actions" colspan="12">
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
    <script type="text/javascript" src="../Informatic/BienesInformaticos.js"></script>
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
