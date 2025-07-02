<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/DashboardModel.php");

$Dashboard = new Dashboard();
$conexion = new Conectar();
$html = '';
$URLSistema;

switch ($_GET["opcion"]) 
{
    case "AccesosSistemas":

        $datos = $Dashboard->Acceso_A_Sistemas($_SESSION['Enlace']);

        foreach ($datos as $resultado) 
        {
            if($conexion->configMysql == "Local")
            {
                $URLSistema= $resultado['url_prueba'];
            }
            else if($conexion->configMysql == "Produccion")
            {
                $URLSistema= $resultado['url_produccion'];
            }

            $html .= "<div class='col-md-4'>
                            <div class='card h-100 text-center shadow border-0'>
                                <div class='card-body'>
                                    <img src='data:image/jpeg;base64," . base64_encode($resultado['imagen_sistema']) . "' style='height: 60px;'>
                                    <h5 class='mt-3'>" . htmlspecialchars($resultado['sistema']) . "</h5>
                                    <a href='".htmlspecialchars($URLSistema) ."' class='btn btn-sm btn-primary'>Ingresar</a>
                                </div>
                            </div>
                        </div>";
        }

        echo $html;
    break;
}




  
   