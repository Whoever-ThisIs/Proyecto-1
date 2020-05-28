<?php
  // session_name("cafeteria");
  // session_id("319014215");
  // session_start();
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
                        <input type='text' name='nombre' pattern='[A-ZÁÉÍÓÚÜÑ]{1}[a-záéíóüúñ\s]+' title='No pongas espacios al principio.' required>
                        <p> Precio </p>
                        $<input type='number' name='precio' min='1' max='100' required >
                        <br>
                        <p> Cantidad </p>
                        <input type='number' name='cantidad' min='1' max='100' required >
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
