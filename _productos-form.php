<?php

require_once 'init.php';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

//Chequeo la conexion
if (!$link) {
    header('Location: error.php');
    die;
}

$query = 'SELECT * FROM categorias';
$resultCategorias = mysqli_query($link, $query);

$query = 'SELECT id_marca, nombre FROM marcas';
$resultMarcas = mysqli_query($link, $query);

mysqli_close($link);

$fetchCategorias = mysqli_fetch_assoc($resultCategorias);
$fetchMarcas = mysqli_fetch_assoc($resultMarcas);

$id_categoria = $fetchCategorias['id_categoria'];
$nombreCategoria = $fetchCategorias['nombre'];

$id_marca = $fetchMarcas['id_marca'];
$nombreMarca = $fetchMarcas['nombre'];



// function getCategoriasSelect () {

// }
// mysqli_close($link);

?>

<form class="row g-3" method="<?= $method ?>" action="" novalidate>

    <div class="col-md-6 col-xxl-4">
        <label class="form-label" for="nombre">Nombre:</label>
        <input class="form-control" type="text" id="nombre" name="nombre" minlength="3" value="<?= $nombre ?>" autofocus required autocomplete="off">
    </div>

    <div class="col-md-3 col-sm-6 col-xxl-1">
        <label class="form-label" for="precio">Precio:</label>
        <input class="form-control" type="text" id="precio" name="precio" value="<?= $precio ?>"">
</div>

<div class=" col-md-3 col-sm-6 col-xxl-1">
        <label class="form-label" for="stock">Stock:</label>
        <input class="form-control" type="text" id="stock" name="stock" value="<?= $stock ?>"">
</div>

<div class=" col-md-6 col-xxl-3">
        <label class="form-label" for="categoria">Categoría:</label>
        <?= getCategoriasSelect($categoria)//include '_categorias-select.php'; ?>
    </div>

    <div class="col-md-6 col-xxl-3">
        <label class="form-label" for="marca" required>Marca:</label>
        <?= getMarcasSelect($marca) //include '_marcas-select.php'; ?>
    </div>

    <div class="col-md-6">
        <label class="form-label" for="garantia" required>Garantía:</label><br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="garantia" id="inlineRadio1" value="6" <?php if ($garantia === '6') {
                                                                                                            echo 'checked';
                                                                                                        } ?>>
            <label class="form-check-label" for="inlineRadio1">6 Meses</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="garantia" id="inlineRadio2" value="12" <?php if ($garantia === '12') {
                                                                                                            echo 'checked';
                                                                                                        } ?>>
            <label class="form-check-label" for="inlineRadio2">12 Meses</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="garantia" id="inlineRadio3" value="24" <?php if ($garantia === '24') {
                                                                                                            echo 'checked';
                                                                                                        } ?>>
            <label class="form-check-label" for="inlineRadio3">24 Meses</label>
        </div>
    </div>

    <div class="col-md-6">
        <label class="form-label" for="foto">Foto:</label>
        <input class="form-control" type="file" id="foto" name="foto">
    </div>

    <div class="col-md-12">
        <label class="textarea" for="descripcion">Descripción:</label> <br>
        <textarea class="form-control" type="text" id="descripcion" name="descripcion" minlength="10" maxlength="500" placeholder="Descripcion" required><?= $descripcion ?></textarea>
    </div>

    <div class="col-md-12">
        <input class="form-check-input" type="checkbox" value="1" id="envio" name="envio" <?php if ($envio === '1') {
                                                                                                echo 'checked';
                                                                                            } ?>>
        <label class="form-check-label" for="envio">Envío sin cargo</label>
    </div>

    <input type="submit" value="<?= $btnValue ?>">

</form>