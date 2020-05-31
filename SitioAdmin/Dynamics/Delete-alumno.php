<?php
  if (isset($_POST['id'])) {
    $Nc = $_POST['id'];
    $id = "A".$Nc;
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    $borrar_alumno = "DELETE FROM alumnos WHERE Ncuenta = \"$Nc\"";
    $borrar_usuario = "DELETE FROM usuarios WHERE id_usuario = \"$id\"";
    mysqli_query($conexion,$borrar_alumno);
    mysqli_query($conexion,$borrar_usuario);
    mysqli_close($conexion);
  }
  header('location: ./Gestion-de-usuarios.php');
?>
