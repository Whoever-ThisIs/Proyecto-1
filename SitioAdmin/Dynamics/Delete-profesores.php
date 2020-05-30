<?php
  if (isset($_POST['id'])) {
    $RFC = $_POST['id'];
    $id = "M".$RFC;
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $borrar_profesor = "DELETE FROM profesores WHERE RFC = \"$RFC\"";
    $borrar_usuario = "DELETE FROM usuarios WHERE id_usuario = \"$id\"";
    mysqli_query($conexion,$borrar_profesor);
    mysqli_query($conexion,$borrar_usuario);
    mysqli_close($conexion);
  }
  header('location: ./Gestion-de-usuarios.php');
?>
