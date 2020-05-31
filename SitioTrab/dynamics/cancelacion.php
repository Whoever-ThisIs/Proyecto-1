<?php
  $pedido=$_POST['pedido'];
  $usr=$_POST['usr'];
  include("bd.php");
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else
  {
    echo "
    <!DOCTYPE html>
    <html lang='en' dir='ltr'>
      <head>
        <meta charset='utf-8'>
        <title>Cancelacion de pedido</title>
      </head>
      <body>
        <h3>Formulario de Cancelación de Pedido</h3>
        <form action='confirmacion_cancelacion.php' method='post'>
          Seleccione las razones por la que se cancela el pedido
          <br>
          <select name='razon'>";
    $SQL_razones = "SELECT id_razon, razon FROM razones";
    $consulta_razones = mysqli_query($conexion, $SQL_razones);
    while ($razones = mysqli_fetch_array($consulta_razones)) {
      echo " <option value='$razones[0]'>$razones[1]</option>";
    }
    echo "
          </select>
          <br>
          Comentarios:
          <br>
          <textarea name='comentario' rows='8' cols='40'></textarea>
          <br>
          <input type='hidden' name='pedido' value = '".$pedido."'>
          <input type='hidden' name='usr' value = '".$usr."'>
          <input type='submit' name='' value='Enviar'>
        </form>
      </body>
    </html>
";

  }
 ?>
