<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Detalles del bien informatico</title>
    <?php
       
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>
  <div class="right_col" role="main">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#HistorialResguardo">
            Historial de resguardo
        </button>

        <!-- Modal Historial Resguardo-->
        <div class="modal fade" id="HistorialResguardo" tabindex="-1" role="dialog" aria-labelledby="HistorialResguardoLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                </div>
            </div>
        </div>
        <!-- Modal Historial Resguardo-->


        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Mantenimiento">
            Mantenimiento
        </button>
        <!-- Modal Mantenimiento-->
        <div class="modal fade" id="Mantenimiento" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
        </div>
        </div>
        <!-- Modal Mantenimiento-->

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#FichasTecnicas">
            Fichas tecnicas
        </button>       
        <!-- Modal Fichas Tecnicas-->
        <div class="modal fade" id="FichasTecnicas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
        </div>
        </div>
        <!-- Modal Fichas Tecnicas-->

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Anexos">
            Anexos
        </button>
        <!-- Modal Anexos -->
        <div class="modal fade" id="Anexos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                </div>
            </div>
        </div>
        <!-- Modal Anexos -->
        <div class="row">
            <!-- Imagen -->
            <div class="col-md-4">
                <img id= "imagen_equipo" src="https://th.bing.com/th/id/OIP.vdLhCweCZv9RiPS8IlolEQHaFz?rs=1&pid=ImgDetMain" alt="Imagen" class="img-fluid">
                <button type="button" class="btn btn-primary mt-3 col-md-3">Seleccionar...</button>
            </div>
            

            <!-- Formulario al lado de la imagen -->
            <div class="col-md-8">
                <form>
                    <!-- Primer campo -->
                    <div class="form-group">
                        <label for="tipoBien">Tipo de bien informático</label>
                        <input type="text" class="form-control" id="Descripcion" placeholder="Tipo de bien informático">
                    </div>
                    <!-- Segundo campo con botón de búsqueda -->
                    <div class="form-group">
                        <label for="Marca">Marca</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="Marca" placeholder="Marca">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#MarcaModal">Buscar</button> 
                                        <!-- Modal Marca -->
                                <div class="modal fade" id="MarcaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                        </div>
                                    </div>
                                </div>
                                        <!-- Modal Marca -->
                            </div>
                        </div>
                    </div>
                    <!-- Campos adicionales -->
                    <div class="form-group">
                        <label for="Modelo">Modelo</label>
                        <input type="text" class="form-control" id="Modelo" placeholder="Modelo">
                    </div>
                    <div class="form-group">
                        <label for="Serie">Serie</label>
                        <input type="text" class="form-control" id="Serie" placeholder="Serie">
                    </div>
                    <div class="form-group">
                        <label for="Inventario">Inventario</label>
                        <input type="text" class="form-control" id="Inventario" placeholder="Inventario">
                    </div>
                    <div class="form-group">
                        <label for="Origen">Origen</label>
                        <input type="text" class="form-control" id="Origen_del_Equipo" placeholder="Origen">
                    </div>
                    <div class="form-group">
                        <label for="MAC">MAC</label>
                        <input type="text" class="form-control" id="MAC" placeholder="MAC">
                    </div>
                </form>
            </div>
        </div>

        <!-- Formulario con 9 campos debajo del botón Seleccionar -->
        <div class="row mt-4">
            <div class="col-12">
                <form>
                    <!-- Campos adicionales -->
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="Foliofactura">Folio factura</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="Factura" placeholder="Folio factura">
                                <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#FolioFacturaModal">Buscar</button> 
                                        <!-- Modal FolioFactura -->
                                <div class="modal fade" id="FolioFacturaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                        </div>
                                    </div>
                                </div>
                                        <!-- Modal FolioFactura -->
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="Foliofiscal">Folio fiscal</label>
                            <input type="text" class="form-control" id="Folio_Fiscal" placeholder="Folio fiscal">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="Fechafactura">Fecha de factura</label>
                            <input type="date" class="form-control" id="Fecha_Adsquisicion" value="2024-09-11" disabled>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <!-- Primera columna: Formulario -->
                            <div class="col-md-4">
                                <form>
                                    <div class="form-group">
                                        <label for="Proveedor">Proveedor</label>
                                        <input type="text" class="form-control" id="Nombre_proveedor" placeholder="Proveedor">
                                    </div>
                                    <div class="form-group">
                                        <label for="costoOrigen">Costo de Origen</label>
                                        <input type="text" class="form-control" id="costo_original" placeholder="Costo de Origen">
                                    </div>
                                    <div class="form-group">
                                        <label for="CostoActual">Costo Actual</label>
                                        <input type="text" class="form-control" id="costo_actual" placeholder="Costo Actual">
                                    </div>
                                    <div class="form-group">
                                        <label for="CuentaClave">¿Tiene cuenta contable?</label>
                                        <select class="form-control" id="tiene_cuenta_contable">
                                            <option value="0">NO</option>
                                            <option value="1">SI</option>
                                            <!-- Agrega más opciones según sea necesario -->
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="Cuenta">Cuenta</label>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" id="cuenta" placeholder="---">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="subcuenta" placeholder="----------------">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" id="sub_subcuenta" placeholder="----">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="IDpublicoantivirus">ID público antivirus</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="licencia_publica" placeholder="ID público antivirus">
                                            <div class="input-group-append">
                                            <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#IDpublicoAntivirus">Buscar</button> 
                                                    <!-- Modal IDpublicoAntivirus -->
                                            <div class="modal fade" id="IDpublicoAntivirus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                    </div>
                                                </div>
                                            </div>
                                                    <!-- Modal IDpublicoAntivirus -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Licenciaantivirus">Licencia antivirus</label>
                                        <input type="text" class="form-control" id="licencia_privada" placeholder="Licencia antivirus">
                                    </div>
                                    <div class="form-group">
                                        <label for="fechaCaducidad">Fecha de Caducidad</label>
                                        <input type="date" class="form-control" id="fechaCaducidad" value="2024-09-11" disabled>
                                    </div>
                                </form>
                            </div>

                            <!-- Segunda columna: Caja de texto -->
                            <div class="col-md-8">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="caracteristicas">Características</label>
                                            <textarea class="form-control" id="Caracteristicas" rows="15" placeholder="Características aquí..."></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="ComentarioCuenta">Comentario Cuenta</label>
                                            <textarea class="form-control" id="comentarios_cuenta_contable" rows="6" placeholder="Comentarios de la cuenta..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container form-container">
                        <form>
                            <div class="row">
                                <!-- Primera Columna -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="resguardante">Resguardante</label>
                                        <input type="text" class="form-control" id="fk_resguardante" placeholder="Nombre del Resguardante">
                                    </div>
                                    <div class="form-group">
                                        <label for="ubicacion">Ubicación</label>
                                        <input type="text" class="form-control" id="equipo_ubicacion" placeholder="Ubicación">
                                    </div>
                                    <div class="form-group">
                                        <label for="disponibilidad">Disponibilidad</label>
                                        <input type="text" class="form-control" id="Disponibilidad" placeholder="Disponibilidad">
                                    </div>
                                    <div class="form-group">
                                        <label for="licencia-office">Licencia de Office</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="licencia_privada_office" placeholder="Licencia de Office" >
                                            <div class="input-group-append">
                                            <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#ModalLiceciaOffice">Buscar</button> 
                                                    <!-- Modal Licencia Office -->
                                            <div class="modal fade" id="ModalLiceciaOffice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                    </div>
                                                </div>
                                            </div>
                                                    <!-- Modal Licencia Office -->
                                            </div>
                                        </div>
                                        </div>
                                        
                                </div>

                                <!-- Segunda Columna -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fecha-inicial-garantia">Fecha inicial de la garantía</label>
                                        <input type="date" class="form-control" id="fecha_inicial_garantia" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="fecha-final-garantia">Fecha final de la garantía</label>
                                        <input type="date" class="form-control" id="fecha_final_garantia" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="tiene-garantia">¿Tiene garantía?</label>
                                        <select class="form-control" id="tiene_garantia">
                                            <option value="0">NO</option>
                                            <option value="1">SI</option>
                                        </select>
                                    </div>
                    <div class="form-group  col-md-6">
                        <label for="fecha-caducidad-office" class="mb-0">Fecha de Caducidad de Office</label>
                        <input type="date" class="form-control" id="fecha_caducidad_office" disabled>
                    </div>
                    <div class="form-group col-md-6 mt-3">
                        <button type="button" class="btn btn-primary">
                            <i class="fa-solid fa-floppy-disk"></i> Guardar
                        </button>

                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>


    <?php
    require_once("../Footer/footer.php");
    require_once("../Footer/footer_script.php");
    require_once("../Footer/footerDataTable.php");
    ?>
    

<script type="text/javascript" src="../Informatic/DetallesBienInformatico.js"></script>



</body>
</html>
<?php
} else {
    $conexion = new Conectar();
    header("Location:" . $conexion->ruta() . "index.php");
}
?>


