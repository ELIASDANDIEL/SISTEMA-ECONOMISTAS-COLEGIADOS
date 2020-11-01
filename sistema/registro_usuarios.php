<?php
if(!empty($_POST))
{
$alert='';
if(empty($_POST['nombre'])|| empty($_POST['correo']) || empty($_POST['user'])||
empty($_POST['clave']) )
{
$alert= '<p class="msg_error">Todos los campos son obligatorios.</p>';

}else{
include "../conexion.php";
$nombre = $_POST['nombre'];
$email = $_POST['correo'];
$user =$_POST['user'];
$clave = md5($_POST['clave']);
$rol = $_POST['rol'];
$fechanacimiento = $_POST['fechanacimiento'];
$universidadprocedencia = $_POST['universidadprocedencia'];
$direccion = $_POST['direccion'];
$celular = $_POST['celular'];
$fijo = $_POST['fijo'];
$idexperiencia = $_POST['idexperiencia'];
$estado_civil = $_POST['estado_civil'];
$monto_total_adeudado = $_POST['monto_total_adeudado'];
$dni = $_POST['dni'];
$estado = $_POST['estado'];
$otros_estudios = $_POST['otros_estudios'];


  $query= mysqli_query($conection,"SELECT * FROM usuario WHERE  usuario = '$user' OR correo= '$email'");
  $result =mysqli_fetch_array($query);
  if($result >0) {
  $alert= '<p class="msg_error">El correo o el Colegiado ya existe.</p>';
  }else{

  $query_insert = mysqli_query($conection,"INSERT INTO usuario(nombre,correo,usuario,clave,rol,fechanacimiento,universidadprocedencia,direccion,celular,fijo,idexperiencia,estado_civil,monto_total_adeudado,dni,estado,otros_estudios)
                                                        VALUES('$nombre','$email','$user','$clave','$rol','$fechanacimiento','$universidadprocedencia',$direccion','$celular','$fijo','$idexperiencia','$estado_civil','$monto_total_adeudado','$dni','$estado','$otros_estudios')");

                if($query_insert){
                 $alert= '<p class="msg_save">Colegiado creado Correctamente.</p>';
                }else{
                $alert= '<p class="msg_error">Error al crear el Colegiado.</p>';
                }
  }

}

}



?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   <?php include "includes/scripts.php"; ?>
	<title>Registro Colegiados</title>
</head>
<body>
 <?php include "includes/header.php"; ?>
	<section id="container">
		<div class="form_register">
		<h1>Registro Colegiados</h1>
		<hr>
		<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>
		<form action="" method="post">

       <label  for="nombre">Nombre</label>
       <input type="text" name="nombre" id="nombre" placeholder="Nombre Completo"/><br>

       <label  for="correo">Correo Electronico</label>
       <input type="email" name="correo" id="correo" placeholder="Correo Electronico"/><br>



       <label  for="usuario">Usuario</label><br>
       <input type="text" name="usuario" id="usuario" placeholder="Usuario"/><br>

       <label  for="clave">Clave</label><br>
       <input type="password" name="clave" id="clave" placeholder="Clave de Acceso"/>

       <label  for="rol">Rol :</label>
                          <select name="rol" id="rol">
                          <option value="1">Administrador</option>
                          <option value="2">Colegiado</option>
                          </select>
<label  for="universidadprocedencia">Universidad de Procedencia</label>
       <input type="text" name="universidadprocedencia" id="universidadprocedencia" placeholder="Universidad de Procedencia"/>

        <label  for="fechanacimiento">Fecha de Nacimiento</label>
       <input type="date" name="fechanacimiento" id="fechanacimiento" placeholder="Fecha de Nacimiento"/
       <label  for="direccion">Direccion</label><br>
       <input type="text" name="direccion" id="direccion" placeholder="Direccion"/>

       <label  for="celular">Celular</label><br>
       <input type="text" name="celular" id="celular" placeholder="Celular"/>

       <label  for="fijo">Fijo</label><br>
       <input type="text" name="fijo" id="fijo" placeholder="Fijo"/>
<label  for="idexperiencia">Experiencia</label><br>
       <input type="text" name="idexperiencia" id="idexperiencia" placeholder="Experiencia"/>

       <label  for="dni">Dni</label><br>
            <input type="number" name="dni" id="dni" placeholder="Dni"/>
<label  for="estado_civil">Estado Civil</label>
              <select name="estado_civil" id="estado_civil">
              <option value="1">Soltero sin Hijos</option>
              <option value="2">Casado sin Hijos</option>
              <option value="3">Soltero con Hijos</option>
              <option value="4">Casado con Hijos</option>
              <option value="5">Viudo con Hijos</option>
              <option value="6">Viudo sin Hijos</option>
              <option value="7">Divorciado con Hijos</option>
              <option value="8">Divorciado sin Hijos</option>
              <option value="9">Separado con Hijos</option>
              <option value="10">Separado sin Hijos</option>
              </select></br>
<label  for="monto_total_adeudado"> Monto Total Adeudado </label>
     <input type="number" name="monto_total_adeudado" id="monto_total_adeudado" placeholder="Monto Total Adeudado<"/>

<label  for="estado">Estado :</label>
                   <select name="estado" id="estado">
                   <option value="1">Habilitado</option>
                   <option value="2">Deshabilitado</option>
                   </select>
<label  for="otros_estudios">Especialidad Otros estudios :</label>
                        <select name="otros_estudios" id="otros_estudios">
                        <option value="1">Derecho y Ciencias Politicas</option>
                        <option value="2">Ingenieria y Construccion</option>
                        <option value="3">Informatica y Telecomunicaciones</option>
                        <option value="4">Ciencias de la Comunicacion</option>
                        <option value="5">Educacion</option>
                        <option value="6">Otras</option>
                        </select>
<input type="submit" value="Crear Usuario" class="btn_save"/>
</form>
       </div>

	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>
/*
/*

*/
