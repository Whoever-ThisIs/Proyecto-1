<?php
  session_id("7181414");
  session_name("cafeteria");
  session_start();
  echo "<!DOCTYPE html>
          <html lang='es' dir='ltr'>
            <head>
              <meta charset='utf-8'>
              <title> Que vamos a hacer hoy? </title>
            </head>
            <body>
              <fieldset>
                <legend> <h1> Que vamos a hacer hoy? </h1> </legend>
                  <h3><a href='Gestion-de-alimentos.php'> Gestionar Productos </a> </h3>
                  <br>
                  <h3><a href='Gestion-de-usuarios.php'> Gestionar Usuarios </a> </h3>
                  <br>
                  <h3><a href='../Templates/agregar.html'> Añadir/Eliminar Usuarios </a> </h3>
              </fieldset>
              <button onclick=\"location.href='../../SitioUsr/Dynamics/cierre_sesion.php'\">Cerrar sesión</button>
            </body>
          </html>";
?>
