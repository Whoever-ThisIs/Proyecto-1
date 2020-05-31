<?php
  include("../../SitioUsr/Dynamics/des-cifrado.php");
  if (isset($_POST['nombre']) && isset($_POST['paterno']) && isset($_POST['colegio']) && isset($_POST['RFC']) && isset($_POST['id'])) {
    $nombre = cifrar(escapeall($_POST['nombre']));
    $paterno = escapeall($_POST['Paterno']);
    $paterno = cifrar(escapeall($paterno));
    $colegio = $_POST['colegio'];
    $RFC = escapeall($_POST['RFC']);
    $id = escapeall($_POST['id']);
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    if($id == $RFC)
    {
      $update_nombre = "UPDATE profesores SET Nombre = \"$nombre\" WHERE RFC = \"$id\"";
      $update_colegio = "UPDATE profesores SET id_colegio = \"$colegio\" WHERE RFC = \"$id\"";
      $update_paterno = "UPDATE profesores SET ApellidoPat = \"$paterno\" WHERE RFC = \"$id\"";
      mysqli_query($conexion,$update_nombre);
      mysqli_query($conexion,$update_colegio);
      mysqli_query($conexion,$update_paterno);
      mysqli_close($conexion);
      header('location: ./Gestion-de-usuarios.php');
    }
    else
    {
      $consulta = "SELECT * FROM profesores WHERE RFC = \"$RFC\"";
      mysqli_query($conexion,$consulta);
      $conicidencias = mysqli_affected_rows($conexion);
      if ($conicidencias == 0)
      {
        $update_rfc = "UPDATE profesores SET RFC = \"$RFC\"  WHERE RFC = \"$id\"";
        $update_rfc_users = "UPDATE usuarios SET id_usuario = \"P$RFC\"  WHERE RFC = \"P$id\"";
        $update_nombre = "UPDATE profesores SET Nombre = \"$nombre\" WHERE RFC = \"$id\"";
        $update_colegio = "UPDATE profesores SET id_colegio = \"$colegio\" WHERE RFC = \"$id\"";
        $update_paterno = "UPDATE profesores SET ApellidoPat = \"$paterno\" WHERE RFC = \"$id\"";
        mysqli_query($conexion,$update_nombre);
        mysqli_query($conexion,$update_colegio);
        mysqli_query($conexion,$update_paterno);
        mysqli_query($conexion,$update_rfc);
        mysqli_query($conexion,$update_rfc_users);
        mysqli_close($conexion);
        echo "uwu";
        header('location: ./Gestion-de-usuarios.php');
      }
      else
        echo "Ya hay un usuario con ese RFC.";
    }
  }
?>
