<?php
  include("../../SitioUsr/Dynamics/des-cifrado.php");
  if (isset($_POST['nombre']) && isset($_POST['Paterno']) && isset($_POST['NTrabajador']) && isset($_POST['id'])) {
    $nombre = cifrar($_POST['nombre']);
    $paterno = cifrar($_POST['Paterno']);
    $Nc = $_POST['NTrabajador'];
    $id = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    if ($Nc == $id)
    {
      $update_nombre = "UPDATE trabajadores SET nombre = \"$nombre\" WHERE NTrabajador = \"$id\"";
      $update_paterno = "UPDATE trabajadores SET ApellidoPat = \"$paterno\" WHERE NTrabajador = \"$id\"";
      mysqli_query($conexion,$update_paterno);
      mysqli_query($conexion,$update_nombre);
      mysqli_close($conexion);
      header('location: ./Gestion-de-usuarios.php');
    }
    else {
      $consulta = "SELECT * FROM trabajadores WHERE NTrabajador = \"$Nc\"";
      mysqli_query($conexion,$consulta);
      $conicidencias = mysqli_affected_rows($conexion);
      if ($conicidencias == 0) {
        $update_nombre = "UPDATE trabajadores SET nombre = \"$nombre\" WHERE NTrabajador = \"$id\"";
        $update_paterno = "UPDATE trabajadores SET ApellidoPat = \"$paterno\" WHERE NTrabajador = \"$id\"";
        $update_nc = "UPDATE trabajadores SET NTrabajador = \"$Nc\" WHERE NTrabajador = \"$id\"";
        $update_nc_users = "UPDATE users SET id_usuario = \"T$Nc\" WHERE id_usuario = \"T$id\"";
        mysqli_query($conexion,$update_grupo);
        mysqli_query($conexion,$update_paterno);
        mysqli_query($conexion,$update_nombre);
        mysqli_query($conexion,$update_nc);
        mysqli_query($conexion,$update_nc_users);
        mysqli_close($conexion);
        header('location: ./Gestion-de-usuarios.php');
      }
      else
        echo "Ya existe un usuario con este numero de cuenta.
              <br>
              <a href='./Gestion-de-usuarios.php'>Volver a pagina de gestion de usuarios</a>";
    }
  }
?>
