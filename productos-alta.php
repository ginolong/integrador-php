<?php

header('Content-Type: text/html; charset=UTF-8');
$method = 'POST';
$btnValue = 'Dar de Alta';
$titulo = 'Alta de productos';


require_once 'funciones.php';

$nombre = '';
$precio = '';
$stock = '';
$categoria = '';
$marca = '';
$garantia = '';
$descripcion = '';
$envio = '';

$errores = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include '_productos-validar.php';

    if ($errores) {
        $htmlAlert = getAlert('Atencion!', implode('<br>', $errores), 'danger');
    } else {

        require_once 'init.php';
        $link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
        if (!$link) {
            header('Location error.php');
            die;
        }

        $query = "INSERT INTO productos (`nombre`, `id_categoria`, `id_marca`, `precio`, `stock`, `garantia`, `detalles`, `envio`) 
        VALUES ('$nombre', '$categoria', '$marca', '$precio', '$stock', '$garantia', '$descripcion', '$envio');";

        mysqli_query($link, $query);
        mysqli_close($link);

        $nombre = '';
        $precio = '';
        $stock = '';
        $categoria = '';
        $marca = '';
        $garantia = '';
        $descripcion = '';
        $envio = '';

        $htmlAlert = getAlert('Exito!', 'El producto fue dado de alta.', 'success');
    }
}



include '_header.php';

if (!empty($htmlAlert)) {
    echo $htmlAlert;
}

include '_productos-form.php';

include '_footer.php';
