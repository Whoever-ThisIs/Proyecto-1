<?php
  //Funciones para la conexión de la base de datos
  include("bd.php");
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
    $usr = (isset($_POST['Usuario']) && $_POST['Usuario'] != "") ? $_POST['Usuario'] : false ;
    $password = (isset($_POST['password']) && $_POST['password'] != "") ? $_POST['password'] : false ;
    if ($usr!==false&&$password!==false) {
      $SQL_usuario = "SELECT id_usuario FROM usuarios WHERE id_usuario='$usr'";
      $consulta_usuario = mysqli_query($conexion, $SQL_usuario);
      $usuario = mysqli_fetch_array($consulta_usuario);
      if (isset($usuario)) {
        $SQL = "SELECT id_usuario from usuarios where password='$password'";
        $respuesta = mysqli_query($conexion, $SQL);
        $fila = mysqli_fetch_array($respuesta);
        if (isset($fila)) {
          session_name("cafeteria");
          session_id("7181414");
          session_start();
          $_SESSION['usuario']=$usr;
          header('Location: menu.php');
        }
        else
        {
          echo "Ningún usuario coincide con esa contraseña <br>
          <button onclick=\"location.href='../templates/InicioDeSesión.html'\">Inicio de sesión</button>";
        }
      }
      else {
        echo "No hay ningún usuario con ese nombre <br>
        <button onclick=\"location.href='Bienvenida.php'\">Registro</button>";
      }
    }
    else
    {
      echo "Error al recibir los datos.<br>Asegúrate de haber rellenado ambos campos<br>
      <button onclick=\"location.href='../templates/InicioDeSesión.html'\">Inicio de sesión</button>";
    }
    mysqli_close($conexion);
    echo
    "
        </body>
      </html>
    ";
  }
 ?>
