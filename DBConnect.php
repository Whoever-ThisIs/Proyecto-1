<?php
  include("bd.php");

  $conexion = connectDB2("cafeteria");
  if (!$conexion) {
    echo mysqli_connect_error()."<br />";
    echo mysqli_connect_error()."<br />";
    exit();
  }
  else {
    session_name("cafeteria");
    session_id("7181414");
    session_start();
    if (isset($_SESSION['usuario'])){
      header('location: menu.php');
    }
    else
    {
      echo "<!DOCTYPE html>
              <html lang='es' dir='ltr'>
                <head>
                  <meta charset='utf-8'>
                  <link rel='stylesheet' href='../Statics/css/Bienvenida.css'>
                  <link rel='shortcut icon' href='../Statics/img/logo.ico'>
                  <title> Bienvenida </title>
                </head>
                <body>
                  <fieldset>
                    <legend> <h1>Bienvenid@. ¿Qué desea hacer?</h1> </legend>
                    <h3> <a href='Templates/InicioDeSesión.html'> Iniciar sesion </a> </h3>
                    <h3> <a href='Templates/TipoDeUsuario.html'> Registrarme  </a> </h3>
                  </fieldset>
                </body>
              </html>";
    }

    echo "Hora de conectar";
  }

?>
