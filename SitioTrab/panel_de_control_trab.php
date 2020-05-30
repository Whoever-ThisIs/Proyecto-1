<?php
  session_name("cafeteria");
  session_id("7181414");
  session_start();
  include("bd.php");
  $_SESSION['mensajero']="Juan";
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else {
    //Inicio de HTML
    echo "
    <!DOCTYPE html>
    <html lang=\"es\" dir=\"ltr\">
      <head>
        <meta charset=\"utf-8\">
        <title>Menú</title>
      </head>
      <body>
        <table>
    ";
    $SQL_mensajero = "SELECT id_mensajero FROM mensajeros WHERE Nombre='$_SESSION[mensajero]'";
    $consulta_mensajero = mysqli_query($conexion, $SQL_mensajero);
    $mensajero = mysqli_fetch_array($consulta_mensajero);
    if (isset($mensajero)) {
      $SQL_asignaciones = "SELECT id_asignaciones FROM asignacioness WHERE Nombre='$_SESSION[asignaciones]'";
      $consulta_asignaciones = mysqli_query($conexion, $SQL_asignaciones);
      $asignaciones = mysqli_fetch_array($consulta_asignaciones);
      if (isset($asignaciones)) {
        print_r($asignaciones);
      }
      else {
        echo "No hay asignaciones";
      }
    }
    else {
      echo "No hay un mensajero registrado con ese nombre";
    }
  }
 ?>
