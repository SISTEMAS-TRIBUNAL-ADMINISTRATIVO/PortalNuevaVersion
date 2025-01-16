<?php
    require_once("config/conexion.php");
    $Conexion = new Conectar();
    $DatosConexion = $Conexion->Migraciones();


    try 
    {
        $pdo = new PDO($DatosConexion['dsn'], $DatosConexion['user'], $DatosConexion['password']);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Error en la conexión: " . $e->getMessage());
    }


    $migrationsDir = __DIR__ . '/Database/Migrations/';
    $appliedMigrations = $pdo->query("SELECT nombre_migracion FROM cat_migraciones")->fetchAll(PDO::FETCH_COLUMN);
    $migrationFiles = scandir($migrationsDir);
    $pendingMigrations = array_diff($migrationFiles, $appliedMigrations);

    
    foreach ($pendingMigrations as $migration) 
    {
        if ($migration === '.' || $migration === '..') continue;

        // Leer el archivo de migración
        $sql = file_get_contents($migrationsDir . $migration);

        try {
            // Ejecutar la migración
            $pdo->exec($sql);

            // Registrar la migración en la tabla "migrations"
            $stmt = $pdo->prepare("INSERT INTO cat_migraciones (nombre_migracion) VALUES (:migration_name)");
            $stmt->execute(['migration_name' => $migration]);

            echo "Migracion aplicada: $migration\n";
        } catch (PDOException $e) {
            echo "Error al aplicar la migración $migration: " . $e->getMessage() . "\n";
        }
    }

    echo "Todas las migraciones estan al dia.\n";