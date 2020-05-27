<?php
  define("DBUSER","root");
  define("DBHOST","localhost");
  define("PASSDB","");

  function connect(){
    return mysqli_conect(DBHOST, DBUSER, PASSDB);
  }

  function connectDB1 ($conexion, $base){
    return mysqli_select_db($conexion,$base)
    or die("No se ha podido acceder a la base de datos.");
  }

  function connectDB2($base){
    $con = mysqli_connect(DBHOST, DBUSER, PASSDB, $base);
    if (!$con) {
      echo "No se ha podido acceder a la base de datos.";
    }
    return $con;
  }
?>
