<?php
  // session_name("cafeteria");
  // session_id("319014215");
  // session_start();
  // if (isset($_SESSION['']))
  // {
  $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
  if (isset($_POST['filtro']))
  {
    $filtro = $_POST['filtro'];
    $count = "SELECT COUNT(*) FROM alimentos WHERE nombre LIKE \"%$filtro%\"";
    $consulta = "SELECT * FROM alimentos WHERE nombre LIKE \"%$filtro%\"";
  }
  else
  {
    $count = "SELECT COUNT(*) FROM alimentos ";
    $consulta = "SELECT* FROM alimentos ";
  }
  $respuesta = mysqli_query($conexion,$consulta);
  $count = mysqli_query($conexion,$count);
  $count = mysqli_fetch_array($count,MYSQLI_ASSOC);
    echo "<!DOCTYPE html>
            <html lang='es' dir='ltr'>
              <head>
                <meta charset='utf-8'>
                <title></title>
              </head>
              <body>
                <div class='fieldset'>
                  <fieldset>
                    <legend> <h1> Gestionar alimentos </h1> </legend>
                    <form method='POST' action='Gestion-de-alimentos.php'>
                      <input type='search' name='filtro' placeholder='&#128269; BUSCAR' pattern='^[A-ZÁÉÍÓÚÜÑa-záéíóüúñ\s]+$' title='Solo puedes introducir letras del alfabeto latino'>
                      <input type='submit' value='&#128269;'>
                      <a href='./Añadir-producto.php' >Añadir producto </a>
                    </form>
                    <br>";
    if (isset($_COOKIE['msg']))
      echo  $_COOKIE['msg'];
    if ($count['COUNT(*)'] >= 1)
    {
      echo            "<table >
                        <tr>
                          <th> ID Alimento </th>
                          <th> Nombre </th>
                          <th> Precio </th>
                          <th> Eliminar </th>
                          <th> Editar </th>
                        </tr>";
      while ($consulta = mysqli_fetch_array($respuesta,MYSQLI_ASSOC))
      {
        echo            "<tr>
                            <td>" . $consulta['id_alimento'] . " </td>
                            <td>" . $consulta['nombre'] . " </td>
                            <td>" . $consulta['precio'] . " </td>
                            <form method='POST' action='./delete.php'>
                              <td> <input type='submit' value='&#9888; Eliminar'> <input name='id' type='hidden' value='" . $consulta['id_alimento'] ."'</td>
                            </form>
                            <form method='POST' action='./mod.php'>
                              <td> <input type='submit' value='&#128393; Editar'> <input name='id' type='hidden' value='" . $consulta['id_alimento'] ."'</td>
                            </form>
                        </tr>";
      }
      echo            "</table>";
    }
    else
      echo            "<br>
                      No se encontro ningun producto.
                      <br>";
    echo          "</fieldset>
                </div>
              </body>
            </html>";
  // }
?>
