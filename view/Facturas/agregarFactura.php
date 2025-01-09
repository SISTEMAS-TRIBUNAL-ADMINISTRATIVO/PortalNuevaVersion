<?php 
session_start();
require_once("../../config/conexion.php");
if (isset($_SESSION["Enlace"])) 
{
require_once("../Head/head_meta.php");
?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<title>Agregar Factura</title>
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
                <h2>Agregar Factura</h2>
                <form id="datosLaboralForm">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="proveedor">Proveedor</label>
                            <input type="text" class="form-control" id="proveedor" placeholder="Buscar Proveedor">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="folio">Folio</label>
                            <input type="text" class="form-control" id="folio" placeholder="Folio">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="folioFiscal">Folio Fiscal</label>
                            <input type="text" class="form-control" id="folioFiscal" placeholder="Folio Fiscal">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="fechaEmision">Fecha de Emisión</label>
                            <input type="date" class="form-control" id="fechaEmision">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="montoTotal">Monto Total</label>
                            <input type="text" class="form-control" id="montoTotal" placeholder="Monto Total">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="usoCFDI">Uso CFDI</label>
                            <input type="text" class="form-control" id="usoCFDI" placeholder="Uso CFDI">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="archivo">Archivo</label>
                        <div class="border p-3 bg-light">
                            <input type="file" class="form-control-file" id="archivo">
                            <div id="archivoPreview" class="mt-2"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="observaciones">Observaciones</label>
                        <textarea class="form-control" id="observaciones" rows="3" placeholder="Observaciones"></textarea>
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
                        // Vista previa para imágenes
                        previewHtml = '<img src="' + e.target.result + '" class="img-fluid" alt="' + fileName + '" style="max-width: 100%; height: auto;">';
                    } else if (fileType === 'application/pdf') {
                        // Vista previa para PDFs
                        previewHtml = '<iframe src="' + e.target.result + '" style="width:100%; height:500px;" frameborder="0"></iframe>';
                    } else if (fileType.startsWith('text/')) {
                        // Vista previa para archivos de texto
                        previewHtml = '<iframe src="' + e.target.result + '" style="width:100%; height:500px;" frameborder="0"></iframe>';
                    } else {
                        // Para otros tipos de archivos
                        previewHtml = '<p>Archivo: ' + fileName + '</p>';
                    }
                    $('#archivoPreview').html(previewHtml);
                }
                reader.readAsDataURL(file);
            }
        });
    });
</script>

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