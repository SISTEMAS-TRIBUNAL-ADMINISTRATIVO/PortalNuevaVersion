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
        <button type="button" class="btn1" onclick="window.location.href='agregar_notificacion.php';">Agregar Aviso</button>
        </div>


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