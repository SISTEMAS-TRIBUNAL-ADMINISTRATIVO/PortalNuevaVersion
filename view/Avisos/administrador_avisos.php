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

    <title>ADMINISTRACIÓN DE AVISOS</title>
    <div class="right_col" role="main">
        <h3 class="titulo">ADMINISTRACIÓN DE AVISOS</h3>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        </div>
                
        <!-- Botón para abrir el modal -->
<button type="button" class="btn1 btn-primary" data-bs-toggle="modal" data-bs-target="#miModal">
  Agregar Aviso
</button>

<!-- Modal -->
<div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="miModalLabel">AGREGAR AVISOS</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="addNoticeForm">
          <div class="row">
            <div class="col-md-6">
              <label for="tipo_notificacion">Tipo de notificación:</label>
              <select class="form-control" id="tipo_notificacion">
                <option value="">Seleccione...</option>
                <option value="opcion1">Opción 1</option>
                <option value="opcion2">Opción 2</option>
              </select>
            </div>
            <div class="col-md-6">
              <label for="titulo_notificacion">Título de la notificación:</label>
              <input type="text" class="form-control" id="titulo_notificacion" required>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-6">
              <label for="mensaje_corto">Mensaje Corto:</label>
              <textarea class="form-control" id="mensaje_corto" rows="3"></textarea>
            </div>
            <div class="col-md-6">
              <label for="detalles">Detalles:</label>
              <textarea class="form-control" id="detalles" rows="3"></textarea>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-6">
              <label for="area_notificada">Área que se le notifica:</label>
              <input type="text" class="form-control" id="area_notificada">
            </div>
            <div class="col-md-6">
              <label for="usuario_notificado">Usuario que se notifica:</label>
              <div class="input-group">
                <input type="text" class="form-control" id="usuario_notificado" placeholder="Buscar usuario">
                <button class="btn btn-outline-secondary" type="button">
                  <i class="bi bi-search"></i>
                </button>
              </div>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-6">
              <input type="checkbox" id="programar">
              <label for="programar">Programar</label>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-6">
              <label for="fecha_programada">Fecha Programada:</label>
              <input type="date" class="form-control" id="fecha_programada">
            </div>
            <div class="col-md-6">
              <label for="fecha_vigencia">Fecha Vigencia:</label>
              <input type="date" class="form-control" id="fecha_vigencia">
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-6 text-center">
              <label>Imagen:</label>
              <div class="border p-2">
                <img src="../../public/images/images.png" alt="Vista previa" class="img-fluid">
              </div>
              <button type="button" class="btn btn-outline-success mt-2">Seleccionar</button>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-success">Guardar</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap CSS (Asegúrate de tenerlo si no está en la página) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Icons para la lupa -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">


        


        <div class="col-md-12 col-sm-12">
            <div class="table-responsive">
                <table class="table table-striped jambo_table bulk_action" id="tablanominas">
                    <thead>
                        <tr>
                            <th>tipo de notoficacion</th>
                            <th>titulo de la notificacion</th>
                            <th>fecha de creacion</th>
                            <th>estado</th>
                            <th>vigencia</th>
                            <th>acciones</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>


<!-- Modal -->
<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="fileModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document"> <!-- Use modal-lg for large modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fileModalLabel">Visualizar Archivo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="max-height: 80vh; overflow-y: auto;"> <!-- Set max height with overflow -->
                <pre id="fileViewer" style="display: none; width: 100%; height: 600px; overflow: auto;"></pre>
                <iframe id="pdfViewer" style="display: none; width: 100%; height: 600px;" frameborder="0"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="downloadLink" class="btn btn-primary" data-file="" style="display: none;">Descargar Archivo</button>
            </div>
        </div>
    </div>
</div>




        </div> <!-- Fin de col-md-12 -->
    </div> <!-- Fin de right_col -->

    <!-- /page content -->
<?php
    require_once("../Footer/footer.php");
    require_once("../Footer/footer_script.php");
    require_once("../Footer/footerDataTable.php");
?>
<script type="text/javascript" src="../Nomina/nomina.js"></script>
    </body>
</html>
<?php
} else {
    $conexion = new Conectar();
    header("Location:" . $conexion->ruta() . "index.php");
}
?>

<style>
    .btn1{
        background-color:rgb(52, 129, 52); /* Verde claro */
        color: #fff; /* Texto blanco */
        border: 2px solid #000; /* Borde negro */
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    th{
        background-color: rgb(23, 85, 136) ;
    }

    .titulo{
        background-color: rgb(156, 155, 155);
  color: black;
  text-align: center; /* Centra el texto */
  display: flex;
  justify-content: center; /* Centra horizontalmente */
  align-items: center; /* Centra verticalmente */
  padding: 10px;
  width: 100%; /* Asegura que ocupe todo el ancho */
    }
</style>

