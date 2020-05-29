<?php
  if (isset($_POST['id'])) {
    $Nc = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $alumno = "SELECT * FROM alumnos LEFT JOIN grupos ON alumnos.grupo = grupos.id_grupo WHERE Ncuenta = \"$Nc\"";
    $alumno = mysqli_query($conexion,$alumno);
    $alumno = mysqli_fetch_array($alumno);
    $grupo = "SELECT * FROM grupos WHERE id_grupo <> " . $alumno['id_grupo'];
    $grupo = mysqli_query($conexion,$grupo);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title></title>
              </head>
              <body>
                <div class='fieldset'>
                  <fieldset>
                    <legend><h1>Editar Alumno</h1></legend>
                    <form method='POST' action='./Mod-alumno.php'>
                      <input type='hidden' name='id' value='" . $Nc . "'>
                      <p>Nombre:</p>
                      <input type='text' name='nombre' value='" . $alumno['Nombre'] . "'>
                      <br>
                      <p>Apelido Paterno:</p>
                      <input type='text' name='Paterno' value='" . $alumno['ApellidoPat'] . "'>
                      <p>Grupo:</p>
                      <select name='grupo'>
                        <option value='" . $alumno['id_grupo'] ."'> " . $alumno['grupo'] ." </option>";
    while ($group = mysqli_fetch_array($grupo))
      echo              "<option value='" . $group['id_grupo'] ."'> " . $group['grupo'] . " </option>";
    echo              "</select>
                      <p> Numero de cuenta</p>
                      <input type='number' name='Ncuenta' value='" . $alumno['Ncuenta'] ."' >
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
