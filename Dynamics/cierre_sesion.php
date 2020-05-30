<?php
  session_start();
  function cerrar()
  {
    session_unset();
    session_destroy();
  }
  cerrar();
 ?>
