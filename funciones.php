<?php

function rangoValido($texto, $min, $max)
{
    $textoLength = strlen($texto);
    return $textoLength >= $min && $textoLength <= $max;
}

function getAlert($titulo, $mensaje, $alertType)
{
    $alert = <<<HTML_ALERT
        <div class="alert alert-$alertType  alert-dismissible fade show" role="alert">
            <p class="alert-heading fs-4 fw-bold">$titulo</p>
            <p>$mensaje</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    HTML_ALERT;
    return $alert;
}

function inicializarVariables () {
    global $nombre, $precio, $stock, $categoria, $marca, $garantia, $descripcion, $envio;
    $nombre = '';
    $precio = '';
    $stock = '';
    $categoria = '';
    $marca = '';
    $garantia = '';
    $descripcion = '';
    $envio = '';
}

function inputAlert($array, $input)
{
    $estado = '';
    if ($array['$input'] !== '') {
        $estado = 'alert alert-danger';
    }
    return $estado;
}
//<?php echo inputAlert ($errores, 'nombre') 

function formatNumberLocal($number) {
    return number_format($number, '0', ',', '.');
}

function getCategoriasSelect ($id) {
    require_once 'init.php';
    $link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if (!$link) {
        header('Location error.php');
        die;
    }

    $query = 'SELECT id_categoria, nombre FROM categorias ORDER BY nombre';
    $result = mysqli_query($link, $query);
    mysqli_close($link);

    //array asociativo 

    $htmlOptions = '';
    while ($categoria = mysqli_fetch_assoc($result)) {
        $id_categoria = $categoria['id_categoria'];
        $nombreCategoria = $categoria['nombre'];
        $selected = '';
        if ($id === $id_categoria) {
            $selected = 'selected';
        }
        $htmlOptions .= <<<HTML_OPTION
            <option value="$id_categoria" $selected>$nombreCategoria</option>;
        HTML_OPTION;
    }

    $vacioSelected = '';
    if ($id === '') {
        $vacioSelected = 'selected';
    }

    return <<<HTML_SELECT
        <select class="form-select" id="categoria" name="categoria">
            <option disabled $vacioSelected>Seleccionar...</option>
            $htmlOptions
        </select>
    HTML_SELECT;
}

function getMarcasSelect ($id) {
    require_once 'init.php';
    $link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    if (!$link) {
        header('Location error.php');
        die;
    }

    $query = 'SELECT id_marca, nombre FROM marcas ORDER BY nombre';
    $result = mysqli_query($link, $query);
    mysqli_close($link);

    //array asociativo 

    $htmlOptions = '';
    while ($marca = mysqli_fetch_assoc($result)) {
        $id_marca = $marca['id_marca'];
        $nombreMarca = $marca['nombre'];
        $selected = '';
        if ($id === $id_marca) {
            $selected = 'selected';
        }
        $htmlOptions .= <<<HTML_OPTION
            <option value="$id_marca" $selected>$nombreMarca</option>;
        HTML_OPTION;
    }

    $vacioSelected = '';
    if ($id === '') {
        $vacioSelected = 'selected';
    }

    return <<<HTML_SELECT
        <select class="form-select" id="marca" name="marca">
            <option disabled $vacioSelected>Seleccionar...</option>
            $htmlOptions
        </select>
    HTML_SELECT;
}
?>
