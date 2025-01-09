    <?php 
    session_start();
    require_once("../../config/conexion.php");

    if (isset($_SESSION["Enlace"])) 
    {
        require_once("../Head/head_meta.php");
    ?>
        <title>Formatos Informatica</title>
        <?php
            require_once("../Head/head_link_datatable.php");
            require_once("../Head/head_link.php");
            require_once("../Menu/MenuPrincipal.php");
        ?>


    <div class="right_col" role="main">


    <h3>Formatos del area de informatica</h3>


    <div class="container mt-4">
            <?php if ($_SESSION["rol"] === "Administrador del Portalta") : ?>
                <div class="mt-3">
                    <button id="addCourseBtn" class="btn btn-success" data-toggle="modal" data-target="#addFormatosModal">Agregar Formato</button>
                    <!-- <button id="editCourseBtn" class="btn btn-warning" data-toggle="modal" data-target="#editFormatosModal">Editar Formato</button> -->
                    <button id="deleteCourseBtn" class="btn btn-danger" data-toggle="modal" data-target="#deleteFormatosModal">Eliminar Formato</button>
                </div>
            <?php endif; ?>
        <table class="table table-striped jambo_table bulk_action" id="Formatos_informatica">
        <thead class="table-primary">
            <tr class="headings">
            <th class="column-title text-center">ID</th>
            <th class="column-title text-center">Fecha de alta</th>
            <th class="column-title text-center">Nombre del formato</th>
            <th class="column-title text-center">Descargar</th>
            </tr>
            <tr>
            <th class="bulk-actions" colspan="5">
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

    <!-- Modal para agregar formato -->
<div class="modal fade" id="addFormatosModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCourseModalLabel">Agregar un nuevo formato</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addFormatosForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="fecha_formato">Fecha</label>
                        <input type="date" class="form-control"  id="fecha_formato" name="fecha_formato" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre del formato</label>
                        <input type="text" class="form-control" id = "nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="archivo_formato">Formato</label>
                        <input type="file" class="form-control-file" id="archivo_formato" accept=".doc,.docx,.xls,.xlsx" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="saveFormat">Guardar Formato</button>
            </div>
        </div>
    </div>
</div>




<!-- Modal para editar curso -->
        <div class="modal fade" id="editFormatosModal" tabindex="-1" role="dialog" aria-labelledby="editCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCourseModalLabel">Editar informacion del formato</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editCourseForm">
                    <input type="hidden" id="edit_id_curso">
                    <div class="form-group">
                        <label for="edit_fecha_curso">Fecha</label>
                        <input type="date" class="form-control" id="edit_fecha_formato" required>
                    </div>
                    <div class="form-group">
                        <label for="edit_ponente_curso">Nombre del formato</label>
                        <input type="text" class="form-control" id="edit_nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="old">Archivo Actual</label>
                        <input type="text" id="old" class="form-control" value="nombre_del_archivo_actual" readonly>
                    </div>
                    <div class="form-group">
                        <label for="new_pdf">Seleccionar nuevo archivo (max 5M):</label>
                        <input type="file" id="new_pdf" class="form-control" accept=".doc,.docx,.xls,.xlsx">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="updateCourse">Actualizar Formato</button>
            </div>
        </div>
    </div>
</div>



        <!-- Modal para eliminar curso -->
        <div class="modal fade" id="deleteFormatosModal" tabindex="-1" role="dialog" aria-labelledby="deleteCourseModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteCourseModalLabel">Eliminar Formato</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>¿Está seguro de que desea eliminar este formato?</p>
                        <input type="hidden" id="delete_id_curso">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteForm">Eliminar Formato</button>
                    </div>
                </div>
            </div>
        </div>



    </div>



        <?php
        require_once("../Footer/footer.php");
        require_once("../Footer/footer_script.php");
        require_once("../Footer/footerDataTable.php");
        ?>
            <script type="text/javascript" src="../FormatosAreaInformatic/FormatosInfoUsuario.js"></script>
            </body>
        </html>
        <?php

          
    }else {
      $conexion = new Conectar();
      header("Location:" . $conexion->ruta() . "index.php");
    }
    ?>
