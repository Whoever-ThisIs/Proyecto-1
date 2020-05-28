<?php
  define("KENNWORT","DagehtmeinSchlafrhythmuslos");
  define("HASH","blake2s256");
  define("METHOD","seed-ofb");
  function cifrar($text){
    $key=openssl_digest(KENNWORT, HASH);
    $iv_len=openssl_cipher_iv_length(METHOD);
    $iv=openssl_random_pseudo_bytes($iv_len);
    $rawCif=openssl_encrypt($text,METHOD,$key,OPENSSL_RAW_DATA,$iv);

    $textoCifrado=base64_encode($iv.$rawCif);
    return $textoCifrado;
  }

  function descifrar($textoCifrado){
    $key=openssl_digest(KENNWORT, HASH);
    $iv_len=openssl_cipher_iv_length(METHOD);
    $cifrado=base64_decode($textoCifrado);
    $iv=substr($cifrado,0,$iv_len);
    $rawCif=substr($cifrado,$iv_len);

    $original=openssl_decrypt($rawCif,METHOD,$key,OPENSSL_RAW_DATA,$iv);
    return $original;
  }

  function atbash($text)
  {
    $a_z = range('a', 'z');
    $z_a = range('z', 'a');
    $text = preg_replace("/[^a-z0-9]+/", "", strtolower($text));
    $len = strlen($text);

    $count = 0;
    $codificado = [];
    foreach (str_split($text) as $char) {
        $count++;
        if (is_numeric($char)) {
            $codificado[] = $char;
        }
        if (ctype_lower($char)) {
            $codificado[] = $z_a[array_search($char, $a_z)];
        }
    }
    return implode('', $codificado);
  }

  function salt(){
    $todo="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&/()=?";
    $len=strlen($todo);
    $salt='';
    for ($i=0; $i < 15; $i++) {
      $salt .= $todo[rand(0, $len - 1)];
    }
    return $salt;
  }

  function pepper($text){
    $abc="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $lon=strlen($abc);
    $pepper='';
    for ($a=0; $a < 2; $a++) {
      $pepper .= $abc[rand(0, $lon - 1) ];
    }
    $text .= $pepper;
    return $text;
  }

  function registro($contra,$salt){
    $contra1=atbash($contra);
    $contra2=pepper($contra1);
    $contra3 = $contra2.$salt;
    $password=openssl_digest($contra3, HASH);
    $password1=cifrar($password);
    return $password1;
  }

  function acceso($icontra,$password1,$salt){
    $password2=descifrar($password1);
    $icontra1=atbash($icontra);
    $abc="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $len=strlen($abc);
    $true=0;
    for ($j=0; $j < $len; $j++) {
      for ($k=0; $k < $len; $k++) {
        $icontra3=$icontra1.$abc[$j].$abc[$k].$salt;
        $ipassword=openssl_digest($icontra3, HASH);
        if ($ipassword==$password2) {
          $true++;
        }
      }
    }
    echo $ipassword."<br />".$password2."<br />".$true."<br />";
    return $true;
  }

  function consultapass($conexion,$id,$contra){
    $sql = "SELECT condimento FROM usuarios WHERE id_usuario='$id'";
    $consulta_sql = mysqli_query($conexion, $sql);
    $salt = mysqli_fetch_array($consulta_sql);
    $sql2 = "SELECT password FROM usuarios WHERE id_usuario='$id'";
    $consulta_sql2 = mysqli_query($conexion, $sql2);
    $password = mysqli_fetch_array($consulta_sql2);
    $true=acceso($contra,$password[0],$salt[0]);
    return $true;
  }
  /*
  Contraseña al registrarse
  $contra1=atbash($contra);
  $salt=salt();
  $contra2=pepper($contra1);
  $contra3 = $contra2.$salt;
  $password=openssl_digest($contra3, HASH);
  $password1=cifrar($password);
  return $password1;

  Contraseña al acceder
  $icontra="passwordty";
  $password2=descifrar($password1);
  $icontra1=atbash($icontra);
  $abc="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  $len=strlen($abc);
  $true=0;
  for ($j=0; $j < $len; $j++) {
    for ($k=0; $k < $len; $k++) {
      $icontra3=$icontra1.$abc[$j].$abc[$k].$salt;
      $ipassword=openssl_digest($icontra3, HASH);
      if ($ipassword==$password2) {
        $true++;
      }
    }
  }
  if ($true==1) {
    echo "Misma contraseña";
  }
  else {
    echo "Contraseña equivocada";
  }
  */


?>
