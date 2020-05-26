<?php
  session_id
  function cerrar()
  {
    session_unset();
    session_destroy();
    header("Location:../Templates/Bienvenida.html");
  }
 ?>
