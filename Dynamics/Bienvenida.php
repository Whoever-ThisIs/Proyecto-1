<?php
  session_start();
  if (isset($_SESSION['usuario']))
    header('location: ./Menu.php');
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
                  <legend> <h1>Bienvenid@. Que desea hacer?</h1> </legend>
                  <h3> <a href='Inicio de sesion.html'> Iniciar sesion </a> </h3>
                  <h3> <a href='Tipo de usuario.html'> Registrarme  </a> </h3>
                </fieldset>
              </body>
            </html>";
  }
?>
