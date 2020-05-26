<?php
  $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
  $consulta = "SELECT * FROM grupos";
  $respuesta = mysqli_query($conexion,$consulta);
  $group = mysqli_fetch_array($respuesta,MYSQLI_ASSOC);
  echo "<!DOCTYPE html>
          <html lang='es' dir='ltr'>
            <head>
              <meta charset='utf-8'>
              <title>REGISTRO DE ALUMNOS</title>
            </head>
            <body>
              <form method='POST' action='#.php'>
                <fieldset>
                  <legend> <h1> Registrar usuario </h1> </legend>
                  Nombre:
                  <br>
                  <input type='text' name='nombre' pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas' required placeholder='&#128100; Nombre'>
                  <input type='hidden' name='tipo_usuario' value='Alumno'>
                  <br>
                  Apellido paterno:
                  <br>
                  <input type='text' name='ApellidoPat' placeholder='&#128100; Apellido Paterno' required pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas'>
                  <br>
                  No. Cuenta:
                  <br>
                  <input type='text' name='Ncuenta' pattern='^\d{9}' placeholder='&#8470; (sin guion)' title='Ingresa un numero de cuenta valido' required>
                  <br>
                  Grupo:
                  <br>
                  <select name='Grupo'>";
  echo            "<option value='" . $group['id_grupo'] . "'>". $group['grupo'] ."</option>";
  while ($group = mysqli_fetch_array($respuesta))
    echo            "<option value='" . $group['id_grupo'] . "'>". $group['grupo'] ."</option>";
  echo            "</select>
                  <br>
                  Contraseña:
                  <br>
                  <input type='password' name='password' placeholder='&#128272; Contraseña'>
                  <br>
                  <input type='submit' name='' value='Enviar'>
                </fieldset>
              </form>
            </body>
          </html> ";
?>
