<?php 
session_start();
require_once("../../config/conexion.php");

if (isset($_SESSION["Enlace"])) {
    require_once("../Head/head_meta.php");
?>
    <title>Cursos</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

    <div class="right_col" role="main">
        <h3>Cursos</h3>

        <div class="container mt-4">
            <?php if ($_SESSION["rol"] === "Administrador del Portalta") : ?>
                <div class="mt-3">
                    <button id="addCourseBtn" class="btn btn-success" data-toggle="modal" data-target="#addCourseModal">Agregar Curso</button>
                    <button id="editCourseBtn" class="btn btn-warning" data-toggle="modal" data-target="#editCourseModal">Editar Curso</button>
                    <button id="deleteCourseBtn" class="btn btn-danger" data-toggle="modal" data-target="#deleteCourseModal">Eliminar Curso</button>
                </div>
            <?php endif; ?>
            <table class="table table-striped jambo_table bulk_action" id="tablaCursos">
                <thead class="table-primary">
                    <tr class="headings">
                    <th class="column-title text-center">ID</th>
                        <th class="column-title text-center">Fecha</th>
                        <th class="column-title text-center">Tema</th>
                        <th class="column-title text-center">Ponente</th>
                        <th class="column-title text-center">Conferencia</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Content here -->
                </tbody>
            </table>

        </div>

        <!-- Modal Archivo -->
                <div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="fileModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="fileModalLabel">Visualización de Archivo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="max-height: 80vh; overflow-y: auto;">
                        <iframe id="pdfViewer" style="display: none; width: 100%; height: 600px;" frameborder="0"></iframe>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button id="DescargarPDF" class="btn btn-primary" data-file="" style="display: none;">Descargar Archivo</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para agregar curso -->
        <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCourseModalLabel">Agregar Curso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addCourseForm">
                            <div class="form-group">
                                <label for="fecha_curso">Fecha</label>
                                <input type="date" class="form-control" id="fecha_curso" required>
                            </div>
                            <div class="form-group">
                                <label for="tema_curso">Tema</label>
                                <input type="text" class="form-control" id="tema_curso" required>
                            </div>
                            <div class="form-group">
                                <label for="ponente_curso">Ponente</label>
                                <input type="text" class="form-control" id="ponente_curso" required>
                            </div>
                            <div class="form-group">
                                <label for="pdfDisplay">Archivo</label>
                                <iframe id="pdfDisplay" style="width:100%; height:500px; display:none;" frameborder="0"></iframe>
                                <br>
                                <br>
                                <input type="file" class="form-control-file"id="archivo_curso">
                            </div>
                            <div class="form-group">
                                <label for="descripcion_curso">Descripción</label>
                                <textarea class="form-control" id="descripcion_curso" rows="3" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="saveCourse">Guardar Curso</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editCourseModal" tabindex="-1" role="dialog" aria-labelledby="editCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCourseModalLabel">Editar Curso</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editCourseForm">
                    <input type="hidden" id="edit_id_curso">
                    <div class="form-group">
                        <label for="edit_fecha_curso">Fecha</label>
                        <input type="date" class="form-control" id="edit_fecha_curso" required>
                    </div>
                    <div class="form-group">
                        <label for="edit_tema_curso">Tema</label>
                        <input type="text" class="form-control" id="edit_tema_curso" required>
                    </div>
                    <div class="form-group">
                        <label for="edit_ponente_curso">Ponente</label>
                        <input type="text" class="form-control" id="edit_ponente_curso" required>
                    </div>
                    <div class="form-group">
                        <label>PDF Actual:</label>
                        <iframe id="pdfViewerC" style="display: none; width: 100%; height: 400px;" frameborder="0"></iframe>
                        <p id="pdfMessage" style="display: none;">No hay PDF disponible.</p>
                    </div>
                    <div class="form-group">
                        <label for="new_pdf">Seleccionar nuevo PDF (max 5M):</label>
                        <input type="file" id="new_pdf" class="form-control" accept="application/pdf">
                    </div>
                    <div class="form-group">
                        <label for="edit_descripcion_curso">Descripción</label>
                        <textarea class="form-control" id="edit_descripcion_curso" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="updateCourse">Actualizar Curso</button>
            </div>
        </div>
    </div>
</div>



        <!-- Modal para eliminar curso -->
        <div class="modal fade" id="deleteCourseModal" tabindex="-1" role="dialog" aria-labelledby="deleteCourseModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteCourseModalLabel">Eliminar Curso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>¿Está seguro de que desea eliminar este curso?</p>
                        <input type="hidden" id="delete_id_curso">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" id="confirmDelete">Eliminar Curso</button>
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
    <script type="text/javascript" src="../Cursos/CursosUsu.js"></script>
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