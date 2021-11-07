<?php

if (empty($_POST['producto_eliminar'])) {
    header ('Location: productos-listado.php?producto_eliminado=no');
    die;
}


require 'init.php';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if (!$link) {
    header('Location: error.php');
    die;
}

$producto_eliminar = $_POST['producto_eliminar'];

echo $query = 'DELETE FROM productos WHERE id_producto = ' . $producto_eliminar;

$result = mysqli_query($link, $query);

mysqli_close($link);

header ('Location: productos-listado.php?producto_eliminado=si');
