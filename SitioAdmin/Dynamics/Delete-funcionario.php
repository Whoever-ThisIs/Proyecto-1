<?php
  if (isset($_POST['id'])) {
    $RFC = $_POST['id'];
    $id = "F".$RFC;
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    $borrar_funcionario = "DELETE FROM funcionarios WHERE RFC = \"$RFC\"";
    $borrar_usuario = "DELETE FROM usuarios WHERE id_usuario = \"$id\"";
    mysqli_query($conexion,$borrar_funcionario);
    mysqli_query($conexion,$borrar_usuario);
    mysqli_close($conexion);
  }
  header('location: ./Gestion-de-usuarios.php');
?>
