<?php
  include("../../SitioUsr/Dynamics/des-cifrado.php");
  if (isset($_POST['nombre']) && isset($_POST['paterno']) && isset($_POST['colegio']) && isset($_POST['RFC']) && isset($_POST['id'])) {
    $nombre = cifrar($_POST['nombre']);
    $paterno = cifrar($_POST['Paterno']);
    $colegio = $_POST['colegio'];
    $RFC = $_POST['RFC'];
    $id = $_POST['id'];
    $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
    echo $id;
    if($id == $RFC)
    {
      $update_nombre = "UPDATE funcionarios SET Nombre = \"$nombre\" WHERE RFC = \"$id\"";
      $update_colegio = "UPDATE funcionarios SET id_colegio = \"$colegio\" WHERE RFC = \"$id\"";
      $update_paterno = "UPDATE funcionarios SET ApellidoPat = \"$paterno\" WHERE RFC = \"$id\"";
      mysqli_query($conexion,$update_nombre);
      mysqli_query($conexion,$update_colegio);
      mysqli_query($conexion,$update_paterno);
      mysqli_close($conexion);
      header('location: ./Gestion-de-usuarios.php');
    }
    else
    {
      $consulta = "SELECT * FROM funcionarios WHERE RFC = \"$RFC\"";
      mysqli_query($conexion,$consulta);
      $conicidencias = mysqli_affected_rows($conexion);
      if ($conicidencias == 0)
      {
        $update_rfc = "UPDATE funcionarios SET RFC = \"$RFC\"  WHERE RFC = \"$id\"";
        $update_rfc_users = "UPDATE usuarios SET id_usuario = \"P$RFC\"  WHERE RFC = \"P$id\"";
        $update_nombre = "UPDATE funcionarios SET Nombre = \"$nombre\" WHERE RFC = \"$id\"";
        $update_colegio = "UPDATE funcionarios SET id_colegio = \"$colegio\" WHERE RFC = \"$id\"";
        $update_paterno = "UPDATE funcionarios SET ApellidoPat = \"$paterno\" WHERE RFC = \"$id\"";
        mysqli_query($conexion,$update_nombre);
        mysqli_query($conexion,$update_colegio);
        mysqli_query($conexion,$update_paterno);
        mysqli_query($conexion,$update_rfc);
        mysqli_query($conexion,$update_rfc_users);
        mysqli_close($conexion);
        header('location: ./Gestion-de-usuarios.php');
      }
      else
        echo "Ya hay un usuario con ese RFC.";
    }
  }
?>
