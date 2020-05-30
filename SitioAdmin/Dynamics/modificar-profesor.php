<?php
  if (isset($_POST['id']))
  {
    $id = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $profesor = "SELECT * FROM profesores NATURAL JOIN colegios WHERE RFC = \"$id\"";
    $profesor = mysqli_query($conexion,$profesor);
    $profesor = mysqli_fetch_array($profesor);
    $colegio = "SELECT * FROM colegios WHERE id_colegio <> " . $profesor['id_colegio'];
    $colegio = mysqli_query($conexion,$colegio);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title>Modificar profesor</title>
              </head>
              <body>
                <div>
                  <fieldset>
                    <legend><h1>Modificar Profesor</h1></legend>
                    <form method='POST' action='Mod-profesor.php'>
                      <input type='hidden' name='id' value='" . $profesor['RFC'] . "'>
                      <p>Nombre</p>
                      <input type='text' name='nombre' value='" . $profesor['Nombre'] . "' required>
                      <p> Apelido Paterno </p>
                      <input type='text' name='paterno' value='" . $profesor['ApellidoPat'] . "' required>
                      <p> Colegio </p>
                      <select name='colegio'>
                        <option value='" . $profesor['id_colegio'] . "'>" . $profesor['Colegio'] . " </option>";
    while ($colegios = mysqli_fetch_array($colegio))
      echo              "<option value='" . $colegios['id_colegio'] . "'> " . $colegios['Colegio'] . " </option>";
    echo              "</select>
                      <p> RFC </p>
                      <input type='text' name='RFC' value='" . $profesor['RFC'] . "'>
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
