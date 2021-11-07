<?php

require_once 'init.php';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

//Chequeo la conexion
if (!$link) {
    header('Location: error.php');
    die;
}

$query = 'SELECT * FROM marcas';
$resultMarcas = mysqli_query($link, $query);

mysqli_close($link);

$fetchMarcas = mysqli_fetch_assoc($resultMarcas);

$id_marcas = $fetchMarcas['id_marca'];
$nombreMarcas = $fetchMarcas['nombre'];
$marca = '';
?>



<select class="form-select" id="marca" name="marca" required>
            <option value="" <?php if ($marca === '') {echo 'selected';} ?>>Elegir...</option>
            <?php
            while ($marcaArray = mysqli_fetch_assoc($resultMarcas)) { ?>
                <option value=<?= $marcaArray['id_marca'] ?>><?= $marcaArray['nombre'] ?></option>
            <?php } ?>
</select>