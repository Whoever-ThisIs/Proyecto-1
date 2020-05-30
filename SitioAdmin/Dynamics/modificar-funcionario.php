<?php
  if (isset($_POST['id']))
  {
    $id = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $funcionario = "SELECT * FROM funcionarios NATURAL JOIN colegios WHERE RFC = \"$id\"";
    $funcionario = mysqli_query($conexion,$funcionario);
    $funcionario = mysqli_fetch_array($funcionario);
    $colegio = "SELECT * FROM colegios WHERE id_colegio <> " . $funcionario['id_colegio'];
    $colegio = mysqli_query($conexion,$colegio);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title>Modificar funcionario</title>
              </head>
              <body>
                <div>
                  <fieldset>
                    <legend><h1>Modificar Funcionario</h1></legend>
                    <form method='POST' action='Mod-funcionario.php'>
                      <input type='hidden' name='id' value='" . $funcionario['RFC'] . "'>
                      <p>Nombre</p>
                      <input type='text' name='nombre' value='" . $funcionario['Nombre'] . "' required>
                      <p> Apelido Paterno </p>
                      <input type='text' name='paterno' value='" . $funcionario['ApellidoPat'] . "' required>
                      <p> Colegio </p>
                      <select name='colegio'>
                        <option value='" . $funcionario['id_colegio'] . "'>" . $funcionario['Colegio'] . " </option>";
    while ($colegios = mysqli_fetch_array($colegio))
      echo              "<option value='" . $colegios['id_colegio'] . "'> " . $colegios['Colegio'] . " </option>";
    echo              "</select>
                      <p> RFC </p>
                      <input type='text' name='RFC' value='" . $funcionario['RFC'] . "'>
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
