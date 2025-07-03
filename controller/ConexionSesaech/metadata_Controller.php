<?php
    function obtenerMetadata($datosDeclaracion, $tipoDeclaracionTexto)
    {
        return [
            "id_organismo" => 74,
            "organismo" => "TRIBUNAL DE JUSTICIA ADMINISTRATIVA DEL ESTADO DE CHIAPAS",
            "formato" => "COMPLETA",
            "tipo" => mb_strtoupper($tipoDeclaracionTexto, 'UTF-8'),
            "fechaPresentacion" => $datosDeclaracion["fecha_fin"],
            "anio" => intval($datosDeclaracion["anio_anual"]),
            "actualizacionConflictoInteres" => false
        ];
    }
?>