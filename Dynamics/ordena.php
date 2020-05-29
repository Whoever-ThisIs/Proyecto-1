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
    //Inicio de HTML
    echo "
    <!DOCTYPE html>
    <html lang=\"es\" dir=\"ltr\">
      <head>
        <meta charset=\"utf-8\">
        <title>Pedido</title>
      </head>
      <body>
        <h1>Pedidos</h1>
        <form action=\"confirmacion_pedido.php\" method=\"post\">
    ";
    $SQL_alimento = "SELECT nombre FROM alimentos WHERE id_alimento IN(SELECT id_alimento FROM menu WHERE cantidad>0)";
    $consulta_alimento = mysqli_query($conexion, $SQL_alimento);
    $comidas = mysqli_fetch_array($consulta_alimento);
    $alimento = (isset($comidas) && $comidas != "") ? $comidas : false ;
    echo "
          Alimento
          <select name=\"alimento\">";
    if ($alimento!==false) {
      do{
        echo "<option value=\"".$comidas[nombre]."\">".$comidas[nombre]."</option>";
      }while ($comidas = mysqli_fetch_array($consulta_alimento));
    }
    echo "
          </select>
          <br>
          Cantidad <input type=\"number\" name=\"cantidad\" value=\"1\" min=\"0\" max=\"100\"><br>
          Lugar de entrega
          <select name=\"lugar\">";
    $SQL_lugar = "SELECT Lugar FROM lugares";
    $consulta_lugar = mysqli_query($conexion, $SQL_lugar);
    while($lugares_entrega = mysqli_fetch_array($consulta_lugar))
    {
      echo "<option value=\"".$lugares_entrega[0]."\">".$lugares_entrega[0]."</option>";
    }
    echo "
          </select><br>
          <input type='submit' value='¡ORDENA!'>
        </form>
        <button onclick=\"location.href='cierre_sesion.php'\">Cierre de sesión</button>
    ";
    //Fin del HTML
    echo
    "
      </body>
    </html>
    ";
    mysqli_close($conexion);
  }
 ?>
