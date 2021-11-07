<?php
/**
* @var int $cantidadDeProductos
* @var string $ciudad
 


Textos completos
id_producto	
nombre	
id_categoria	
id_marca	
precio	
stock	
garantia	
detalles	
envio	
foto	
fecha_de_alta*/
?>

<div class="table-responsive">
    <table class="table table-hover table-striped table-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>Id</th>
                <th>Foto</th>
                <th>Nombre</th>
                <th>Categoria</th>
                <th>Marca</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Garantia</th>
                <th>Detalles</th>
                <th>Envio</th>
                <th>Alta</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($producto = mysqli_fetch_assoc($result)) { ?>
                <tr>
                    <td><?= $producto['id_producto'] ?></td>
                    <td><?= $producto['foto'] ?></td>
                    <td><?= $producto['nombre'] ?></td>
                    <td><?= $producto['categoria_nombre'] ?></td>
                    <td>
                        <a href="<?=$producto['marca_sitio_web']?>" target="_blank">
                        <?= $producto['marca_nombre'] ?></a>
                    </td>
                    <td class="text-end">$<?= formatNumberLocal($producto['precio']) ?></td>
                    <td class="text-end"><?= $producto['stock'] ?></td>
                    <td class="text-end"><?= $producto['garantia'] ?></td>
                    <td><?= $producto['detalles'] ?></td>
                    <td title="Envio sin cargo"class="text-center"><?php if($producto['envio']) {echo '<i class="bi-check-square"></i>';} ?></td>
                    <td class="text-nowrap"><?= $producto['fecha_alta_formateada'] ?></td>
                    <td class="text-center">
                        <a title="Editar" href="productos-editar.php?producto_editar=<?= $producto['id_producto'] ?>" class=" btn btn-sm btn-outline-secondary">
                            <i class="bi-pencil-fill"></i>
                        </a>
                        <form class="d-inline" action="productos-eliminar.php" method="post" onsubmit="return confirm('¿Estas seguro de querer eliminar el siguiente producto?\r\n<?=$producto['nombre']?>')">
                            <input type="text" hidden name="producto_eliminar" value="<?= $producto['id_producto'] ?>">
                            <button title="Eliminar" class="btn btn-outline-danger btn-sm" type="submit">
                                <i class="bi-trash"></i>
                            </button>
                        </form>
                        <!-- Esta mal hacerlo con un link:
                        <a title="Eliminar" href="productos-eliminar.php?producto_eliminar= //$producto['id_producto']" class=" btn btn-sm btn-outline-danger" onclick="return confirm('¿Estas seguro de querer eliminar el siguiente producto?\r\n//$producto['nombre']')">
                            <i class="bi-trash"></i>
                        </a> -->
                    </td>
                </tr>
            <?php } ?>
        </tbody>
        <tfoot class="table-dark text-center">
            <tr>
                <td colspan="12">Se encontraron <?= $cantidadDeProductos ?> productos</td>
            </tr>
        </tfoot>
    </table>
</div>