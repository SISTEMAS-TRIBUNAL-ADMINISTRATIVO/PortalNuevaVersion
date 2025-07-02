<div class="modal fade" id="modalDescarga" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl"> <!-- Más ancho -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmar descarga</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <!-- Vista previa del archivo -->
          <iframe id="previewFrame" style="width: 100%; height: 500px; border: 1px solid #ccc;"></iframe>
        </div>
        <p>Estás a punto de descargar el archivo: <strong id="modalNombreArchivo"></strong></p>
        <p>¿Deseas continuar?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <a id="btnDescargarArchivo" class="btn btn-primary" download target="_blank">Descargar</a>
      </div>
    </div>
  </div>
</div>
