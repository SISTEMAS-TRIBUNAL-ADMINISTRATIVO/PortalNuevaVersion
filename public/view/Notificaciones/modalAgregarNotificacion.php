<div class="modal fade" id="modalAgregarNotificacion" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <div class="modal-header bg-secondary text-white">
        <h5 class="modal-title">Agregar Aviso</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>

      <div class="modal-body">
        <form id="formAgregarNotificacion" enctype="multipart/form-data">

          <!-- Imagen -->
          <div class="mb-3">
            <label for="imagenNotificacion" class="form-label">Imagen</label>
            <input type="file" class="form-control" id="imagenNotificacion" name="imagenNotificacion" accept="image/*">
          </div>

          <!-- Tipo de notificación -->
          <div class="mb-3">
            <label for="tipoNotificacion" class="form-label">Tipo de notificación</label>
            <select class="form-select" id="tipoNotificacion" name="tipoNotificacion" required>
            </select>
          </div>

          <!-- Buscar usuario (oculto inicialmente) -->
            <div class="mb-3 d-none" id="campoBuscarUsuario">
            <label for="usuarioNotificacion" class="form-label">Buscar usuario</label>

            <div class="input-group">
                <input type="text" class="form-control" id="usuarioNotificacion" name="usuarioNotificacion" placeholder="Ingrese nombre o correo">
            </div>

            <div id="resultadoBusquedaUsuarios" class="list-group mt-1" style="max-height: 200px; overflow-y: auto;"></div>
            <input type="hidden" id="idUsuarioSeleccionado" name="idUsuarioSeleccionado">
            </div>


          <!-- Select área (oculto inicialmente) -->
          <div class="mb-3 d-none" id="campoAreaNotificacion">
            <label for="areaNotificacion" class="form-label">Área</label>
            <select class="form-select" id="areaNotificacion" name="areaNotificacion">
            </select>
          </div>

          <!-- Título -->
          <div class="mb-3">
            <label for="tituloNotificacion" class="form-label">Título</label>
            <input type="text" class="form-control" id="tituloNotificacion" name="tituloNotificacion" required>
          </div>

          <!-- Mensaje corto -->
          <div class="mb-3">
            <label for="mensajeCorto" class="form-label">Mensaje corto</label>
            <input type="text" class="form-control" id="mensajeCorto" name="mensajeCorto" required>
          </div>

          <!-- Mensaje largo -->
          <div class="mb-3">
            <label for="mensajeNotificacion" class="form-label">Mensaje</label>
            <textarea class="form-control" id="mensajeNotificacion" name="mensajeNotificacion" rows="5" required></textarea>
          </div>

          <!-- Programado -->
          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" value="1" id="notificacionProgramada" name="notificacionProgramada">
            <label class="form-check-label" for="notificacionProgramada">
              Notificación programada
            </label>
          </div>

          <!-- Fecha de programación (oculta inicialmente) -->
          <div class="mb-3 d-none" id="campoFechaProgramado">
            <label for="fechaProgramado" class="form-label">Fecha de programación</label>
            <input type="datetime-local" class="form-control" id="fechaProgramado" name="fechaProgramado">
          </div>

          <!-- Vigencia (oculta inicialmente) -->
          <div class="mb-3 d-none" id="campoVigencia">
            <label for="vigenciaNotificacion" class="form-label">Vigencia</label>
            <input type="date" class="form-control" id="vigenciaNotificacion" name="vigenciaNotificacion">
          </div>

        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" form="formAgregarNotificacion">Guardar</button>
      </div>

    </div>
  </div>
</div>
