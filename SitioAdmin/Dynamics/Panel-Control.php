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
                <form class='' action='#.php' method='post'>
                  <div class='contenedor'>
                    <fieldset>
                      <legend> <h1> Que vamos a hacer hoy? </h1> </legend>
                        <h3><a href='#'> Gestionar Productos </a> </h3>
                        <br>
                        <h3><a href='#'> Gestionar Usuarios </a> </h3>
                    </fieldset>
                  </div>
                </form>
              </body>
            </html>";
  //}
  //else
    //header('location: ../Templates/Inicio_sesion.html')
?>
