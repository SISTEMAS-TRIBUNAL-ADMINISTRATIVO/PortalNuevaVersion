<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
  <div class="modal" id="ModalNotificacion" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title centre" id="Titulo"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="formAgregarFormato" enctype="multipart/form-data">
            <div class="mb-3">
              <label for="nombreFormato" class="form-label">Nombre del formato</label>
              <input type="text" class="form-control" id="nombreFormato" name="nombreFormato" required>
            </div>

            <div class="mb-3">
              <label for="archivoFormato" class="form-label">Seleccionar archivo</label>
              <input type="file" class="form-control" id="archivo_formato" name="archivo_formato" accept=".pdf,.doc,.docx,.xlsx" required>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="submit" form="formAgregarFormato" class="btn btn-primary">Guardar</button>
        </div>
      </div>
    </div>
  </div>
</div>