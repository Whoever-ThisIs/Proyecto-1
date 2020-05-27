<?php
  session_id();
  session_start();
  //if (isset($_SESSION['IDK']))
  //{
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title> Que vamos a hacer hoy? </title>
              </head>
              <body>
                <form class='' action='add.php' method='post'>
                  <div class='contenedor'>
                    <fieldset>
                      <legend> <h1> Que producto quieres añadir? </h1> </legend>
                        <p>Nombre </p>
                        <input type='text' name='nombre'>
                        <p> Precio </p>
                        $<input type='text' name='precio' min='1'>
                        <br>
                        <input type='submit' value='Agregar'>
                    </fieldset>
                  </div>
                </form>
              </body>
            </html>";
  //}
  //else
    //header('location: ../Templates/Inicio_sesion.html')
?>
