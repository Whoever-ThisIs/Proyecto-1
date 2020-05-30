<?php
  $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
  include("Dynamics/des-cifrado.php");

  $id="AD1";
  $pass="Juan";
  $nom="Juan";
  $salt=salt();
  $contra=registro($pass,$salt);
  $consulta="INSERT INTO administradores(id_admin, Password, Nombre, condimento) VALUES ('$id','$contra','$nom','$salt')";
  mysqli_query($conexion, $consulta);
?>
