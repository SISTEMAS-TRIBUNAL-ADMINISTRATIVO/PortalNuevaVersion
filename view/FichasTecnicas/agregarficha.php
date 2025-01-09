<?php 
session_start();
require_once("../../config/conexion.php");
if (isset($_SESSION["Enlace"])) 
{
require_once("../Head/head_meta.php");
?>
<title>EditarFactura</title>
<?php
require_once("../Head/head_link_datatable.php");
require_once("../Head/head_link.php");
require_once("../Menu/MenuPrincipal.php");
?>

<div class="right_col" role="main">
    <div class="container mt-4">
        <!-- Agregar Factura -->
        <div class="row mb-4">
            <div class="col-md-12">
                <h2>Detalles Facturas</h2>

                <div class="col-md-4 d-flex justify-content-center align-items-center">
                <div class="border rounded p-2 d-none d-md-block">
                    <img src="https://static.vecteezy.com/system/resources/previews/000/648/395/original/vector-computer-icon-symbol-sign.jpg" alt="Imagen de Resguardo" class="img-fluid rounded">
                </div>
            </div>
                <form id="datosLaboralForm">
                    <!-- Formulario -->
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label for="proveedor">Descripción</label>
                            <div class="input-group">
                                <select class="form-control" id="proveedor" style="width: 100%;">
                                    <option value="1">Falla técnica</option>
                                    <option value="2">Mantenimiento</option>
                                    <option value="3">Cambio de pieza</option>
                                </select>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        
                        <div class="form-group col-md-10">
                            <label for="folio">Marca</label>
                            <input type="text" class="form-control" id="folio" placeholder="Marca">
                        </div>
                        <div class="form-group col-md-10">
                            <label for="folioFiscal">Modelo</label>
                            <input type="text" class="form-control" id="folioFiscal" placeholder="Modelo">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label for="fechaEmision">Serie</label>
                            <input type="text" class="form-control" id="fechaEmision">
                        </div>
                        
                        <div class="form-group col-md-10">
                            <label for="montoTotal">Inventario</label>
                            <input type="text" class="form-control" id="montoTotal" placeholder="Inventario">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="usoCFDI">Área Requeriente</label>
                        <input type="text" class="form-control" id="usoCFDI" placeholder="Área Requeriente">
                    </div>

                    <div class="form-group">
                        <label for="resguardante">Resguardante</label>
                        <input type="text" class="form-control" id="resguardante" placeholder="Resguardante">
                    </div>

                    <div class="form-group">
                        <label for="trabajoRealizado">Trabajo Realizado</label>
                        <textarea class="form-control" id="trabajoRealizado" rows="3" placeholder="Trabajo Realizado"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="diagnostico">Diagnóstico</label>
                        <textarea class="form-control" id="diagnostico" rows="3" placeholder="Diagnóstico"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="recomendaciones">Recomendaciones</label>
                        <textarea class="form-control" id="recomendaciones" rows="3" placeholder="Recomendaciones"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="comentarios">Comentarios</label>
                        <textarea class="form-control" id="comentarios" rows="3" placeholder="Comentarios"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="archivo">Archivo</label>
                        <div class="border p-3 bg-light">
                            <input type="file" class="form-control-file" id="archivo">
                            <div id="archivoPreview" class="mt-2"></div>
                        </div>
                    </div>
                    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts necesarios -->
<script>
    $(document).ready(function() {
        // Manejador de eventos para la carga de archivos
        $('#archivo').on('change', function() {
            var file = $(this)[0].files[0];
            if (file) {
                var fileType = file.type;
                var fileName = file.name;
                var reader = new FileReader();
                
                reader.onload = function(e) {
                    var previewHtml = '';
                    if (fileType.startsWith('image/')) {
                        previewHtml = '<img src="' + e.target.result + '" class="img-fluid" alt="' + fileName + '" style="max-width: 100%; height: auto;">';
                    } else if (fileType === 'application/pdf') {
                        previewHtml = '<iframe src="' + e.target.result + '" style="width:100%; height:500px;" frameborder="0"></iframe>';
                    } else if (fileType.startsWith('text/')) {
                        previewHtml = '<iframe src="' + e.target.result + '" style="width:100%; height:500px;" frameborder="0"></iframe>';
                    } else {
                        previewHtml = '<p>Archivo: ' + fileName + '</p>';
                    }
                    $('#archivoPreview').html(previewHtml);
                }
                reader.readAsDataURL(file);
            }
        });

        // Inicializar Select2 en el campo de selección
        $('#proveedor').select2({
            placeholder: 'Buscar Proveedor',
            allowClear: true,
        });
    });
</script>

<style>
    .fixed-size-image {
        width: 300px; /* Ajusta el ancho según sea necesario */
        height: 300px; /* Ajusta la altura según sea necesario */
        object-fit: cover; /* Mantiene la imagen dentro del contenedor sin distorsionar */
    }
    .fixed-image-container {
        position:static;
        top: 10px; /* Ajusta la distancia desde la parte superior */
        right: 10px; /* Ajusta la distancia desde el lado derecho */
        z-index: 1000; /* Asegura que la imagen esté sobre otros elementos */
    }

    
</style>

<?php
require_once("../Footer/footer.php");
require_once("../Footer/footer_script.php");
require_once("../Footer/footerDataTable.php");
?>
<?php
} else {
  $conexion = new Conectar();
  session_unset(); // Elimina todas las variables de sesión
  session_destroy(); // Destruye la sesión completamente
  header("Location: " . $conexion->ruta() . "index.php"); // Redirige al inicio
  exit();
}
?>