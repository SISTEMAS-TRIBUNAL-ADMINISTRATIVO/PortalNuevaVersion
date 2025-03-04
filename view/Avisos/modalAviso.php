<!-- Bootstrap CSS (Asegúrate de tenerlo si no está en la página) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Icons para la lupa -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">



<div class="modal fade" id="ModalAgregarAviso" name="ModalAgregarAviso" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
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
              <select class="form-control" id="tipo_notificacion"  name="tipo_notificacion" >
                      
                    
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
              <img id="preview-image" src="../../public/images/images.png" alt="Vista previa" class="img-fluid">
            </div>
            <input type="file" id="file-input" class="form-control mt-2" accept="image/*" onchange="loadImage(event)" style="display:none;">
            <button type="button" class="btn btn-success mt-2" onclick="document.getElementById('file-input').click();">
              Seleccionar Imagen
            </button>
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

