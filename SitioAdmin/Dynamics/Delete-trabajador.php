<?php
  if (isset($_POST['id'])) {
    $Nt = $_POST['id'];
    $id = "F".$Nt;
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $borrar_funcionario = "DELETE FROM trabajadores WHERE NTrabajador = \"$Nt\"";
    $borrar_usuario = "DELETE FROM usuarios WHERE id_usuario = \"$id\"";
    mysqli_query($conexion,$borrar_funcionario);
    mysqli_query($conexion,$borrar_usuario);
    mysqli_close($conexion);
  }
  header('location: ./Gestion-de-usuarios.php');
?>
