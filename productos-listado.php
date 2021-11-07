<?php
/*
A -Conectarse con el servidor de DB utilizando las constantes definidas en constantes.php

B -Si la conexion no se puede establecer, redirigir al usuario a error.php

C -Si la conexion si se puede establecer, ejecutar la consulta (para obtener todos los datos de todos los productos) y despues utilizar la funcion mysqli_num_rows() para almacenar en una variable $cantidadDeProductos la cantidad de resultados encontrados.

D -Si se encontraron resultados, mostrar cada producto uno debajo del otro, con un print_r().

E -Si no se encontro ningun producto, informar que no hay datos para mostrar con un formato distinto al de una tabla.

F -Como ultimo paso modificar el codigo del punto "D" para mostrar todos los resultados en formato de tabla.

G -Formatear la tabla y todos sus datos prolijamente.
*/

$titulo = 'Listado de productos';

require_once 'funciones.php';
//Conexion a DB
require 'init.php';
$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

//Chequeo la conexion
if (!$link) {
    header('Location: error.php');
    die;
}

//Hago la consulta y cierro la conexion
$query = '
SELECT
	id_producto,
	p.nombre,
    c.nombre AS categoria_nombre,
    m.nombre AS marca_nombre,
    m.sitio_web AS marca_sitio_web,
    m.telefono AS marca_telefono,
    precio,
    stock,
    garantia,
    detalles,
    envio,
    foto,
    date_format(fecha_de_alta, "%m-%Y") AS fecha_alta_formateada
FROM
	productos p
    LEFT JOIN marcas m ON p.id_marca = m.id_marca
    LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
';
$result = mysqli_query($link, $query);

$cantidadDeProductos = mysqli_num_rows($result);
$cantidadDeColumnas = mysqli_field_count($link);

mysqli_close($link);

include '_header.php';

if (!empty($_GET['producto_eliminado'])){
    if ($_GET['producto_eliminado'] === 'si') {
    $alertTitle = 'Informacion:';
    $alertMessage = 'Producto eliminado con exito.';
    $alertType = 'info';
    } else {
        $alertTitle = 'Informacion:';
        $alertMessage = 'El producto no se pudo eliminar.';
        $alertType = 'warning';
    }
    echo getAlert($alertTitle, $alertMessage, $alertType);
}


if ($result) {

} else {
    echo "No se encontraron productos.";
}

function listarProductos ($resultados) {
    $cantidadDeResultados = mysqli_num_rows($resultados);
    $fetch = "<li>Se encontraron $cantidadDeResultados productos.</li>";
    echo '<pre>';
    while ($fetch != null) {
        print_r($fetch);
        echo '<hr>';
        $fetch = mysqli_fetch_assoc($resultados);
    }
    echo '</pre>';
}

include '_productos-table.php';



include '_footer.php';