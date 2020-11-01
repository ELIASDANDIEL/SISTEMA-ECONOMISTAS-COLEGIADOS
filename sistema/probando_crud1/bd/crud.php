<?php
include_once 'bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

// Recepción de los datos enviados mediante POST desde el JS   

$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$correo = (isset($_POST['correo'])) ? $_POST['correo'] : '';
$usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
$clave = (isset($_POST['clave'])) ? $_POST['clave'] : '';
$rol = (isset($_POST['rol'])) ? $_POST['rol'] : '';
//$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
//$idusuario = (isset($_POST['id'])) ? $_POST['id'] : '';
//switch($opcion){
    //case 1: //alta
        $consulta = "INSERT INTO personas (nombre, correo, usuario,clave,rol) VALUES('$nombre', '$correo', '$usuario','$clave','$rol') ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 

        $consulta = "SELECT idpersona ,nombre,correo,usuario,clave,rol FROM personas ORDER BY id DESC LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
       // break;
   /* case 2: //modificación
        $consulta = "UPDATE usuario SET nombre='$nombre', correo='$correo', usuario='$usuario' , clave=$clave , rol=$rol WHERE idusuario=''$idusuario ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        
        $consulta = "SELECT id, nombre, correo, usuario , clave, rol  FROM usuario WHERE idusuario='$idusuario' ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 3://baja
        $consulta = "DELETE FROM usuario WHERE idusuario='$idusuario' ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;         */
//}

print json_encode($data, JSON_UNESCAPED_UNICODE); //enviar el array final en formato json a JS
$conexion = NULL;
