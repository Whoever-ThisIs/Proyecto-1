<?php
  // session_id();
  // session_start();
  // if (isset($_SESSION['']))
  // {
  $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
  $consulta = "SELECT * FROM alimentos ";
  $respuesta = mysqli_query($conexion,$consulta);
  $consulta = mysqli_fetch_array($respuesta,MYSQLI_ASSOC);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title></title>
              </head>
              <body>
                <div class='fieldset'>
                  <fieldset>
                    <legend> <h1> Eliminar Alimento </h1> </legend>";
    if (isset($_COOKIE['msg'])) 
      echo $_COOKIE['msg'];
    echo            "<table>
                      <tr>
                        <th> ID Alimento </th>
                        <th> Nombre </th>
                        <th> Precio </th>
                        <th> Eliminar </th>
                      </tr>";
    while ($consulta = mysqli_fetch_array($respuesta,MYSQLI_ASSOC))
    {
      echo            "<tr>
                        <form method='POST' action='./delete.php'>
                          <td>" . $consulta['id_alimento'] . " </td>
                          <td>" . $consulta['nombre'] . " </td>
                          <td>" . $consulta['precio'] . " </td>
                          <td> <input type='submit' value='&#9888; Eliminar'> <input name='id' type='hidden' value='" . $consulta['id_alimento'] ."'</td>
                        </form>
                      </tr>";
    }
    echo            "</table>
                  </fieldset>
                </div>
              </body>
            </html>";
  // }
?>
