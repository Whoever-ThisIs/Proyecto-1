<?php
  session_name("cafeteria");
  session_id("7181414");
  session_start();
  include("bd.php");
  $conexion = connectDB2("cafeteria");
  if(!$conexion) {
    echo mysqli_connect_error()."<br>";
    echo mysqli_connect_errno()."<br>";
    exit();
  }
  else
  {
    $alimento = (isset($_POST['alimento']) && $_POST['alimento'] != "") ? $_POST['alimento'] : false ;
    $cantidad_usr = (isset($_POST['cantidad']) && $_POST['cantidad'] != "" && $_POST['cantidad'] >= 0) ? $_POST['cantidad'] : false ;
    $lugar = (isset($_POST['lugar']) && $_POST['lugar'] != "") ? $_POST['lugar'] : false ;
    if ($alimento !== false && $cantidad !== false && $lugar !== false) {
      $SQL_cantidad = "SELECT id_menu, cantidad FROM menu WHERE id_alimento IN (SELECT id_alimento FROM alimentos WHERE nombre='$alimento')";
      $consulta_cantidad = mysqli_query($conexion, $SQL_cantidad);
      $cantidad = mysqli_fetch_array($consulta_cantidad);
      $cantidad1 = (isset($cantidad) && $cantidad != "") ? $cantidad : false ;
      if ($cantidad1!==false) {
        $cantidad[cantidad]-=$cantidad_usr;
        if ($cantidad[cantidad]>=0) {
          //Actualización menú
          $SQL_pedido_menu = "UPDATE menu SET cantidad = ".$cantidad[cantidad]." WHERE id_menu = ".$cantidad[id_menu];
          $actualizacion_menu = mysqli_query($conexion, $SQL_pedido_menu);
          if (!isset($_SESSION['pedido'])) {
            //Trabajadores
            $SQL_estatus = "SELECT min(estado) from mensajeros";
            $consulta_estatus = mysqli_query($conexion, $SQL_estatus);
            $estatus = mysqli_fetch_array($consulta_estatus);
            //Actualización del estado del trabajador
            if ($estatus[0]>0) {
              $SQL_update_estatus = "UPDATE mensajeros SET estado=0";
              $update_estatus = mysqli_query($conexion, $SQL_update_estatus);
            }
            $SQL_cantidad_mensajeros = "SELECT id_mensajero from mensajeros where estado in ($SQL_estatus)";
            $actualizacion_menu = mysqli_query($conexion, $SQL_cantidad_mensajeros);
            $mensajero=mysqli_fetch_array($actualizacion_menu);
            //Creación de asignación
            $SQL_asignaciones = "INSERT INTO asignaciones(id_mensajero) VALUES ($mensajero[0])";
            $asignaciones = mysqli_query($conexion, $SQL_asignaciones);
            $SQL_estado = "UPDATE mensajeros SET estado = 1 WHERE id_mensajero=$mensajero[0]";
            $estado = mysqli_query($conexion, $SQL_estado);
            //Creación del pedido
            //id_asignacion
            $SQL_id_asignacion = "SELECT max(id_asignacion) FROM asignaciones";
            $consulta_id_asignacion = mysqli_query($conexion, $SQL_id_asignacion);
            $id_asignacion = mysqli_fetch_array($consulta_id_asignacion);
            //Costo
            $SQL_costo = "SELECT precio FROM alimentos WHERE nombre = '$alimento'";
            $consulta_costo = mysqli_query($conexion, $SQL_costo);
            $costo = mysqli_fetch_array($consulta_costo);
            $costo[0]*=$cantidad_usr;
            //Lugar
            $SQL_lugar = "SELECT id_lugar FROM lugares WHERE Lugar = '$lugar'";
            $consulta_lugar = mysqli_query($conexion, $SQL_lugar);
            $lugar = mysqli_fetch_array($consulta_lugar);
            //Creación de pedido
            $SQL_pedido = "INSERT INTO pedidos(id_usuario, id_asignacion, Costo, lugar, id_estatus) VALUES ('$_SESSION[usuario]', $id_asignacion[0], $costo[0], $lugar[0], 1)";
            $consulta_pedido = mysqli_query($conexion, $SQL_pedido);
            //Creación de entrega
            //id_pedido
            $SQL_id_pedido = "SELECT max(id_pedido) FROM pedidos";
            $consulta_id_pedido = mysqli_query($conexion, $SQL_id_pedido);
            $id_pedido = mysqli_fetch_array($consulta_id_pedido);
            $_SESSION['pedido'] = $id_pedido[0];
            //id_menu
            $SQL_alimento_entrega = "SELECT id_menu FROM menu WHERE id_alimento IN(SELECT id_alimento FROM alimentos WHERE nombre = '$alimento')";
            $consulta_alimento_entrega = mysqli_query($conexion, $SQL_alimento_entrega);
            $alimento_entrega = mysqli_fetch_array($consulta_alimento_entrega);
            $_SESSION['id_menu'][] = $alimento_entrega[0];

            $SQL_entrega = "INSERT INTO entregas(id_pedido, id_menu, cantidad) VALUES ($id_pedido[0], $alimento_entrega[0], $cantidad_usr)";
            $consulta_entrega = mysqli_query($conexion, $SQL_entrega);
            $entrega = mysqli_fetch_array($consulta_entrega);
          }
          else {
            //Lugar
            $SQL_lugar = "SELECT id_lugar FROM lugares WHERE Lugar = '$lugar'";
            $consulta_lugar = mysqli_query($conexion, $SQL_lugar);
            $lugar = mysqli_fetch_array($consulta_lugar);
            //Costo de la actualización
            $SQL_costo = "SELECT precio FROM alimentos WHERE nombre = '$alimento'";
            $consulta_costo = mysqli_query($conexion, $SQL_costo);
            $costo = mysqli_fetch_array($consulta_costo);
            $costo[0]*=$cantidad_usr;
            //id_menu
            $SQL_alimento_entrega = "SELECT id_menu FROM menu WHERE id_alimento IN(SELECT id_alimento FROM alimentos WHERE nombre = '$alimento')";
            $consulta_alimento_entrega = mysqli_query($conexion, $SQL_alimento_entrega);
            $alimento_entrega = mysqli_fetch_array($consulta_alimento_entrega);
            $menu=false;
            foreach ($_SESSION['id_menu'] as $key => $value) {
              if ($value == $alimento_entrega[0]) {
                $menu=true;
              }
            }
            if (!$menu) {
              $_SESSION['id_menu'][]=$alimento_entrega[0];
              $SQL_creacion_entrega = "INSERT INTO entregas(id_pedido, id_menu, cantidad) VALUES ($_SESSION[pedido], $alimento_entrega[0], $cantidad_usr)";
              $consulta_creacion_entrega = mysqli_query($conexion, $SQL_creacion_entrega);
            }
            //Costo inicial del pedido
            $SQL_costo_inicial = "SELECT Costo FROM pedidos WHERE id_pedido = $_SESSION[pedido]";
            $consulta_costo_inicial = mysqli_query($conexion, $SQL_costo_inicial);
            $costo_inicial = mysqli_fetch_array($consulta_costo_inicial);
            $costo[0]+=($costo_inicial[0]*$cantidad_usr);
            //Actualización pedido
            $SQL_act_pedido = "UPDATE pedidos SET Costo=$costo[0], lugar=$lugar[0] WHERE id_pedido=$_SESSION[pedido]";
            $consulta_act_pedido = mysqli_query($conexion, $SQL_act_pedido);
            //Consulta cantidad entrega
            $SQL_cantidad_inicial = "SELECT cantidad FROM entregas WHERE id_pedido = $_SESSION[pedido] && id_menu=$alimento_entrega[0]";
            $consulta_cantidad_inicial = mysqli_query($conexion, $SQL_cantidad_inicial);
            $cantidad_inicial = mysqli_fetch_array($consulta_cantidad_inicial);
            $cantidad_actualizada=$cantidad_inicial[0] + $cantidad_usr;
            //Actualización entregas
            $SQL_act_cantidad = "UPDATE entregas SET cantidad=$cantidad_actualizada WHERE id_pedido=$_SESSION[pedido] && id_menu=$alimento_entrega[0]";
            $consulta_act_cantidad = mysqli_query($conexion, $SQL_act_cantidad);
          }
          echo "<button onclick=\"location.href='cierre_sesion.php'\">Cierre de sesión</button>
          ";
          header("Location:./pedido_usr.php");
        }
        else {
          echo "Ingresaste una cantidad no válida, intenta con una cantidad menor";
        }
      }
    }
    else {
      echo "Error al recibir sus datos, asegúrese de haber llenado todos los campos correctamente";
    }
    mysqli_close($conexion);
  }
 ?>
