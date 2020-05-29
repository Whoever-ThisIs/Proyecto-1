<?php
  function cerrar()
  {
    session_unset();
    session_destroy();
    header("Location:./Bienvenida.php");
  }
  session_name("cafeteria");
  session_id("7181414");
  session_start();
  cerrar();
 ?>
