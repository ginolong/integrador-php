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

mysqli_close($link);

$fetchCategorias = mysqli_fetch_assoc($resultCategorias);

$id_categoria = $fetchCategorias['id_categoria'];
$nombreCategoria = $fetchCategorias['nombre'];
$categoria = '';
?>



<select class="form-select" id="categoria" name="categoria" required>
            <option value="" <?php if ($categoria === '') {echo 'selected';} ?>>Elegir...</option>
            <?php
            while ($categoriaArray = mysqli_fetch_assoc($resultCategorias)) { ?>
                <option value=<?= $categoriaArray['id_categoria'] ?>><?= $categoriaArray['nombre'] ?></option>
            <?php } ?>
</select>