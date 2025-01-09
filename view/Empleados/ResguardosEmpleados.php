<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Detalles Empleado</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>


<div class="right_col" role="main">
  <h3>Detalles Empleado</h3>

  <!-- page content -->
  <form class="row g-3">
    <div class="col-md-4 mb-3">
      <label for="nombre" class="form-label">Nombre</label>
      <input type="text" class="form-control" id="nombre" value="" readonly>
      <div class="valid-feedback"></div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="ubicacion" class="form-label">Ubicacion</label>
      <input type="text" class="form-control" id="ubicacion" aria-describedby="validationServer03Feedback" value="" readonly>
      <div id="validationServer03Feedback" class="invalid-feedback"></div>
    </div>
  </form>

  <form class="row g-3">
    <button type="submit" class="btn btn-link" title="Agregar" name="Agregar" value="">
      <i class="fa fa-plus"></i> Agregar
    </button>
    <button type="submit" class="btn btn-link" title="Ubicacion" name="Ubicacion" value="">
      <i class="fa fa-map"></i> Ubicacion
    </button>
    <button type="submit" class="btn btn-link" title="Carta Responsiva" name="Carta Responsiva" value="">
      <i class="fa fa-file"></i> Carta Responsiva
    </button>
    <button type="submit" class="btn btn-link" title="Propiedad del Servidor" name="Propiedad del Servidor" value="">
      <i class="fa fa-server"></i> Propiedad del Servidor
    </button>
    <button type="button" class="btn btn-link" data-toggle="modal" title="SubirResguardo" name="SubirResguardo" data-bs-toggle="modal" data-target="#uploadModal">
      <i class="fa fa-upload"></i> Subir Resguardo
    </button>

    <button type="button" class="btn btn-primary" id="generatePdfButton">
          <i class="fa fa-download"></i> Generar PDF
      </button>
  </form>

  <h3>Bienes Informaticos a su resguardo</h3>

  <div class="container mt-4">
    <table class="table table-striped jambo_table bulk_action" id="resguardosempleados">
      <thead class="table-primary">
        <tr class="headings">
          <th class="column-title text-center">Descripcion</th>
          <th class="column-title text-center">Marca</th>
          <th class="column-title text-center">Modelo</th>
          <th class="column-title text-center">Serie</th>
          <th class="column-title text-center">Inventario</th>
          <th class="column-title text-center">Observaciones</th>
          <th class="column-title text-center">Alta</th>
          <th class="column-title text-center">Origen del Equipo</th>
          <th class="column-title no-link last text-center">
            <span class="nobr">Modificar</span>
          </th>
        </tr>
        <tr>
          <th class="bulk-actions" colspan="9">
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

</div>


 <!-- Modal -->
 <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="uploadModalLabel">Subir Documento</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <!-- Formulario para subir archivo -->
          <form id="uploadForm" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
              <label for="documentFile" class="form-label">Seleccionar Documento</label>
              <input type="file" class="form-control" id="documentFile" name="documentFile" accept=".pdf, .doc, .docx, .jpg, .jpeg, .png" required>
            </div>
            <div class="mb-3">
              <label for="documentDescription" class="form-label">Descripción</label>
              <input type="text" class="form-control" id="documentDescription" name="documentDescription" placeholder="Descripción del documento" required>
            </div>
            <button type="submit" class="btn btn-primary" id="uploadBtn">Subir</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
      event.preventDefault(); // Evitar que el formulario se envíe de forma tradicional

      var formData = new FormData(this); // Crear objeto FormData para enviar datos
      var uploadBtn = document.getElementById('uploadBtn');
      uploadBtn.disabled = true; // Deshabilitar el botón de subir mientras se procesa

      // Puedes agregar un spinner o mensaje de carga aquí si lo deseas

      // Realizar la solicitud AJAX para subir el archivo
      fetch('upload_document.php', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert('¡Documento subido con éxito!');
          // Aquí puedes hacer algo después de una carga exitosa, como cerrar el modal
          var modal = new bootstrap.Modal(document.getElementById('uploadModal'));
          modal.hide(); // Cerrar el modal
        } else {
          alert('Hubo un error al subir el documento.');
        }
        uploadBtn.disabled = false; // Volver a habilitar el botón
      })
      .catch(error => {
        console.error('Error al subir el documento:', error);
        alert('Ocurrió un error. Inténtalo nuevamente.');
        uploadBtn.disabled = false;
      });
    });
  </script>



    <?php
      require_once("../Footer/footer.php");
      require_once("../Footer/footer_script.php");
      require_once("../Footer/footerDataTable.php");
    ?>
        <script type="text/javascript" src="../Empleados/ResguardosEmpleados.js"></script>
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
