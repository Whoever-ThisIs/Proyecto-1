<?php
  session_id();
  session_start();
  //if (isset($_SESSION['IDK']))
  //{
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title> Panel de control (Productos) </title>
              </head>
              <body>
                <div class='contenedor'>
                  <fieldset>
                    <legend> <h1> Que vamos a hacer hoy? </h1> </legend>
                      <h3><a href='#'> Añadir producto </a> </h3>
                      <br>
                      <h3><a href='#'> Modificar un producto existente </a> </h3>
                      <br>
                      <h3><a href='#'> Eliminar producto </a> </h3>
                  </fieldset>
                </div>
              </body>
            </html>";
  //}
  //else
    //header('location: ../Templates/Inicio_sesion.html')
?>
