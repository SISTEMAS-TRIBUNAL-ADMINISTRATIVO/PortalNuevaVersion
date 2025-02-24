<?php 
session_start();
require_once("../../config/conexion.php");

if (isset($_SESSION["Enlace"])) 
{
    require_once("../Head/head_meta.php");
?>
    <title>Datos Laboral</title>
    <?php
        require_once("../Head/head_link_datatable.php");
        require_once("../Head/head_link.php");
        require_once("../Menu/MenuPrincipal.php");
    ?>

    <title>ADMINISTRACIÓN DE AVISOS</title>
    <div class="right_col" role="main">
        <h3 class="titulo">ADMINISTRACIÓN DE AVISOS</h3>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        </div>
                
        <!-- Botón para abrir el modal -->
        <button type="button" class="btn1 btn-primary" id="BtnModal" name="BtnModal" 
                data-bs-toggle="modal" data-bs-target="#ModalAgregarAviso">
        Agregar Aviso
        </button>
    
        <div class="col-md-12 col-sm-12">
            <div class="table-responsive">
                <table class="table table-striped jambo_table bulk_action" id="TablaAvisos">
                    <thead>
                        <tr>
                            <th>tipo de notoficacion</th>
                            <th>titulo de la notificacion</th>
                            <th>mensaje</th>
                            <th>fecha de creacion</th>
                            <th>estado</th>
                            <th>vigencia</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div> <!-- Fin de col-md-12 -->
    </div> <!-- Fin de right_col -->

    <!-- /page content -->
<?php

    require_once("../Footer/footer.php");
    require_once("../Footer/footer_script.php");
    require_once("../Footer/footerDataTable.php");

    require_once("modalAviso.php"); 
?>
<script type="text/javascript" src="../Avisos/administrador_avisos.js"></script>
    </body>
</html>
<?php
} else {
    $conexion = new Conectar();
    header("Location:" . $conexion->ruta() . "index.php");
}
?>

<style>
    .btn1{
        background-color:rgb(52, 129, 52); /* Verde claro */
        color: #fff; /* Texto blanco */
        border: 2px solid #000; /* Borde negro */
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    th{
        background-color: rgb(23, 85, 136) ;
    }

    .titulo{
        background-color: rgb(156, 155, 155);
  color: black;
  text-align: center; /* Centra el texto */
  display: flex;
  justify-content: center; /* Centra horizontalmente */
  align-items: center; /* Centra verticalmente */
  padding: 10px;
  width: 100%; /* Asegura que ocupe todo el ancho */
    }
</style>

