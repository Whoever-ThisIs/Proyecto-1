<?php
  include("bd.php");
  include("des-cifrado.php");

  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }

  //$idadmin=$_SESSION['usuario'];
  $idadmin="AD1";
  $llaveseg=$_POST['llave'];
  $accion=$_POST['accion'];
  $id0=$_POST['id'];
  $tipo=$_POST['tipo'];
  $sqlp = "SELECT condimento FROM administradores WHERE id_admin='$idadmin'";
  $consulta_sqlp = mysqli_query($conexion, $sqlp);
  $salt = mysqli_fetch_array($consulta_sqlp);
  $sqlp2 = "SELECT password FROM administradores WHERE id_admin='$idadmin'";
  $consulta_sqlp2 = mysqli_query($conexion, $sqlp2);
  $password = mysqli_fetch_array($consulta_sqlp2);
  $true=acceso($llaveseg,$password[0],$salt[0]);
  if ($true==1) {
    if ($accion=="agregar") {
      $nomusr=$_POST['usuarioagr'];
      $paso=$_POST['paso'];
      $salt2=salt();
      $contra=registro($paso,$salt2);
      if ($tipo=="Mensajero") {
        $id = "M".$id0;
        $sql = "SELECT * FROM mensajeros WHERE id_mensajero='$id'";
        $consulta = mysqli_query($conexion, $sql);
        $existencia = mysqli_fetch_array($consulta);
        if ($existencia=="") {
          $consulta2="INSERT INTO mensajeros(id_mensajero, nombre, Password,condimento) VALUES ('$id', '$nomusr','$contra','$salt2')";
          mysqli_query($conexion, $consulta2);
          echo "<h1>Se ha guardado un nuevo perfil de mensajero con el ID de usuario: ".$id."</h1>";
        }
        else {
          echo "<h1>Ya existe una cuenta de mensajero con ese ID</h1>";
        }
      }
      if ($tipo=="Administrador") {
        $id = "AD".$id0;
        $sql = "SELECT * FROM administradores WHERE id_admin='$id'";
        $consulta = mysqli_query($conexion, $sql);
        $existencia = mysqli_fetch_array($consulta);
        if ($existencia=="") {
          echo $id."<br />".$contra."<br />".$nomusr."<br />".$salt2;
          $consulta2="INSERT INTO administradores(id_admin, Password, Nombre, condimento) VALUES ('$id','$contra','$nomusr','$salt2')";
          mysqli_query($conexion, $consulta2);
          echo "<h1>Se ha guardado un nuevo perfil de administrador con el ID de usuario: ".$id."</h1>";
        }
        else {
          echo "<h1>Ya existe una cuenta de administrador con ese ID</h1>";
        }
      }
    }
    if ($accion=="eliminar") {
      if ($tipo=="Mensajero") {
        $id = "M".$id0;
        $sql = "SELECT * FROM mensajeros WHERE id_mensajero='$id'";
        $consulta = mysqli_query($conexion, $sql);
        $existencia = mysqli_fetch_array($consulta);
        if ($existencia!="") {
          $consulta2="DELETE FROM mensajeros WHERE id_mensajero='$id'";
          mysqli_query($conexion, $consulta2);
          echo "<h1>Se ha borrado exitosamente el perfil de mensajeros con el ID de usuario: ".$id."</h1>";
        }
        else {
          echo "<h1>No existe una cuenta de administrador con ese ID</h1>";
        }
      }
      if ($tipo=="Administrador") {
        $id = "AD".$id0;
        $sql = "SELECT * FROM administradores WHERE id_admin='$id'";
        $consulta = mysqli_query($conexion, $sql);
        $existencia = mysqli_fetch_array($consulta);
        if ($existencia!="") {
          $consulta2="DELETE FROM administradores WHERE id_admin='$id'";
          mysqli_query($conexion, $consulta2);
          echo "<h1>Se ha borrado exitosamente el perfil de administrador con el ID de usuario: ".$id."</h1>";
        }
        else {
          echo "<h1>No existe una cuenta de administrador con ese ID</h1>";
        }
      }
    }
  }
  else {
    echo "<h1>La llave de seguridad no concuerda con el perfil</h1>";
  }

?>