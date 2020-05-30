<?php
  if (isset($_POST['id'])) {
    $Nc = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $trabajador = "SELECT * FROM trabajadores";
    $trabajador = mysqli_query($conexion,$trabajador);
    $trabajador = mysqli_fetch_array($trabajador);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title></title>
              </head>
              <body>
                <div class='fieldset'>
                  <fieldset>
                    <legend><h1>Editar trabajador</h1></legend>
                    <form method='POST' action='./Mod-trabajador.php'>
                      <input type='hidden' name='id' value='" . $Nc . "'>
                      <p>Nombre:</p>
                      <input type='text' name='nombre' value='" . $trabajador['Nombre'] . "'>
                      <br>
                      <p>Apelido Paterno:</p>
                      <input type='text' name='Paterno' value='" . $trabajador['ApellidoPat'] . "'>
                      <p> Numero de cuenta</p>
                      <input type='number' name='NTrabajador' value='" . $trabajador['NTrabajador'] ."' >
                      <br>
                      <br>
                      <input type='submit' value='Cambiar'>
                    </form>
                  </fieldset>
                </div>
              </body>
            </html>";
  }
?>
