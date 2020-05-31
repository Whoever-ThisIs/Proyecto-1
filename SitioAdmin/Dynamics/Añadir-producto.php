<?php
  echo "
  <!DOCTYPE html>
  <html lang='es' dir='ltr'>
    <head>
      <meta charset='utf-8'>
      <title> Añadir producto </title>
    </head>
    <body>
      <form class='' action='add.php' method='post'>
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
      </form>
      <button onclick=\"location.href='Panel-Control.php'\">Volver al panel de control</button>
    </body>
  </html>";
?>
