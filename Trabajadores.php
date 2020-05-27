<?php
  echo "
    <!DOCTYPE html>
      <html lang='es' dir='ltr'>
        <head>
          <meta charset='utf-8'>
          <title>REGISTRO DE TRABAJADOR</title>
        </head>
        <body>
          <form method='POST' action='registro.php'>
            <fieldset>
              <legend> <h1> Registrar usuario </h1> </legend>
              Nombre:
              <br>
              <input type='text' name='nombre' pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas' required placeholder='&#128100; Nombre'>
              <input type='hidden' name='tipo_usuario' value='Trabajador'>
              <br>
              Apellido paterno:
              <br>
              <input type='text' name='ApellidoPat' placeholder='&#128100; Apellido Paterno' required pattern='^[A-ZÁÉÍÓÚÜÑ][a-záéíóüúñ]+($|\s?[A-ZÁÉÍÓÚÜÑ]+[a-záéíóüúñ]+$)' title='Recuerda como se usan las mayusculas'>
              <br>
              No. Trabajador:
              <br>
              <input type='text' name='Ntrabajador' pattern='^\d{9}' placeholder='&#8470; (sin guion)' title='Ingresa un numero de trabajador valido' required>
              <br>
              Contraseña:
              <br>
              <input type='password' name='password' placeholder='&#128272; Contraseña'>
              <br>
              <input type='submit' name='' value='Enviar'>
            </fieldset>
          </form>
        </body>
      </html>
  ";
?>
