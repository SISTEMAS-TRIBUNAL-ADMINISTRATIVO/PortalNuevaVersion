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

    <title>Nóminas</title>
    <div class="right_col" role="main">
    

        <h3>Nominas</h3>


        <div class="col-md-12 col-sm-12">
            <div class="table-responsive">
                <table class="table table-striped jambo_table bulk_action" id="tablanominas">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Fecha de timbrado</th>
                            <th>Concepto de nómina</th>
                            <th>Mensaje</th>
                            <th>XML</th>
                            <th>PDF</th>
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