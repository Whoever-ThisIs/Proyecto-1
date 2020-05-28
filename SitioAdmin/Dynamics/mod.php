<?php
  if (isset($_POST['id']))
  {
    if ($_POST['id'] >= 1) {
      $id = $_POST['id'];
      $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
      $consulta = "SELECT * FROM alimentos WHERE id_alimento = '" . $id . "'";
      $respuesta = mysqli_query($conexion,$consulta);
      $consulta = mysqli_fetch_array($respuesta,MYSQLI_ASSOC);
      echo "<!DOCTYPE html>
              <html lang='es' dir='ltr'>
                <head>
                  <meta charset='utf-8'>
                  <title></title>
                </head>
                <body>
                  <form action='modificar.php' method='POST'>
                    <div class='fieldset'>
                      <fieldset>
                        <legend> <h1> Por favor haga los cambios que desee </h1> </legend>
                        ";
      if ($consulta != "") {
        echo "          <p> Nombre: </p>
                        <input type='hidden' value='". $id ."' name='id'>
                        <input type='text' value='" . $consulta['nombre'] . "' name='nombre' pattern='[A-ZÁÉÍÓÚÜÑ]{1}[a-záéíóüúñ\s]+' title='Solo puedes introducir caracteres del alfabeto latino' required>
                        <p> Precio: </p>
                        $<input type='number' value='" . $consulta['precio'] . "' name='precio'  title='Solo puedes introducir numeros :)' required>
                        <br>
                        <input type='submit' value='Cambiar'>";
      }
      else
        echo            "Id de producto no encontrado, por favor revise el id de su producto.";
      echo            "</fieldset>
                    </div>
                  </form>
                </body>
              </html>";
    }
  }
  else
    header('location: ./Modificar.php')
?>
