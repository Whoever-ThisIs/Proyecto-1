<?php
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $consulta = "DELETE FROM menu WHERE id_alimento = \"$id\"";
    $respuesta = mysqli_query($conexion,$consulta);
    $consulta = "DELETE FROM alimentos WHERE id_alimento = \"$id\"";
    $respuesta = mysqli_query($conexion,$consulta);
    setcookie("msg","Alimento borrado correctamente.",time() + 60*10);
  }
  else
    setcookie("msg","Error al borrar alimento.",time() + 60*10);
  header('location: ./Gestion-de-alimentos.php');
 ?>
