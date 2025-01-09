<?php 
session_start();
require_once("../../config/conexion.php");
require_once("../Head/head_meta.php");
?>
<title>Datos Laboral</title>
<?php
    require_once("../Head/head_link_datatable.php");
    require_once("../Head/head_link.php");
    require_once("../Menu/MenuPrincipal.php");
?>

<div class="right_col" role="main">
    
    <!-- Título -->
    <h1 class="mb-4">Catálogo Proveedores</h1>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">


    <!-- Barra de búsqueda -->
    <div class="mb-3">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Buscar proveedor" aria-label="Buscar proveedor">
            <span class="input-group-text">
                <i class="bi bi-search"></i>
            </span>
        </div>
    </div>

    <!-- Botones Agregar y Editar -->
    <div class="mb-3">
        <button class="btn btn-primary btn-icon">
            <i class="bi bi-plus"></i> Agregar
        </button>
        <button class="btn btn-secondary btn-icon">
            <i class="bi bi-pencil"></i> Editar
        </button>
    </div>

    <!-- Tabla -->
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Seleccionar</th>
                    <th scope="col">Proveedor</th>
                    <th scope="col">Siglas</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>Proveedor 1</td>
                    <td><span class="text-primary">P1</span></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>Proveedor 2</td>
                    <td><span class="text-primary">P2</span></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>Proveedor 3</td>
                    <td><span class="text-primary">P3</span></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<?php
require_once("../Footer/footer.php");
require_once("../Footer/footer_script.php");
require_once("../Footer/footerDataTable.php");
?>

