<?php
  $pedido=$_POST['pedido'];
  include("bd.php");
  $_SESSION['mensajero']="Juan";
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else
  {
    $SQL_entrega1 = "UPDATE pedidos SET id_estatus=2 WHERE id_pedido=".$pedido;
    $consulta_entrega1 = mysqli_query($conexion, $SQL_entrega1);
    $entrega1 = mysqli_fetch_array($consulta_entrega1);
    header("Location:./panel_de_control_trab.php");
  }
 ?>
