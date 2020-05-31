<?php
  include("../../SitioUsr/Dynamics/des-cifrado.php");
  if (isset($_POST['nombre']) && isset($_POST['Paterno']) && isset($_POST['grupo']) && isset($_POST['Ncuenta']) && isset($_POST['id'])) {
    $nombre = cifrar(escapeall($_POST['nombre']));
    $paterno = cifrar(escapeall($_POST['Paterno']));
    $grupo = $_POST['grupo'];
    $Nc = escapeall($_POST['Ncuenta']);
    $id = escapeall($_POST['id']);
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    if ($Nc == $id)
    {
      $update_nombre = "UPDATE alumnos SET nombre = \"$nombre\" WHERE Ncuenta = \"$id\"";
      $update_paterno = "UPDATE alumnos SET ApellidoPat = \"$paterno\" WHERE Ncuenta = \"$id\"";
      $update_grupo = "UPDATE alumnos SET Grupo = \"$grupo\" WHERE Ncuenta = \"$id\"";
      mysqli_query($conexion,$update_grupo);
      mysqli_query($conexion,$update_paterno);
      mysqli_query($conexion,$update_nombre);
      mysqli_close($conexion);
      header('location: ./Gestion-de-usuarios.php');
    }
    else {
      $consulta = "SELECT * FROM alumnos WHERE Ncuenta = \"$Nc\"";
      mysqli_query($conexion,$consulta);
      $conicidencias = mysqli_affected_rows($conexion);
      if ($conicidencias == 0) {
        $update_nombre = "UPDATE alumnos SET nombre = \"$nombre\" WHERE Ncuenta = \"$id\"";
        $update_paterno = "UPDATE alumnos SET ApellidoPat = \"$paterno\" WHERE Ncuenta = \"$id\"";
        $update_grupo = "UPDATE alumnos SET Grupo = \"$grupo\" WHERE Ncuenta = \"$id\"";
        $update_nc = "UPDATE alumnos SET Ncuenta = \"$Nc\" WHERE Ncuenta = \"$id\"";
        $update_nc_users = "UPDATE users SET id_usuario = \"A$Nc\" WHERE id_usuario = \"A$id\"";
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
