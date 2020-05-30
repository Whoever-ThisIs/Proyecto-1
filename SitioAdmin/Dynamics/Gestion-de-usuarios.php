<?php
// session_name();
// session_id();
// session_start();
// if (isset($_SESSION[''])) {
  function sancion($prefijo, $usr, $conexion){
    $usuario=$prefijo.$usr;
    $SQL_busqueda_sancion = "SELECT id_usuario FROM lista_negra WHERE id_usuario = '$usuario'";
    $consulta = mysqli_query($conexion,$SQL_busqueda_sancion);
    $busqueda_sancion = mysqli_fetch_array($consulta);
    if (isset($busqueda_sancion))
      $sancion="Sí";
    else
      $sancion="No";
    return $sancion;
  }
  $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
  $alumno = "SELECT * FROM alumnos LEFT JOIN grupos ON alumnos.grupo = grupos.id_grupo";
  $profesor = "SELECT * FROM profesores NATURAL JOIN colegios";
  $funcionario = "SELECT * FROM funcionarios NATURAL JOIN colegios";
  $trabajador = "SELECT * FROM trabajadores";
  $respuesta_alumno = mysqli_query($conexion,$alumno);
  $respuesta_profesor = mysqli_query($conexion,$profesor);
  $respuesta_funcionario = mysqli_query($conexion,$funcionario);
  $respuesta_trabajador = mysqli_query($conexion,$trabajador);
  echo "
  <!DOCTYPE html>
  <html lang='es' dir='ltr'>
    <head>
      <meta charset='utf-8'>
      <title></title>
    </head>
    <body>
      <div>
        <fieldset>
          <legend><h1> Alumnos </h1></legend>
          <table>
            <tr>
              <th> Nombre </th>
              <th> Apellido Paterno </th>
              <th> No Cuenta </th>
              <th> Grupo </th>
              <th> Sanción </th>
              <th> Editar </th>
              <th> Eliminar </th>
            </tr>";
  while ($alumno = mysqli_fetch_array($respuesta_alumno,MYSQLI_ASSOC))
  {
    $sancion=sancion("A", $alumno['Ncuenta'], $conexion);
      echo "<tr>
              <td> " . $alumno['Nombre'] ." </td>
              <td> " . $alumno['ApellidoPat'] ." </td>
              <td> " . $alumno['Ncuenta'] ." </td>
              <td> " . $alumno['grupo'] ." </td>
              <td> $sancion </td>
              <form method='POST' action='./Modificar-alumno.php'>
                <input type='hidden' name='id' value='A" . $alumno['Ncuenta'] . "'>
                <td>
                  <input type='submit' value='Editar'>
                </td>
              </form>
              <form action='delete-alumno.php' method='POST'>
                <input type='hidden' name='id' value='" . $alumno['Ncuenta'] . "'>
                <td>
                  <input type='submit' value='Eliminar'>
                </td>
              </form>";
      if ($sancion=="Sí") {
        echo "<form action='delete-sancion.php' method='POST'>
                <input type='hidden' name='id' value='A" . $alumno['Ncuenta'] . "'>
                <td>
                  <input type='submit' value='Eliminar sancion'>
                </td>
              </form>";
      }
      echo"
            </tr>";
  }
  echo   "</table>
        </fieldset>
        <fieldset>
          <legend><h1> Profesores </h1></legend>
          <table>
            <tr>
              <th> Nombre </th>
              <th> Apellido Paterno </th>
              <th> RFC </th>
              <th> Colegio </th>
              <th> Sanción </th>
              <th> Editar </th>
              <th> Eliminar </th>
            </tr>";
  while ($profesor = mysqli_fetch_array($respuesta_profesor,MYSQLI_ASSOC)) {
    $sancion=sancion("P", $profesor['RFC'], $conexion);
      echo "<tr>
              <td> " . $profesor['Nombre'] . " </td>
              <td> " . $profesor['ApellidoPat'] . " </td>
              <td> " . $profesor['RFC'] . " </td>
              <td> " . $profesor['Colegio'] . " </td>
              <td> $sancion</td>
              <form method='POST' action='./modificar-profesor.php'>
                <input type='hidden' name='id' value='" . $profesor['RFC'] . "'>
                <td>
                  <input type='submit' value='Editar'>
                </td>
              </form>
              <form action='delete-profesores.php' method='POST'>
                <input type='hidden' name='id' value='" . $profesor['RFC'] . "'>
                <td>
                  <input type='submit' value='Eliminar'>
                </td>
              </form>";
      if ($sancion=="Sí") {
        echo "<form action='delete-sancion.php' method='POST'>
                <input type='hidden' name='id' value='P" . $profesor['RFC'] . "'>
                <td>
                  <input type='submit' value='Eliminar sancion'>
                </td>
              </form>";
      }
      echo"
            </tr>";
  }
  echo   "</table>
        </fieldset>
        <fieldset>
          <legend><h1> Funcionarios </h1></legend>
          <table>
            <tr>
              <th> Nombre </th>
              <th> Apellido Paterno </th>
              <th> RFC </th>
              <th> Colegio </th>
              <th> Sanción </th>
              <th> Editar </th>
              <th> Eliminar </th>
            </tr>";
  while ($funcionario = mysqli_fetch_array($respuesta_funcionario,MYSQLI_ASSOC)) {
    $sancion=sancion("F", $funcionario['RFC'], $conexion);
      echo "<tr>
              <td> " . $funcionario['Nombre'] . " </td>
              <td> " . $funcionario['ApellidoPat'] . " </td>
              <td> " . $funcionario['RFC'] . " </td>
              <td> " . $funcionario['Colegio'] . " </td>
              <td> $sancion</td>
              <form method='POST' action='./modificar-usuario.php'>
                <input type='hidden' name='id' value='F" . $funcionario['RFC'] . "'>
                <input type='hidden' name='tipo' value='funcionarios' >
                <td>
                  <input type='submit' value='Editar'>
                </td>
              </form>
              <form action='delete-funcionario.php' method='POST'>
                <input type='hidden' name='id' value='" . $funcionario['RFC'] ."'>
                <input type='hidden' name='tipo' value='funcionarios'>
                <td>
                  <input type='submit' value='Eliminar'>
                </td>
              </form>";
      if ($sancion=="Sí") {
        echo "<form action='delete-sancion.php' method='POST'>
                <input type='hidden' name='id' value='" . $funcionario['RFC'] . "'>
                <td>
                  <input type='submit' value='Eliminar sancion'>
                </td>
              </form>";
      }
      echo"
            </tr>";
  }
  echo   "</table>
        </fieldset>
        <fieldset>
          <legend><h1> Trabajadores </h1></legend>
          <table>
            <tr>
              <th> Nombre </th>
              <th> Apellido Paterno </th>
              <th> No Trabajador </th>
              <th> Sanción </th>
              <th> Editar </th>
              <th> Eliminar </th>
            </tr>";
  while ($trabajador = mysqli_fetch_array($respuesta_trabajador,MYSQLI_ASSOC)) {
    $sancion=sancion("T", $trabajador['NTrabajador'], $conexion);
      echo "<tr>
              <td> " . $trabajador['Nombre'] . " </td>
              <td> " . $trabajador['ApellidoPat'] . " </td>
              <td> " . $trabajador['NTrabajador'] . " </td>
              <td> $sancion </td>
              <form method='POST' action='./modificar-usuario.php'>
                <input type='hidden' name='id' value='" . $trabajador['NTrabajador'] . "'>
                <input type='hidden' name='tipo' value='trabajadores' >
                <td>
                  <input type='submit' value='Editar'>
                </td>
              </form>
              <form action='delete-trabajador.php' method='POST'>
                <input type='hidden' name='id' value='" . $trabajador['NTrabajador'] ."'>
                <input type='hidden' name='tipo' value='trabajadores'>
                <td>
                  <input type='submit' value='Eliminar'>
                </td>
              </form>";
      if ($sancion=="Sí") {
        echo "<form action='delete-sancion.php' method='POST'>
                <input type='hidden' name='id' value='T" . $trabajador['NTrabajador'] . "'>
                <td>
                  <input type='submit' value='Eliminar sancion'>
                </td>
              </form>";
      }
      echo"
            </tr>";
  }
  echo   "</table>
        </fieldset>
      </div>
    </body>
  </html>";
  mysqli_close($conexion);
// }
?>
