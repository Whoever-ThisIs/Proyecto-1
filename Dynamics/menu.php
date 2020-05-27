<?php
  //Funciones para la conexión de la base de datos
  include("bd.php");
  //Conexion más base y despliegue de errores
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else {
    //Inicio de HTML
    echo "
      <!DOCTYPE html>
      <html lang=\"es\" dir=\"ltr\">
        <head>
          <meta charset=\"utf-8\">
          <title>Menú</title>
        </head>
        <body>
          <table></table>
    ";
    $SQL = "SELECT nombre, precio FROM alimentos WHERE id_alimento IN( SELECT id_alimento FROM menu WHERE cantidad>0)";
    $respuesta = mysqli_query($conexion, $SQL);
    echo "<h1>Menú</h1>
          <table border='2' align='center'>
            <tr>
              <th>Nombre</th>
              <th>Precio</th>
            </tr>";
    while($fila = mysqli_fetch_array($respuesta)){
      // print_r($fila);
      // echo "<br>";
      echo "<tr>";
      echo "  <td>".$fila[0]."</td>";
      echo "  <td>".$fila[1]."</td>";
      echo "</tr>";
    }
    echo "</table>";
    mysqli_close($conexion);
    echo "<button onclick=\"location.href='ordena.php'\">¡ORDENA!</button>";
    //Fin del HTML
    echo
    "
        </body>
      </html>
    ";
  }
 ?>
