<?php
  $id=$_POST['id'];
  $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
  $SQL_busqueda_sancion = "DELETE FROM lista_negra WHERE id_usuario='$id'";
  $consulta = mysqli_query($conexion,$SQL_busqueda_sancion);
  header("Location: ./Gestion-de-usuarios.php")
 ?>
