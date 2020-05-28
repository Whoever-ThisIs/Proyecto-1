<?php
  session_id();
  session_start();
  //if (isset($_SESSION[''])) {
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title> Modificar producto </title>
              </head>
              <body>
                <form action='./mod.php' method='POST'>
                  <div class='fieldset'>
                    <fieldset>
                      <legend><h1> Modificar Producto </h1></legend>
                      <p>Introduce el Id del producto que quieres modificar</p>
                      <input type='number' min='1' name='id'>
                      <br>
                      <br>
                      <input type='submit' value=' Enviar '>
                    </fieldset>
                  </div>
                </form>
              </body>
            </html>";
  //}
  //else
  //header('location: ../Templates/')
?>
