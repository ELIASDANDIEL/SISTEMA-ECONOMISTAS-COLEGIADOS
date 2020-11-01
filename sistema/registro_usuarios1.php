/**
<?php
if(!empty($_POST))
{
$alert='';
if( empty($_POST['usuario']) ||empty($_POST['rol'])  ||empty($_POST['estado_civil']) || empty($_POST['nombre'])  || empty($_POST['universidad_procedencia'])||
empty($_POST['correo'])||empty($_POST['clave'])  || empty($_POST['celular']) ||empty($_POST['experiencia'])||  empty($_POST['monto_total_adeudado'])||
empty($_POST['otrosestudios']) ||empty($_POST['estado']) || empty($_POST['fecha_nacimiento']) || empty($_POST['fijo']) )
{
$alert= '<p class="msg_error">Todos los campos son obligatorios.</p>';
}else{
include "../conexion.php";
$nombre = $_POST['nombre'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];
$universidad_procedencia = $_POST['universidad_procedencia'];
$otrosestudios = $_POST['otrosestudios'];
$direccion = $_POST['direccion'];
$email = $_POST['correo'];
$celular = $_POST['celular'];
$fijo = $_POST['fijo'];
$experiencia = $_POST['experiencia'];
$estado_civil = $_POST['estado_civil'];
$monto_total_adeudado = $_POST['monto_total_adeudado'];
$rol = $_POST['rol'];
$user =$_POST['usuario'];
$clave = md5($_POST['clave']);
$estado = $_POST['estado'];



  $query= mysqli_query($conection,"SELECT * FROM colegiado WHERE  usuario = '$user' OR correo= '$email'");
  $result =mysqli_fetch_array($query);
  if($result >0) {
  $alert= '<p class="msg_error">El correo o el usuario ya existe.</p>';
  }else{

  $query_insert = mysqli_query($conection,"INSERT INTO colegiado(nombre,fecha_nacimiento,universidad_procedencia,especialidad_otrosestudios,direccion,correo,celular, fijo,experiencia,estado_civil,monto_total_adeudado,rol,usuario,clave,estado)
  VALUES('$nombre','$fecha_nacimiento','$universidad_procedencia','$especialidad_otrosestudios','$direccion','$email','$celular', '$fijo','$experiencia','$estado_civil','$monto_total_adeudado','$rol','$user','$clave','$estado')");

                if($query_insert){
                 $alert= '<p class="msg_save">Usuario creado Correctamente.</p>';
                }else{
                $alert= '<p class="msg_error">Error al crear el usuario.</p>';
                }
  }

}

}
?>
*/
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
		<h1>Registro Colegiado</h1>
		<hr>
		<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>
		<form action="" method="post">

       <label  for="nombre">Nombre</label>
       <input type="text" name="nombre" id="nombre" placeholder="Ingrese Nombre Completo"/><br>

       <label  for="fecha_nacimiento">Fecha de Nacimiento</label>
       <input type="date" name="fecha_nacimiento" id="fecha_nacimiento" placeholder="Fecha de nacimiento"/><br>

       <label  for="universidad_procedencia">Universidad de Procedencia</label>
       <input type="text" name="universidad_procedencia" id="universidad_procedencia" placeholder="Ingrese Universidad de Procedencia"/><br>

       <label  for="otrosestudios">Otros Estudios</label>
        <select name="otrosestudios" id="otrosestudios"><br>
        <option value="1">Ingenieria</option>
        <option value="2">Derecho</option>
        <option value="3">Administracion</option>
        <option value="4">Educacion</option>
        <option value="5">Ciencias de la Comunicacion</option>
        <option value="6">Otras</option>
        </select><br>

        <label  for="direccion">Direccion</label>
         <input type="text" name="direccion" id="direccion" placeholder="Ingresa Direccion"/><br>

        <label  for="correo">Correo Electronico</label>
        <input type="email" name="correo" id="correo" placeholder="Ingrese Correo Electronico"/><br>

        <label  for="celular">Celular</label>
        <input type="text" name="celular" id="celular" placeholder="Ingrese celular"/><br>

         <label  for="fijo">Fijo</label>
         <input type="text" name="fijo" id="fijo" placeholder="Ingrese telefono fijo"/><br>

        <label  for="experiencia">Experiencia Profesional</label>
        <input type="number" name="experiencia" id="experiencia" placeholder="Ingrese Experiencia Profesional"/><br>

       <label  for="estado_civil">Estado Civil</label>
       <select name="estado_civil" id="estado_civil">
              <option value="1">Soltero sin Hijos</option>
              <option value="2">Soltero con Hijos</option>
              <option value="3">Casado con Hijos</option>
              <option value="4">Casado sin Hijos</option>
              <option value="5">Viudo con Hijos</option>
              <option value="6">Viudo sin Hijos</option>
              <option value="7">Divorciado con Hijos</option>
              <option value="8">Divorciado sin Hijos</option>
              <option value="9">Separado con hijos</option>
              <option value="10">Separado con hijos</option>
        </select><br>

        <label  for="monto_total_adeudado">Monto Total Adeudado</label>
        <input type="number" name="monto_total_adeudado" id="monto_total_adeudado" placeholder="Ingresar Monto Total Adeudado"/><br>

        <label  for="rol">Tipo Usuario</label>
               <select name="rol" id="rol">
               <option value="1">Administrador</option>
               <option value="2">Colegiado</option>
               </select><br>

        <label  for="usuario">Usuario</label>
        <input type="text" name="usuario" id="usuario" placeholder="Ingrese Usuario"/><br>

        <label  for="clave">Clave</label>
        <input type="password" name="clave" id="clave" placeholder="Ingrese Clave de Acceso"/><br>

        <label  for="estado">Estado</label>
               <select name="estado" id="estado">
               <option value="1">Habilitado</option>
               <option value="2">Deshabilitado</option>

        </select><br>

        <input type="submit" value="Crear Colegiado" class="btn_save">
        </form>
       </div>

</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>
