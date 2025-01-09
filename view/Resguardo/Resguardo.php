<?php
session_start();
require_once("../../config/conexion.php");

if (isset($_SESSION["Enlace"])) {
    require_once("../Head/head_meta.php");
    ?>
    <title>Detalles de Resguardo</title>
    <?php
    require_once("../Head/head_link.php");
    require_once("../Menu/MenuPrincipal.php");
    ?>
<div  class="right_col" role="main">




        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-4 d-flex justify-content-center align-items-center">
                    <div class="border rounded p-2 d-none d-md-block">
                        <img src="https://static.vecteezy.com/system/resources/previews/000/648/395/original/vector-computer-icon-symbol-sign.jpg" alt="Imagen de Resguardo" class="img-fluid rounded">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="bg-light p-3 rounded border">
                        <h2 class="text-center text-white bg-dark p-3 rounded">DETALLES DEL RESGUARDO</h2>
                        <form>
                            <div class="form-group">
                                <label for="details">Detalles:</label>
                                <input type="text" id="details" class="form-control" readonly value="Detalles del artículo">
                            </div>
                            <div class="form-group">
                                <label for="description">Descripción:</label>
                                <input type="text" id="description" class="form-control" readonly value="Descripción del artículo">
                            </div>
                            <div class="form-group">
                                <label for="brand">Marca:</label>
                                <input type="text" id="brand" class="form-control" readonly value="Hp">
                            </div>
                            <div class="form-group">
                                <label for="inventory">Inventario:</label>
                                <input type="text" id="inventory" class="form-control" readonly value="1212223">
                            </div>
                            <div class="form-group">
                                <label for="origin">Origen:</label>
                                <input type="text" id="origin" class="form-control" readonly value="Origen">
                            </div>
                            <div class="form-group">
                                <label for="location">Ubicación:</label>
                                <select id="location" class="form-control">
                                    <option value="belizario_domínguez">Belizario Domínguez</option>
                                    <option value="plaza_central">Plaza Central</option>
                                    <option value="oficina_principal">Oficina Principal</option>
                                    <option value="almacen">Almacén</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="date">Fecha de Alta:</label>
                                <input type="text" id="date" class="form-control" readonly value="Fecha de alta del artículo">
                            </div>
                            <div class="form-group">
                                <label for="comments">Comentarios:</label>
                                <textarea id="comments" class="form-control" readonly>Comentarios sobre el artículo.</textarea>
                            </div>
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    
    <?php
    require_once("../Footer/footer.php");
    require_once("../Footer/footer_script.php");
} else {
    $conexion = new Conectar();
    header("Location:" . $conexion->ruta() . "index.php");
}
?>
