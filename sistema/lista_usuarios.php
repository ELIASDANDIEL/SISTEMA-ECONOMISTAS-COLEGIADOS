<?php
include "../conexion.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   <?php include "includes/scripts.php"; ?>
	<title>Sistema Economistas</title>
</head>
<body>
 <?php include "includes/header.php"; ?>
	<section id="container">
		<h1>Lista de Usuarios</h1>
		<a href="registro_usuarios.php" class="btn_new">Crear usuarios</a>
		<table>
		<tr>
		<th>ID</th>
		<th>Nombres</th>
		<th>Correo</th>
		<th>Rol</th>Eliminar
		<th>Acciones</th>
		</tr>
		<?php
		$query = mysqli_query($conection ,"SELECT u.idusuario,u.nombre,u.correo,u.usuario,r
		.rol  FROM usuario u inner JOIN rol r on u.rol=r.idrol");
         $resul = mysqli_num_rows($query);
         if($resul >0){


         }
		?>


		<tr>
		  <td>1</td>
          <td>Jorge</td>
          <td>Jorge@gmail.com</td>
          <td>RolAdministrador</td>
          <td>
          <a class="link_edit" href="#">Editar</a>
          |
          <a class="link_delete" href="#">Eliminar</a>
          </td>
        </tr>

        </table>
    </section>
  <?php include "includes/footer.php"; ?>
</body>
</html>