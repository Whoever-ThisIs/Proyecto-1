<?php
  if ($_POST['id'] && $_POST['nombre'] && $_POST['precio']) {
    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    if ($precio >= 1)
    {
      $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
      $consulta = "UPDATE alimentos SET nombre = \"$nombre\" WHERE id_alimento = $id";
      $consulta2 = "UPDATE alimentos SET precio = \"$precio\" WHERE id_alimento = $id";
      $respuesta = mysqli_query($conexion,$consulta);
      $respuesta = mysqli_query($conexion,$consulta2);
      setcookie("msg","Alimento modificado correctamente.",time() + 60*1);
      header('location: Gestion-de-alimentos.php');
    }
    else
    {
      setcookie("msg","El precio debe ser mayor a uno.",time() + 60*1);
    }
  }
 ?>
