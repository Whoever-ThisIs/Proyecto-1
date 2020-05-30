# Proyecto-1
-NOMBRE DEL PROYECTO: "Proyecto de administración de cafetería."

-NOMBRE DEL EQUIPO: "Axoyotes"

-INTEGRANTES EL EQUIPO:
    1.- Herrera González Silvia.
    2.- López Contreras Abraham Emilio.
    3.- López Esquivel Emiliano.
    4.- Pavón Álvarez Lenin.

-GUÍA DE INSTALACIÓN EL PROYECTO:
    1.- Instalar ATOM,  lo puedes instalar dando clik en el siguiente link https://atom.io/
    2.- Instalar XAMPP, lo puedes obtener en la siguiente liga https://www.apachefriends.org/es/index.html
    3.- Una vez instalado XAMPP, asegurate de encender el servidor MySQL en tu panel de control XAMPP, dando clik en Start (deberas esperar hasta que esté de color verde).
    4.- Si no posee una cuenta en git, registrarse.
    5.- Buscar el repositorio con el nombre de Proyecto-1.
    6.- Copiar el link del repositorio.
    7.- Entrar a la consola de la computadora (Windows + R).
    8.- Colocar cmd.
    9.- En la consola, si se esta dentro de C:, escribir el comando: cd/xampp/mysql/mysql/bin
    10.- Una vez dentro de la carpeta bin, escribir el siguiente comando: mysql -u root
    11.- Pegar el link del repositorio utilzando: git clone <pegar el link del repositorio>
    12.- Pegar la base de datos en la consola utilizando: source <pegar la base de datos>
    13.- Abrir en el navegador el archivo de "Bienvenida.php"

-RESUMEN DEL FUNCIONAMIENTO DEL PROYECTO:
    Nuestro proyecto funciona de la siguiente manera:
    Es una página web, desde la cual la comunidad estudiantil de la preparatoria 6 "Antonio Caso" puede ordenar comida. Esta página web contempla a tres tipos de usuarios:
    1.- ADMINISTRADORES DEL SISTEMA: son los encargados de agregar, modificar o eliminar los productos de la cafetería, pueden regular la cantidad de usuarios y la modificación de su información.

    2.- SUPERVISORES DE PEDIDO: son los encargados de verificar las órdenes y de hacer la entrega de los pedidos. Ellos pueden finalizar la entrega con éxito, o en el caso que el cliente no liquide, tenga un retraso o no recoja su pedido, el supervisor es capaz de aplicar una sanción (el cliente no podrá ordenar comida durante 5 días hábiles).

    3.- CLIENTE: tenemos 4 categorias distintas, las cuales son: profesor, funcionario, trabajador y estudiante. En caso de ser estudiante, deberá ingresar su nombre, grupo y usuario (No. cuenta). Si es profesor o funcionario, su cuenta contara con nombre, colegio y un usuario, el cual será su RFC. En el caso del trabajador, el usuario será el número del trabajador y tambien se almacenara su nombre.

    Utilizamos HTML como maquetado. Los archivos de este tipo se encuentran dentro de la carpeta Templates, que es en donde se encuentran todos los maquetados del Sitio Accesible por el usuario:
    -Registro.html: se conecta con Alumnos.html, Profesor.html, Funcionario.html, Trabajador.html; para enviar el tipo de categoría.
    -Alumnos.html: hace la validación de datos, nombres (uno o dos), número de cuenta (9 dígitos), grupo, contraseña (8 o más caracteres, al menos un caracter especial, al menos un número).
    -Profesor.html: validación de datos; nombre (uno o dos nombres), colegio con select, RFC, contraseña (8 o más caracteres, al menos un caracter especial, al menos un número).
    -Funcionario.html: validación de datos; nombre (uno o dos nombres), colegio con select, RFC, contraseña (8 o más caracteres, al menos un caracter especial, al menos un número).
    -Trabajador.html: validación de datos; nombres (uno o dos), número de trabajador (9 números), contraseña (8 o más caracteres, al menos un caracter especial, al menos un número).
    -Inicio de sesión.html:aqui se ingresa el usuario y la contraseña, y se hace una validación de datos del usuario.

    También tenemos los del Sitio del Administrador, los cuales son:
    -Bienvenida.html: ingresa el usuario y la contraseña y se hace una validación de datos de: si el usuario existe y si la contraseña es correcta. Si ambos coinciden se hace una conexión con trabajador o administrador.
    Por el contrario, si la contraseña es incorrecta se imprimira en la pantalla un error y se hará una conexión con la bienvenida.
    -Trabajador.html: si es que hay pedidos con un select, se enviará al panel de control con una variable Post, la cual nos permitirá saber que pedido se va a manejar. En el panel de control se hará una impresión del edificio y de la hora de entrega, habrá un botón para entregar el pedido y otro para cancelarlo (en este caso se hará una conexión con la cancelación).
    Si no hay un pedido, habrá una impresión que indique que noy hay pedidos.
    -Cancelación.html: con un select, se seleccionará la razón de la cancelación del pedido, también una sección para colocar comentarios (textarea) y hará conexión con cancelación.php
    -Administrador.html: se tiene una gestión y conexión de productos y otra con usuarios.
    En la conexión con usuarios se establece un límite (conexión con limite.php), en donde se actualiza SQL del gestor de base de datos.


    Nuestro proyecto es manejado con php del lado del servidor.
    Nuestros archivos php tienen distintas funciones:
      -Bienvenida.php: este verifica si hay sesiones abiertas, está conectada con el menú, registro e inicio de sesión.
      -TipoDeUsuario.php: este está conectado con la base de datos, aquí se guardan los datos personales y el tipo de usuario (alumno, profesor, funcionario, trabajador), tambien aqui se hace el hasheo de las contraseñas. La contraseña y usuario se guarda en Usuarios.html.
      -Validación: Consulta SQL y valida los datos, si ambos datos son validos hace una conexión con el menú. Si hay un error, pero el usuario existe se tiene un boton para regresar al inicio de sesión.
      -Menu.php: consulta SQL y si la cantidad de pedidos es mayor a 0 se muestra el menú y se tiene un boton para ordenar.
      -Pedidos.php:aquí aparecen todos los elementos que estan disponibles en el menú. Se ordena la cantidad de pedidos y se selecciona el lugar de entrega (a partir de la base de datos). Se conecta con la validación del pedido.
      -ValidaciónDePedido.php: consulta al menú, y si el usuario no ha pedido alimentos, se valida si la cantidad ingresada es valida. Se crea el pedido y se envia el estatus del pedido, la asignación del mensajero, el envio del lugar, fecha y el costo.
      Se crea la entrega: se envia el id_pedido, id_alimento, cantidad, consulta SQL de los alimentos, el precio, actualiza el costo del pedido.
      Si el usuario ya habia pedido alimentos, se valida si la cantidad ingresada es correcta, actualiza el menú, actualiza el pedido y el envio del lugar. Actualiza la entrega, envio del id_pedido, id_alimento, envio de la cantidad, consulta SQL  de los alimentos, precio y actualización de costo en pedidos.
      -Cancelacion.php: actualiza el estatus del pedido a cancelado, se realiza una inserción a cancelación con el id_pedido.
      -Limite.php: actualiza SQL del gestor de base de datos.
      -ControlDeUsuario.php: si hay un usuario muestra la información del usuario; si no hay usuario muestra que no hay usuario que coincida con el nombre. Tiene un botón de modificador de datos, conecta con modificación.php. También tiene un botón de eliminar datos, conecta con eliminacion.php.


-COMENTARIOS ADICIONALES:
