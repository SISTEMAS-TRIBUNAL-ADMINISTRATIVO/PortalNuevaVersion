<div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Anexos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Imagen -->
                    <div class="col-md-4">
                        <img id ="imagen_anexo" src="https://www.creativefabrica.com/wp-content/uploads/2020/09/29/rainbow-computer-kawaii-illustration-Graphics-5756922-1-580x387.png" alt="Imagen" class="img-fluid">
                        <button type="button" class="btn btn-primary mt-3">Seleccionar...</button>
                    </div>

                    <!-- Formulario al lado de la imagen -->
                    <div class="col-md-8">
                        <form>
                            <!-- Primer campo -->
                            <div class="form-group">
                                <label for="tipoBien">Instalación</label>
                                <input type="text" class="form-control" id="tipoBien" placeholder="ÁREA DE INFORMÁTICA">
                            </div>
                            <!-- Segundo campo con botón de búsqueda -->
                            <div class="form-group">
                                <label for="ComentarioCuenta">Observaciones</label>
                                <textarea class="form-control" id="ComentarioCuenta" rows="4" placeholder="Observaciones..."></textarea>
                            </div>
                        </form>
                    </div>
                </div>
                <h2>Nota:</h2>
                <p style="color: red;">Si el bien informático NO cuenta con FACTURA, por favor, agregue un documento que valide el ingreso al área de informática.</p>


                
                <!-- Sección para agregar un archivo -->
                <div class="form-group">
                    <label for="archivo">Archivo</label>
                    <div id="" class="mt-2">
                    <iframe id="pdf_anexo" src="" width="100%" height="400px" style="border: none;"></iframe>
                    <div id="no-file-message" class="mt-3 text-danger" style="display: none;">No hay un archivo para mostrar</div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary  " data-dismiss="modal">Cerrar</button>
            </div>
