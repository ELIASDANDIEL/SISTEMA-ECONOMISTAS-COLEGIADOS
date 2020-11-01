<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$correo = (isset($_POST['correo'])) ? $_POST['correo'] : '';
$usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
$clave = (isset($_POST['clave'])) ? $_POST['clave'] : '';
$rol = (isset($_POST['rol'])) ? $_POST['rol'] : '';
$universidadprocedencia = (isset($_POST['universidadprocedencia'])) ? $_POST['universidadprocedencia'] : '';
$fechanacimiento = (isset($_POST['fechanacimiento'])) ? $_POST['fechanacimiento'] : '';
$direccion = (isset($_POST['direccion'])) ? $_POST['direccion'] : '';


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$user_id = (isset($_POST['user_id'])) ? $_POST['user_id'] : '';


switch($opcion){
    case 1:
            $consulta = "INSERT INTO usuarios (nombre, correo, usuario, clave, rol, universidadprocedencia,fechanacimiento,direccion)
VALUES('$nombre', '$correo', '$usuario', '$clave' ,'$rol', '$universidadprocedencia','$fechanacimiento','$direccion') ";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();
        
        $consulta = "SELECT * FROM usuarios ORDER BY user_id DESC LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);       
        break;    
    case 2:
            $consulta = "UPDATE usuarios SET nombre='$nombre', correo='$correo', usuario='$usuario', clave='$clave', rol='$rol', universidadprocedencia='$universidadprocedencia','fechanacimiento=$fechanacimiento','direccion=$direccion'";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();
        
        $consulta = "SELECT * FROM usuarios WHERE user_id='$user_id' ";       
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 3:        
        $consulta = "DELETE FROM usuarios WHERE user_id='$user_id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;
    case 4:    
        $consulta = "SELECT * FROM usuarios";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);//envio el array final el formato json a AJAX
$conexion=null;