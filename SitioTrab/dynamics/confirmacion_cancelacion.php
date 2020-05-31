<?php
  include("../../SitioUsr/Dynamics/des-cifrado.php");
  $pedido=escapeall($_POST['pedido']);
  $usr=escapeall($_POST['usr']);
  $razon=escapeall($_POST['razon']);
  $comentarios = (isset($_POST['comentario']) && $_POST['comentario'] != "") ? escapeall($_POST['comentario']) : false ;
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

    $valor_comentario="";
    if ($comentarios!==false) {
      $valor_comentario=", comentario";
      $comentarios = ", '".$comentarios."'";
    }
    else {
      $comentarios = "";
    }
    $SQL_act_estatus = "UPDATE pedidos SET id_estatus=3 WHERE id_pedido=$pedido";
    $consulta_act_estatus = mysqli_query($conexion, $SQL_act_estatus);
    $SQL_cancelaciones = "INSERT INTO cancelaciones(id_pedido, id_usuario, id_razon".$valor_comentario.") VALUES ($pedido, '$usr', $razon".$comentarios.")";
    $consulta_cancelaciones = mysqli_query($conexion, $SQL_cancelaciones);
    //id_cancelacion
    $SQL_id_cancelacion = "SELECT max(id_cancelacion) FROM cancelaciones";
    $consulta_id_cancelacion = mysqli_query($conexion, $SQL_id_cancelacion);
    $id_cancelacion = mysqli_fetch_array($consulta_id_cancelacion);
    //Fecha final
    $SQL_fecha = "SELECT DATE_ADD(cancelaciones.fecha, INTERVAL 5 DAY) FROM cancelaciones WHERE id_cancelacion=$id_cancelacion[0]";
    $consulta_fecha = mysqli_query($conexion, $SQL_fecha);
    $fecha = mysqli_fetch_array($consulta_fecha);
    // Lista negra
    $SQL_lista_negra = "INSERT INTO lista_negra(id_usuario, id_cancelacion, fecha_final) VALUES ('$usr', $id_cancelacion[0], '$fecha[0]')";
    $consulta_lista_negra = mysqli_query($conexion, $SQL_lista_negra);
    $lista_negra = mysqli_fetch_array($consulta_lista_negra);
    header("Location: ./panel_de_control_trab.php");
  }
 ?>
