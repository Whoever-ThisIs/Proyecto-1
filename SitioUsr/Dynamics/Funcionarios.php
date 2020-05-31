<?php
  include("./bd.php");
  $conexion = connectDB2("cafeteria");
  $consulta = "SELECT * FROM colegios";
  $respuesta = mysqli_query($conexion,$consulta);
  $colegio = mysqli_fetch_array($respuesta,MYSQLI_ASSOC);
  echo "<!DOCTYPE html>
          <html lang='es' dir='ltr'>
            <head>
              <meta charset='utf-8'>
              <title>REGISTRO DE FUNCIONARIO</title>
            </head>
            <body>
              <form method='POST' action='registro.php'>
                <fieldset>
                  <legend> <h1> Registrar usuario </h1> </legend>
                  Nombre:
                  <br>
                  <input type='text' name='nombre' pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas' required placeholder='&#128100; Nombre'>
                  <input type='hidden' name='tipo_usuario' value='Funcionario'>
                  <br>
                  Apellido paterno:
                  <br>
                  <input type='text' name='ApellidoPat' placeholder='&#128100; Apellido Paterno' required pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas'>
                  <br>
                  RFC:
                  <br>
                  <input type='text' name='RFC' placeholder='&#128100; RFC' pattern='^[A-ZÑ&]{4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[A-Z0-9_]{3}$' title='Tiene que cumplir con las caracteristicas de un RFC' required>
                  <br>
                  Colegio:
                  <br>
                  <select name='Colegio'>";
  echo             "<option value='" . $colegio['id_colegio'] . "'>". $colegio['Colegio'] ."</option>";
  while ($colegio = mysqli_fetch_array($respuesta))
    echo           "<option value='" . $colegio['id_colegio'] . "'>". $colegio['Colegio'] ."</option>";
  echo           "</select>
                  <br>
                  Contraseña:
                  <br>
                  <input type='password' name='password' placeholder='&#128272; Contraseña' title='La contraseña debe de contener más de 8 carácteres, al menos una mayuscula, una minúscula y un número' pattern='^(?=\P{Ll}*\p{Ll})(?=\P{Lu}*\p{Lu})(?=\P{N}*\p{N})(?=[\p{L}\p{N}]*[^\p{L}\p{N}])[\s\S]{8,}$' required>
                  <br>
                  <input type='submit' name='' value='Enviar'>
                </fieldset>
              </form>
            </body>
          </html> ";
?>
