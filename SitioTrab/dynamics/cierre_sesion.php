<?php
  function cerrar()
  {
    session_unset();
    session_destroy();
    header("Location:./panel_de_control_trab.php");
  }
  session_name("cafeteria");
  session_id("7181414");
  session_start();
  cerrar();
 ?>
