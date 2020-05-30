<?php
  if(isset($_POST['nombre']) && isset($_POST['precio']) )
  {
    if ($_POST['precio'] >= 1 && $_POST['cantidad'] >= 1)
    {
      $precio = $_POST['precio'];
      $cantidad = $_POST['cantidad'];
      $nombre = $_POST['nombre'];
      $conexion = mysqli_connect("localhost", "root", "root", "cafeteria");
      $consulta = "SELECT id_alimento FROM alimentos WHERE nombre = '" . $nombre . "'";
      $respuesta = mysqli_query($conexion,$consulta);
      $consulta = mysqli_fetch_array($respuesta,MYSQLI_NUM);
      if($consulta == "")
      {
        $insert = "INSERT INTO alimentos (nombre, precio) VALUES (\"$nombre\" , \"$precio\" ) ";
        mysqli_query($conexion,$insert);
        $id = "SELECT MAX(id_alimento) FROM alimentos";
        $IDK = mysqli_query($conexion,$id);
        $consulta = mysqli_fetch_array($IDK,MYSQLI_NUM);
        $insert = "INSERT INTO menu (id_alimento, cantidad) VALUES (\"$consulta[0]\" , \"$cantidad\" ) ";
        mysqli_query($conexion,$insert);
        setcookie("msg","Alimento añadido correctamente.",time() + 60*1);
      }
      else
      {
        $update = "UPDATE menu SET cantidad = $cantidad WHERE id_alimento = $consulta[0]";
        mysqli_query($conexion,$update);
        setcookie("msg","Error al añadir el producto, ya existe un producto con ese nombre por lo que solo se ha modificado la cantidad disponible.",time() + 60*1);
      }

    }
    else {
      setcookie("msg","Error al añadir producto, el precio y la cantidad deben ser mayor a uno",time() + 60*1);
    }
    header('location: ./Gestion-de-alimentos.php');
  }
?>
