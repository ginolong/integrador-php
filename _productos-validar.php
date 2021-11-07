<?php

require_once 'funciones.php';



if (isset($_POST['nombre'])) {
    $nombre = trim($_POST['nombre']);
}

if (isset($_POST['precio'])) {
    $precio = trim($_POST['precio']);
}

if (isset($_POST['stock'])) {
    $stock = trim($_POST['stock']);
}

if (isset($_POST['categoria'])) {
    $categoria = trim($_POST['categoria']);
}

if (isset($_POST['marca'])) {
    $marca = trim($_POST['marca']);
}

if (isset($_POST['garantia'])) {
    $garantia = trim($_POST['garantia']);
}

if (isset($_POST['descripcion'])) {
    $descripcion = trim($_POST['descripcion']);
}

if (isset($_POST['envio'])) {
    $envio = '1'; // cambie el "si" por "1" para que lo interprete la base de datos
}








// $nombreLength = strlen($nombre);
$nombreMinLength = 3;
$nombreMaxLength = 40;

// if ($nombre === '') {
//     echo 'El nombre es obligatorio.';
// } else if ($nombreLength < $nombreMinLength) {
//     echo "El nombre debe contener al menos $nombreMinLength caracteres.";
// } else if ($nombreLength > $nombreMaxLength) {
//     echo "El nombre debe contener $nombreMaxLength caracteres como máximo.";
// }

if ($nombre === '') {
    $errores['nombre'] = 'El nombre es obligatorio.';
} else if (!rangoValido($nombre, $nombreMinLength, $nombreMaxLength)) {
    $errores['nombre'] = "El nombre debe contener entre $nombreMinLength y $nombreMaxLength caracteres.";
}





if ($precio === '') {
    $errores['precio'] = 'El precio es obligatorio.';
} else if (!is_numeric($precio)) {
    $errores['precio'] = 'El precio debe ser un valor numérico.';
} else if ($precio < 0) {
    $errores['precio'] = 'El precio no puede ser negativo.';
}




if ($stock === '') {
    $errores['stock'] = 'El stock es obligatorio.';
} else if (!is_numeric($stock)) {
    $errores['stock'] = 'El stock debe ser un valor numérico.';
} else {
    $stock += 0;
    if (!is_int($stock)) {
        $errores['stock'] = 'El stock debe ser un número entero.';
    }
}





if ($categoria === '') {
    $errores['categoria'] = 'La categoría es obligatoria.';
}

if ($marca === '') {
    $errores['marca'] = 'La marca es obligatoria.';
}




$categoriaValoresValidos = ['6', '12', '24'];
if ($garantia === '') {
    $errores['garantia'] = 'La garantía es obligatoria.';
} else if (!in_array($garantia, $categoriaValoresValidos)) {
    $errores['garantia'] = 'El valor de garantía no es válido.';
}


$descripcionMinLength = 10;
$descripcionMaxLength = 500;
if ($descripcion === '') {
    $errores['descripcion'] = 'La descripción es obligatoria.';
} else if (!rangoValido($descripcion, $descripcionMinLength, $descripcionMaxLength)) {
    $errores['descripcion'] = "La descripción debe contener entre $descripcionMinLength y $descripcionMaxLength caracteres.";
}

