<!-- Modal: Editar Usuario -->
<div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="modalEditarUsuarioLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header  bg-secondary text-white">
        <h5 class="modal-title" id="modalEditarUsuarioLabel">
          <i class="bi bi-pencil-square me-2"></i>Editar Usuario
        </h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <form id="formEditarUsuario" enctype="multipart/form-data">
        <div class="modal-body">
          <div class="row g-3">
            
            <!-- Imagen -->
            <div class="col-md-4 text-center">
              <img src=""  style="max-height: 150px;" alt="Imagen del Usuario" id="imagen_user">
              <input type="file" class="form-control form-control-sm" name="imagen" accept="image/*" onchange="previewImagen(this)">
            </div>

            <!-- Datos personales -->
            <div class="col-md-8">
              <div class="row g-2">
                <div class="col-md-6">
                  <label class="form-label">Enlace</label>
                  <input type="text" class="form-control" name="enlace" id="editEnlace" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">CURP</label>
                  <input type="text" class="form-control" name="curp" id="editCurp" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Nombre(s)</label>
                  <input type="text" class="form-control" name="nombres" id="editNombres" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Apellido Paterno</label>
                  <input type="text" class="form-control" name="apellido_p" id="editApellidoP" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Apellido Materno</label>
                  <input type="text" class="form-control" name="apellido_m" id="editApellidoM" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Correo Electrónico</label>
                  <input type="email" class="form-control" name="email" id="editEmail"  required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Teléfono</label>
                  <input type="text" class="form-control" name="telefono" id="editTelefono" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Siglas</label>
                  <input type="text" class="form-control" name="siglas" id="editSiglas" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Sexo</label>
                  <select class="form-select" name="sexo" id="editSexo" required>
                    <option value="">Seleccione</option>
                    <option value="HOMBRE">HOMBRE</option>
                    <option value="MUJER">MUJER</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Prefijo</label>
                  <input type="text" class="form-control" name="prefijo" id="editPrefijo" required>
                </div>
                <div class="col-12">
                  <label class="form-label">Descripción del Prefijo</label>
                  <textarea class="form-control" name="descripcion_prefijo" id="editDescripcionPrefijo" rows="2" ></textarea>
                </div>
                <div class="col-12">
                  <label class="form-label">Área a la que pertenece</label>
                    <select class="form-select" name="sexo" id="editAreaPertenece" required>
                  </select>
                </div>
              </div>
            </div>

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-save me-1"></i>Guardar Cambios
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
