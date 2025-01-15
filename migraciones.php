<?php
    require_once("config/conexion.php");
    require_once("models/migracionesModel.php");
       

    $migraciones = new Migraciones();
    header('Content-Type: application/json');


    $CarpetaMigracines = __DIR__ . '/Database/Migrations/';
    $MigracionesAplicadas = $migraciones->BuscarMigraciones();
    $ArchivosMigraciones = scandir($CarpetaMigracines);
    $MigracionesPendientes = array_diff($ArchivosMigraciones, $MigracionesAplicadas);


    foreach ($MigracionesPendientes as $migration) 
    {
        if ($migration === '.' || $migration === '..') continue;
        $sql = file_get_contents($CarpetaMigracines . $migration);

        try {
            // Ejecutar la migración
            $migraciones->InsertMigraciones($sql);
            $migraciones->GuardarMigraciones($migration);

            echo "Migración aplicada: $migration\n";
        } catch (PDOException $e) {
            echo "Error al aplicar la migración $migration: " . $e->getMessage() . "\n";
        }
    }
                    
?>
    