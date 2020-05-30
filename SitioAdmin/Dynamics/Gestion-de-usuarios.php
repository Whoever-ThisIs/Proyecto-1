<?php
// session_name();
// session_id();
// session_start();
// if (isset($_SESSION[''])) {
    $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
    $alumno = "SELECT * FROM alumnos LEFT JOIN grupos ON alumnos.grupo = grupos.id_grupo";
    $profesor = "SELECT * FROM profesores NATURAL JOIN colegios";
    $funcionario = "SELECT * FROM funcionarios NATURAL JOIN colegios";
    $trabajador = "SELECT * FROM trabajadores";
    $respuesta_alumno = mysqli_query($conexion,$alumno);
    $respuesta_profesor = mysqli_query($conexion,$profesor);
    $respuesta_funcionario = mysqli_query($conexion,$funcionario);
    $respuesta_trabajador = mysqli_query($conexion,$trabajador);
    echo "<!DOCTYPE html>
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
                              <th> Estado </th>
                              <th> Editar </th>
                              <th> Eliminar </th>
                            </tr>";
    while ($alumno = mysqli_fetch_array($respuesta_alumno,MYSQLI_ASSOC))
    {
        echo            "<tr>
                              <td> " . $alumno['Nombre'] ." </td>
                              <td> " . $alumno['ApellidoPat'] ." </td>
                              <td> " . $alumno['Ncuenta'] ." </td>
                              <td> " . $alumno['grupo'] ." </td>
                              <td> </td>
                              <form method='POST' action='./Modificar-alumno.php'>
                                <input type='hidden' name='id' value='" . $alumno['Ncuenta'] . "'>
                                <td>
                                  <input type='submit' value='Editar'>
                                </td>
                              </form>
                              <form action='delete-alumno.php' method='POST'>
                                <input type='hidden' name='id' value='" . $alumno['Ncuenta'] . "'>
                                <td>
                                  <input type='submit' value='Eliminar'>
                                </td>
                              </form>
                            </tr>";
    }
    echo            "</table>
                        </fieldset>
                        <fieldset>
                          <legend><h1> Maestros </h1></legend>
                          <table>
                            <tr>
                              <th> Nombre </th>
                              <th> Apellido Paterno </th>
                              <th> RFC </th>
                              <th> Colegio </th>
                              <th> Estado </th>
                              <th> Editar </th>
                              <th> Eliminar </th>
                            </tr>";
    while ($profesor = mysqli_fetch_array($respuesta_profesor,MYSQLI_ASSOC)) {
        echo            "<tr>
                              <td> " . $profesor['Nombre'] . " </td>
                              <td> " . $profesor['ApellidoPat'] . " </td>
                              <td> " . $profesor['RFC'] . " </td>
                              <td> " . $profesor['Colegio'] . " </td>
                              <td> </td>
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
                              </form>
                            </tr>";
    }
    echo            "</table>
                        </fieldset>
                        <fieldset>
                          <legend><h1> Funcionarios </h1></legend>
                          <table>
                            <tr>
                              <th> Nombre </th>
                              <th> Apellido Paterno </th>
                              <th> RFC </th>
                              <th> Colegio </th>
                              <th> Estado </th>
                              <th> Editar </th>
                              <th> Eliminar </th>
                            </tr>";
    while ($funcionario = mysqli_fetch_array($respuesta_funcionario,MYSQLI_ASSOC)) {
        echo            "<tr>
                              <td> " . $funcionario['Nombre'] . " </td>
                              <td> " . $funcionario['ApellidoPat'] . " </td>
                              <td> " . $funcionario['RFC'] . " </td>
                              <td> " . $funcionario['Colegio'] . " </td>
                              <td> </td>
                              <form method='POST' action='./modificar-funcionario.php'>
                                <input type='hidden' name='id' value='" . $funcionario['RFC'] . "'>
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
                              </form>
                            </tr>";
    }
    echo            "</table>
                        </fieldset>
                        <fieldset>
                          <legend><h1> Trabajadores </h1></legend>
                          <table>
                            <tr>
                              <th> Nombre </th>
                              <th> Apellido Paterno </th>
                              <th> No Trabajador </th>
                              <th> Estado </th>
                              <th> Editar </th>
                              <th> Eliminar </th>
                            </tr>";
    while ($trabajador = mysqli_fetch_array($respuesta_trabajador,MYSQLI_ASSOC)) {
        echo            "<tr>
                              <td> " . $trabajador['Nombre'] . " </td>
                              <td> " . $trabajador['ApellidoPat'] . " </td>
                              <td> " . $trabajador['NTrabajador'] . " </td>
                              <td> </td>
                              <form method='POST' action='./modificar-trabajador.php'>
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
                              </form>
                            </tr>";
    }
    echo            "</table>
                        </fieldset>
                      </div>
                    </body>
                  </html>";
    mysqli_close($conexion);
// }
?>
