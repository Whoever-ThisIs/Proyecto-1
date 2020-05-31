<?php
session_name("cafeteria");
session_id("7181414");
session_start();
include("bd.php");
$conexion = connectDB2("cafeteria");
if(!$conexion) {
  echo mysqli_connect_error()."<br>";
  echo mysqli_connect_errno()."<br>";
  exit();
}
else
{
  echo "<h1>Tu usuario es: $_SESSION[usuario]</h1>
        <h2>Tu pedido es:</h2>
        <table>
          <tr>
            <th>Alimento</th> <th>Precio alimento</th>  <th>Cantidad</th> <th>Costo</th>
          </tr>";
  $SQL_alimentos = "SELECT id_menu, cantidad FROM entregas WHERE id_pedido=$_SESSION[pedido] AND cantidad > 0";
  $consulta_alimentos = mysqli_query($conexion, $SQL_alimentos);
  while ($alimentos = mysqli_fetch_array($consulta_alimentos)) {
    $SQL_nombre_alimento = "SELECT nombre, precio FROM alimentos WHERE id_alimento IN(SELECT id_alimento FROM menu WHERE id_menu = $alimentos[id_menu])";
    $consulta_nombre_alimento = mysqli_query($conexion, $SQL_nombre_alimento);
    $nombre_alimento = mysqli_fetch_array($consulta_nombre_alimento);
    echo "<tr>
            <td>$nombre_alimento[nombre]</td>
            <td>$nombre_alimento[precio]</td>
            <td>$alimentos[cantidad]</td>
            <td>$nombre_alimento[precio]</td>
          </tr>";

  }
  $SQL_costo = "SELECT Costo FROM pedidos WHERE id_pedido = $_SESSION[pedido]";
  $consulta_costo = mysqli_query($conexion, $SQL_costo);
  $costo = mysqli_fetch_array($consulta_costo);
  echo "</table>
        <h3>El costo total de tu pedido es: $costo[0]<br>
        <button onclick=\"location.href='cierre_sesion.php'\">Cierre de sesión</button>
        <button onclick=\"location.href='menu.php'\">Menú</button>
        </h3>";

}
 ?>
