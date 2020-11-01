$(document).ready(function() {
var user_id, opcion;
opcion = 4;
    
tablaUsuarios = $('#tablaUsuarios').DataTable({  
    "ajax":{            
        "url": "bd/crud.php", 
        "method": 'POST', //usamos el metodo POST
        "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
        "dataSrc":""
    },
    "columns":[
        {"data": "user_id"},
        {"data": "nombre"},
        {"data": "correo"},
        {"data": "usuario"},
        {"data": "clave"},
        {"data": "rol"},
        {"data": "universidadprocedencia"},
        {"data": "fechanacimiento"},
        {"data": "direccion"},
        {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btn-sm btnEditar'><i class='material-icons'>edit</i></button><button class='btn btn-danger btn-sm btnBorrar'><i class='material-icons'>delete</i></button></div></div>"}
    ]
});     

var fila; //captura la fila, para editar o eliminar
//submit para el Alta y Actualización
$('#formUsuarios').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    nombre = $.trim($('#nombre').val());
    correo = $.trim($('#correo').val());
    usuario = $.trim($('#usuario').val());
    clave = $.trim($('#clave').val());
    rol = $.trim($('#rol').val());
    universidadprocedencia = $.trim($('#universidadprocedencia').val());
    fechanacimiento = $.trim($('#fechanacimiento').val());
    direccion = $.trim($('#direccion').val());
        $.ajax({
          url: "bd/crud.php",
          type: "POST",
          datatype:"json",    
          data:  {user_id:user_id,nombre:nombre, correo:correo, usuario:usuario, clave:clave, rol:rol, universidadprocedencia:universidadprocedencia, fechanacimiento:fechanacimiento,direccion:direccion,opcion:opcion},
          success: function(data) {
            tablaUsuarios.ajax.reload(null, false);
           }
        });			        
    $('#modalCRUD').modal('hide');											     			
});
        
 

//para limpiar los campos antes de dar de Alta una Persona
$("#btnNuevo").click(function(){
    opcion = 1; //alta           
    user_id=null;
    $("#formUsuarios").trigger("reset");
    $(".modal-header").css( "background-color", "#17a2b8");
    $(".modal-header").css( "color", "white" );
    $(".modal-title").text("Alta de Usuario");
    $('#modalCRUD').modal('show');	    
});

//Editar        
$(document).on("click", ".btnEditar", function(){		        
    opcion = 2;//editar
    fila = $(this).closest("tr");	        
    user_id = parseInt(fila.find('td:eq(0)').text()); //capturo el ID		            
    nombre = fila.find('td:eq(1)').text();
    correo = fila.find('td:eq(2)').text();
    usuario = fila.find('td:eq(3)').text();
    clave = fila.find('td:eq(4)').text();
    rol = fila.find('td:eq(5)').text();
    universidadprocedencia = fila.find('td:eq(6)').text();
    fechanacimiento= fila.find('td:eq(7)').text();
    direccion = fila.find('td:eq(8)').text();
    $("#nombre").val(nombre);
    $("#correo").val(correo);
    $("#usuario").val(usuario);
    $("#clave").val(clave);
    $("#rol").val(rol);
    $("#universidadprocedencia").val(universidadprocedencia);
    $("#fechanacimiento").val(fechanacimiento);
    $("#direccion").val(direccion);
    $(".modal-header").css("background-color", "#007bff");
    $(".modal-header").css("color", "white" );
    $(".modal-title").text("Editar Usuario");		
    $('#modalCRUD').modal('show');		   
});

//Borrar
$(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    user_id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;		
    opcion = 3; //eliminar        
    var respuesta = confirm("¿Está seguro de borrar el registro "+user_id+"?");                
    if (respuesta) {            
        $.ajax({
          url: "bd/crud.php",
          type: "POST",
          datatype:"json",    
          data:  {opcion:opcion, user_id:user_id},    
          success: function() {
              tablaUsuarios.row(fila.parents('tr')).remove().draw();                  
           }
        });	
    }
 });
     
});    