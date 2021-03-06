<?php
  //Funciones para la conexión de la base de datos
  include("bd.php");
  include("des-cifrado.php");


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
    ";
    $password = (isset($_POST['password']) && $_POST['password'] != "") ? escapeall($_POST['password']) : false ;
    $usr = (isset($_POST['id']) && $_POST['id'] != "") ? escapeall($_POST['id']) : false ;
    if ($usr!==false&&$password!==false) {
      if (preg_match('/^AD/',$usr)) {
        $SQL_usuario = "SELECT id_admin FROM administradores WHERE id_admin='$usr'";
        $consulta_usuario = mysqli_query($conexion, $SQL_usuario);
        $usuario = mysqli_fetch_array($consulta_usuario);
      }
      elseif (preg_match('/^M/',$usr)) {
        $SQL_usuario = "SELECT nIdentificador FROM mensajeros WHERE nIdentificador='$usr'";
        $consulta_usuario = mysqli_query($conexion, $SQL_usuario);
        $usuario = mysqli_fetch_array($consulta_usuario);
      }
      else {
        $SQL_usuario = "SELECT id_usuario FROM usuarios WHERE id_usuario='$usr'";
        $consulta_usuario = mysqli_query($conexion, $SQL_usuario);
        $usuario = mysqli_fetch_array($consulta_usuario);
      }
      if (isset($usuario)) {
        if (preg_match('/^AD/',$usr)) {
          $true=consultapass2($conexion,$usr,$password);
        }
        elseif (preg_match('/^M/',$usr)) {
          $true=consultapass3($conexion,$usr,$password);
        }
        else {
          $true=consultapass($conexion,$usr,$password);
        }
        if ($true==1) {
          session_name("cafeteria");
          session_id("7181414");
          session_start();
          if (preg_match('/^([TPF]|A(?!D))/',$usr)) {
            $_SESSION['usuario']=$usr;
            header('Location: menu.php');
          }
          elseif (preg_match('/^AD/',$usr)) {
            $_SESSION['admin']=$usr;
            header('Location: ../../SitioAdmin/Dynamics/Panel-Control.php');
          }
          elseif (preg_match('/^M/',$usr)) {
            $_SESSION['mensajero']=$usr;
            header('Location: ../../SitioTrab/dynamics/panel_de_control_trab.php');
          }
        }

        else
        {
          echo "Ningún usuario coincide con esa contraseña <br>
          <button onclick=\"location.href='../Templates/InicioDeSesion.html'\">Inicio de sesión</button>";
        }
      }
      else {
        echo "No hay ningún usuario con ese nombre <br>
        <button onclick=\"location.href='DBConnect.php'\">Registro</button>";
      }
    }
    else
    {
      echo "Error al recibir los datos.<br>Asegúrate de haber rellenado ambos campos<br>
      <button onclick=\"location.href='./Bienvenida.php'\">Bienvenida</button>";
    }
    mysqli_close($conexion);
    echo
    "
        </body>
      </html>
    ";
  }
 ?>
