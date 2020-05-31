<?php
  if ($_POST['id'] && $_POST['nombre'] && $_POST['precio']) {
    $id = escapeall($_POST['id']);
    $nombre = escapeall($_POST['nombre']);
    $precio = escapeall($_POST['precio']);
    $cantidad = escapeall($_POST['cantidad']);
    if ($precio >= 1)
    {
      $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
      $consulta = "UPDATE alimentos SET nombre = \"$nombre\" WHERE id_alimento = $id";
      $consulta2 = "UPDATE alimentos SET precio = \"$precio\" WHERE id_alimento = $id";
      $SQL_cantidad = "UPDATE menu SET cantidad = $cantidad WHERE id_alimento = $id";
      $respuesta = mysqli_query($conexion,$consulta);
      $respuesta = mysqli_query($conexion,$consulta2);
      $consulta_cantidad = mysqli_query($conexion,$SQL_cantidad);
      setcookie("msg","Alimento modificado correctamente.",time() + 60*1);
      header('location: Gestion-de-alimentos.php');
    }
    else
    {
      setcookie("msg","El precio debe ser mayor a uno.",time() + 60*1);
    }
  }
 ?>
