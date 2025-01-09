<?php
    //Establecer conexión

    $mysqlilocal=new mysqli("127.0.0.1", "root", "", "bd_seguridad_sistemas");
    if(mysqli_connect_error())

    {
        echo 'Conexión Fallida: ', mysqli_connect_error();
        exit();
    }

    $mysqlLenovo=new mysqli("127.0.0.1", "root", '', "siai");
    if(mysqli_connect_error())
    {
        echo 'Conexión Fallida: ', mysqli_connect_error();
        exit();
    }

    $mysqlDell=new mysqli("192.168.1.224", "siga", 'siga&%$admvo01', "siga_administrativo");
    if(mysqli_connect_error())
    {
        echo 'Conexión Fallida: ', mysqli_connect_error();
        exit();
    }
?>