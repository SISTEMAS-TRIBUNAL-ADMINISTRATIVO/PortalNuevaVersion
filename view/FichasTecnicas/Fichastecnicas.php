<?php 
  session_start();
  require_once("../../config/conexion.php");

  if (isset($_SESSION["Enlace"])) 
  {
    require_once("../Head/head_meta.php");
  ?>
    <title>Fichas Tecnicas</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

<div class="right_col" role="main">
    <h3>Fichas Tecnicas</h3>

    <!-- Botón Agregar -->
    <div class="mb-3">
      <button type="button" class="btn btn-primary" title="Agregar" name="Agregar" value="">
        <i class="fa fa-plus"></i> Agregar
      </button>
    </div>

    <!-- Barra de búsqueda -->
    <div class="mb-3">
      <div class="input-group">
        <input type="text" class="form-control" id="searchInput" placeholder="Buscar...">
        <span class="input-group-text">
          <i class="fa fa-search"></i>
        </span>
      </div>
    </div>

    <!-- Tabla -->
    <div class="container mt-4">
      <table class="table table-striped jambo_table bulk_action" id="bienesinformaticos">
        <thead class="table-primary">
          <tr class="headings">
            <th class="column-title text-center">Folio</th>
            <th class="column-title text-center">Fecha Captura</th>
            <th class="column-title text-center">Bien informatico</th>
            <th class="column-title text-center">Marca</th>
            <th class="column-title text-center">Serie</th>
            <th class="column-title text-center">Inventario</th>
            <th class="column-title text-center">Problema</th>
            <th class="column-title text-center">Trabajo Realizado</th>
            <th class="column-title text-center">Diagnostico</th>
            <th class="column-title text-center">Recomendaciones</th>
        
          </tr>
        </thead>
        <tbody>
          <!-- Aquí irán los datos de la tabla -->
          <tr>
            <td>Descripción 1</td>
            <td>Marca 1</td>
            <td>Modelo 1</td>
            <td>Serie 1</td>
            <td>Inventario 1</td>
            <td>Origen 1</td>
            <td>Factura 1</td>
            <td>2024-01-01</td>
            <td>$1000</td>
            <td>Disponible</td>
          </tr>
          <tr>
            <td>Descripción 1</td>
            <td>Marca 1</td>
            <td>Modelo 1</td>
            <td>Serie 1</td>
            <td>Inventario 1</td>
            <td>Origen 1</td>
            <td>Factura 1</td>
            <td>2024-01-01</td>
            <td>$1000</td>
            <td>Disponible</td>
          </tr>
          <tr>
            <td>Descripción 1</td>
            <td>Marca 1</td>
            <td>Modelo 1</td>
            <td>Serie 1</td>
            <td>Inventario 1</td>
            <td>Origen 1</td>
            <td>Factura 1</td>
            <td>2024-01-01</td>
            <td>$1000</td>
            <td>Disponible</td>
          </tr>
          <tr>
            <td>Descripción 1</td>
            <td>Marca 1</td>
            <td>Modelo 1</td>
            <td>Serie 1</td>
            <td>Inventario 1</td>
            <td>Origen 1</td>
            <td>Factura 1</td>
            <td>2024-01-01</td>
            <td>$1000</td>
            <td>Disponible</td>
          </tr>
          <tr>
            <td>Descripción 1</td>
            <td>Marca 1</td>
            <td>Modelo 1</td>
            <td>Serie 1</td>
            <td>Inventario 1</td>
            <td>Origen 1</td>
            <td>Factura 1</td>
            <td>2024-01-01</td>
            <td>$1000</td>
            <td>Disponible</td>
          </tr>
          <!-- Añade más filas según sea necesario -->
        </tbody>
      </table>
    </div>
</div>

<?php
    require_once("../Footer/footer.php");
    require_once("../Footer/footer_script.php");
    require_once("../Footer/footerDataTable.php");
?>
<script type="text/javascript" src="../Informatic/BienesInformaticos.js"></script>
<script>
  // Funcionalidad del buscador
  document.getElementById('searchInput').addEventListener('input', function() {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll('#bienesinformaticos tbody tr');
    
    rows.forEach(row => {
      const cells = row.querySelectorAll('td');
      const rowText = Array.from(cells).map(cell => cell.textContent.toLowerCase()).join(' ');
      row.style.display = rowText.includes(searchValue) ? '' : 'none';
    });
  });
</script>
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
