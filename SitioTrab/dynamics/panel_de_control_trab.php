<?php
  session_name("cafeteria");
  session_id("7181414");
  session_start();
  include("bd.php");
  $_SESSION['mensajero']="Alejandro";
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
        <title>Panel de control</title>
      </head>
      <body>
    ";
    $SQL_mensajero = "SELECT id_mensajero FROM mensajeros WHERE Nombre='$_SESSION[mensajero]'";
    $consulta_mensajero = mysqli_query($conexion, $SQL_mensajero);
    $mensajero = mysqli_fetch_array($consulta_mensajero);
    if (isset($mensajero)) {
      $SQL_asignaciones = "SELECT id_asignacion,id_pedido FROM asignaciones WHERE id_mensajero=$mensajero[0]";
      $consulta_asignaciones = mysqli_query($conexion, $SQL_asignaciones);
      $asignaciones = mysqli_fetch_array($consulta_asignaciones);
      do {
        $pendientes_mensajero[] = array(
          'id_asignacion' => $asignaciones[0],
          'id_pedido' => $asignaciones[1]
        );
      } while ($asignaciones = mysqli_fetch_array($consulta_asignaciones));
      if (isset($pendientes_mensajero)) {
        echo "
          <table>
            <tr>
              <th>Núm de<br>pedido</th>
              <th>Usuario</th>
              <th>Núm de<br>asignación</th>
              <th>Costo<br>del pedido</th>
              <th>Fecha</th>
              <th>Id del lugar</th>
              <th>Estatus</th>
            </tr>
        ";
        foreach ($pendientes_mensajero as $key => $value) {
          $SQL_pendientes = "SELECT * FROM pedidos WHERE id_pedido=".$pendientes_mensajero[$key][id_pedido];
          $consulta_pendientes = mysqli_query($conexion, $SQL_pendientes);
          $pendientes = mysqli_fetch_array($consulta_pendientes);
          $SQL_lugar = "SELECT Lugar FROM lugares WHERE id_lugar=".$pendientes[5];
          $consulta_lugar = mysqli_query($conexion, $SQL_lugar);
          $lugar = mysqli_fetch_array($consulta_lugar);
          $SQL_estatus = "SELECT estatus FROM estatus WHERE id_estatus=".$pendientes[6];
          $consulta_estatus = mysqli_query($conexion, $SQL_estatus);
          $estatus = mysqli_fetch_array($consulta_estatus);
          echo "
            <tr>
              <td>$pendientes[0]</td>
              <td>$pendientes[1]</td>
              <td>$pendientes[2]</td>
              <td>$pendientes[3]</td>
              <td>$pendientes[4]</td>
              <td>$lugar[0]</td>
              <td>$estatus[0]</td>
              <td>
                <form action='./detalles.php' method='post'>
                  <input type='hidden' name='pedido' value = '".$pendientes_mensajero[$key][id_pedido]."'>
                  <input type='submit' name='accion' value = 'Detalles'>
                </form>
              </td>";
          if ($estatus[0]!="Entregado"&&$estatus[0]!="Cancelado") {
            echo"
                <td>
                  <form action='./entrega.php' method='post'>
                    <input type='hidden' name='pedido' value = '".$pendientes_mensajero[$key][id_pedido]."'>
                    <input type='submit' name='accion' value = 'Entregar'>
                  </form>
                </td>
                <td>
                  <form action='./cancelacion.php' method='post'>
                    <input type='hidden' name='usr' value = '".$pendientes[1]."'>
                    <input type='hidden' name='pedido' value = '".$pendientes_mensajero[$key][id_pedido]."'>
                    <input type='submit' name='accion' value = '&#x274c; Cancelar'>
                  </form>
                </td>
              </tr>";
          }
        }
        echo "</table>";
      }
      else {
        echo "No hay asignaciones";
      }
    }
    else {
      echo "No hay un mensajero registrado con ese nombre";
    }
  }
 ?>
