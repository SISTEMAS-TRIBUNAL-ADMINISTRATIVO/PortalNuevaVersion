<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interfaz de Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #800000; /* Color vino */
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .search-container {
            padding: 10px;
            display: flex;
            align-items: center;
            background-color: #f5f5f5; /* Fondo claro para el área del buscador */
        }
        .search-container input[type="text"] {
            padding: 5px;
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 5px;
        }
        .search-container button {
            padding: 5px 10px;
            border: none;
            background-color: #04488d; /* Azul para el botón */
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        .search-container button i {
            margin-right: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #0755a3; /* Azul */
            color: #fff;
            position: relative;
        }
        th .arrow {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 12px;
            color: #fff;
        }
        td {
            background-color: #E0FFFF; /* Celeste claro */
        }
        td:hover {
            background-color: #B0E0E6; /* Celeste más oscuro */
        }
    </style>
</head>
<body>
    <div class="header">
        Ubicaciones
    </div>
    <div class="search-container">
        <button><i class="fas fa-search"></i> Buscar</button>
        <input type="text" placeholder="Buscar...">
    </div>
    <table>
        <thead>
            <tr>
                <th>Clave <i class="fas fa-sort arrow"></i></th>
                <th>Área</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001</td>
                <td>Área A</td>
            </tr>
            <tr>
                <td>002</td>
                <td>Área B</td>
            </tr>
            <tr>
                <td>003</td>
                <td>Área C</td>
            </tr>
            <tr>
                <tr>
                    <td>003</td>
                    <td>Área C</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>Área C</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>Área C</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>Área C</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>Área C</td>
                </tr>
            </tr>
                <td>003</td>
                <td>Área C</td>
            </tr>
            <!-- Más filas según sea necesario -->
        </tbody>
    </table>
</body>
</html>
