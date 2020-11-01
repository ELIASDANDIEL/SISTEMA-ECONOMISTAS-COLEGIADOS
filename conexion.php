<?php
$host = "localhost";
$user = "root";
$password ="";
$db= "usuarios_db";

$conection = @mysqli_connect($host,$user,$password,$db);
if(!$conection)
{ echo " **ERROR EN LA CONEXION";
}
?>