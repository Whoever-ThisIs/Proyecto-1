<?php
  $pedido=$_POST['pedido'];
  include("bd.php");
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else
  {
    $SQL_detalles = "SELECT id_entrega, id_menu, cantidad FROM entregas WHERE id_pedido=".$pedido;
    $consulta_detalles = mysqli_query($conexion, $SQL_detalles);
    $detalles = mysqli_fetch_array($consulta_detalles);
    $SQL_estatus = "SELECT id_estatus FROM pedidos WHERE id_pedido=".$pedido;
    $consulta_estatus = mysqli_query($conexion, $SQL_estatus);
    $estatus = mysqli_fetch_array($consulta_estatus);
    echo "
      <h3>No. del pedido: $pedido</h3>
      <table>
        <tr>
          <th>id_entrega</th>
          <th>Alimento</th>
          <th>Cantidad</th>
        </tr>
    ";
    do {
      $SQL_alimento = "SELECT nombre FROM alimentos WHERE id_alimento IN(SELECT id_alimento FROM menu WHERE id_menu=$detalles[1])";
      $consulta_alimento = mysqli_query($conexion, $SQL_alimento);
      $alimento = mysqli_fetch_array($consulta_alimento);
      echo "
        <tr>
          <td>".$detalles[0]."</td>
          <td>".$alimento[0]."</td>
          <td>".$detalles[2]."</td>
        </tr>";
    } while ($detalles = mysqli_fetch_array($consulta_detalles));
    echo "
      </table>";
    if ($estatus[0]!=2&&$estatus[0]!=3) {
      echo "
      <form action='./entrega.php' method='post'>
        <input type='hidden' name='pedido' value = '".$pendientes_mensajero[$key][id_pedido]."'>
        <input type='submit' name='accion' value = 'Entregar'>
      </form>
      <form action='./cancelacion.php' method='post'>
        <input type='hidden' name='pedido' value = '".$pendientes_mensajero[$key][id_pedido]."'>
        <input type='submit' name='accion' value = '&#x274c; Cancelar'>
      </form>
      ";
    }
    echo "<button onclick=\"location.href='./panel_de_control_trab.php'\">Panel de Control</button>";
  }
 ?>
