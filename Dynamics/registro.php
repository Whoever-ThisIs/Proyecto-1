<?php
  include("des-cifrado.php");

  function revisar($id,$conexion){
    $sql = "SELECT * FROM usuarios WHERE id_usuario='$id'";
    $consulta = mysqli_query($conexion, $sql);
    $existencia = mysqli_fetch_array($consulta);
    $valido=0;
    if ($existencia=="") {
      $valido++;
    }
    return $valido;
  }

  $conexion = mysqli_connect("localhost", "root", "", "cafeteria");
  $usu=$_POST['tipo_usuario'];
  $nombre=$_POST['nombre'];
  $apellido=$_POST['ApellidoPat'];
  $pass=$_POST['password'];
  //Hasheo y cifrado de contraseña
  $salt=salt();
  $contra=registro($pass,$salt);

  if ($usu=="Alumno") {
    $nCuenta=$_POST['Ncuenta'];
    $id="A".$nCuenta;
    $valido=revisar($id,$conexion);
    if ($valido==1) {
      $grupo=$_POST['Grupo'];
      $consulta="INSERT INTO alumnos(Ncuenta, Nombre, ApellidoPat, Grupo) VALUES ($nCuenta,'$nombre','$apellido',$grupo)";
      mysqli_query($conexion, $consulta);
      $consulta2="INSERT INTO usuarios(id_usuario, password, condimento) VALUES ('$id','$contra','$salt')";
      mysqli_query($conexion, $consulta2);
      echo "<h1>Su perfil ha sido creado exitosamente con el usuario: <br />".$id."</h1><h2>Recuerde anotar tu nombre de usuario tal como se muestra aquí. </h2>";
    }
    else {
      echo "<h1>Ya existe una cuenta de alumno registrada con ese número de cuenta</h1>";
    }
  }

  elseif ($usu=="Funcionario") {
    $RFC=$_POST['RFC'];
    $id="F".$RFC;
    $valido=revisar($id,$conexion);
    if ($valido==1) {
      $colegio=$_POST['Colegio'];
      $consulta="INSERT INTO funcionarios(id_colegio, Nombre, ApellidoPat, RFC) VALUES ($colegio,'$nombre','$apellido','$RFC')";
      mysqli_query($conexion, $consulta);
      $consulta2="INSERT INTO usuarios(id_usuario, password, condimento) VALUES ('$id','$contra','$salt')";
      mysqli_query($conexion, $consulta2);
      echo "<h1>Su perfil ha sido creado exitosamente con el usuario: <br />".$id."</h1><h2>Recuerde anotar tu nombre de usuario tal como se muestra aquí. </h2>";
    }
    else {
      echo "<h1>Ya existe una cuenta de funcionario registrada con ese RFC</h1>";
    }
  }

  elseif ($usu=="Profesor") {
    $RFC=$_POST['RFC'];
    $id="P".$RFC;
    $valido=revisar($id,$conexion);
    if ($valido==1) {
      $colegio=$_POST['Colegio'];
      $consulta="INSERT INTO profesores(RFC, id_colegio, Nombre, ApellidoPat) VALUES ('$RFC',$colegio,'$nombre','$apellido')";
      mysqli_query($conexion, $consulta);
      $consulta2="INSERT INTO usuarios(id_usuario, password, condimento) VALUES ('$id','$contra','$salt')";
      mysqli_query($conexion, $consulta2);
      echo "<h1>Su perfil ha sido creado exitosamente con el usuario: <br />".$id."</h1><h2>Recuerde anotar tu nombre de usuario tal como se muestra aquí. </h2>";
    }
    else {
      echo "<h1>Ya existe una cuenta de profesor registrada con ese RFC</h1>";
    }
  }
  elseif ($usu=="Trabajador") {
    $nTrabajador=$_POST['Ntrabajador'];
    $id="T".$nTrabajador;
    $valido=revisar($id,$conexion);
    if ($valido==1) {
      $consulta="INSERT INTO trabajadores(NTrabajador, Nombre, ApellidoPat) VALUES ($nTrabajador,'$nombre','$apellido')";
      mysqli_query($conexion, $consulta);
      $consulta2="INSERT INTO usuarios(id_usuario, password, condimento) VALUES ('$id','$contra','$salt')";
      mysqli_query($conexion, $consulta2);
      echo "<h1>Su perfil ha sido creado exitosamente con el usuario: <br />".$id."</h1><h2>Recuerde anotar tu nombre de usuario tal como se muestra aquí. </h2>";
    }
    else {
      echo "<h1>Ya existe una cuenta de trabajador registrada con ese número de trabajador</h1>";
    }
  }
  echo "<a href='../Templates/InicioDeSesion.html'<b>Inicio de sesión</b></a>";
?>
