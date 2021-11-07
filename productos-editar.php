<?php


require_once 'funciones.php';
require_once 'init.php';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

//Chequeo la conexion
if (!$link) {
    header('Location: error.php');
    die;
}

$envio = '';
$htmlAlert = '';
$idGet = $_GET['producto_editar'];

/////////
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include '_productos-validar.php';

    if ($errores) {
        $htmlAlert = getAlert('Atencion!', implode('<br>', $errores), 'danger');
    } else {
    $queryUpdate = "UPDATE productos 
        SET nombre='{$_POST['nombre']}',
            id_categoria='{$_POST['categoria']}',
            id_marca='{$_POST['marca']}',
            precio='{$_POST['precio']}',
            stock='{$_POST['stock']}',
            garantia='{$_POST['garantia']}',
            detalles='{$_POST['descripcion']}',
            envio='{$_POST['envio']}'
        WHERE
            id_producto = '$idGet'";

    mysqli_query($link, $queryUpdate);
    mysqli_close($link);

    header("Location: productos-listado.php?producto_editar=$idGet");
    die;
    }
}

////////////
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = <<<QUERY
SELECT
	id_producto,
	nombre,
    id_categoria,
    id_marca,
    precio,
    stock,
    garantia,
    detalles,
    envio,
    foto
FROM
	productos
WHERE
	id_producto = $idGet
QUERY;

    $result = mysqli_query($link, $query);

    if ($result) {
        $fetch = mysqli_fetch_assoc($result);
        // Inicializacion de Variables
        $id_producto = $fetch['id_producto'];
        $nombre = $fetch['nombre'];
        $precio = $fetch['precio'];
        $stock = $fetch['stock'];
        $categoria = $fetch['id_categoria'];
        $marca = $fetch['id_marca'];
        $garantia = $fetch['garantia'];
        $descripcion = $fetch['detalles'];
        $envio = $fetch['envio'];
    }
}





$method = 'POST';
$btnValue = 'Modificar';
$titulo = 'Edicion de producto';

include '_header.php';

echo $htmlAlert;

include '_productos-form.php';

include '_footer.php';
