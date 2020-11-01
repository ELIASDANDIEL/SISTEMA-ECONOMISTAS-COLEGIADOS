//Código para Datables

//$('#example').DataTable(); //Para inicializar datatables de la manera más simple

$(document).ready(function() {
    tablaPersonas = $("#tablaPersonas").DataTable({
            "columnDefs":[{
            "targets": -1,
            "data":null,
            "defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btnEditar'>Editar</button><button class='btn btn-danger btnBorrar'>Borrar</button></div></div>"
        }],
        //Para cambiar el lenguaje a español
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast":"Último",
                "sNext":"Siguiente",
                "sPrevious": "Anterior"
            },
            "sProcessing":"Procesando...",
        }

    });
    $("#btnNuevo").click(function(){
        $("#formPersonas").trigger("reset");
        $(".modal-header").css("background-color", "#28a745");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nueva Persona");
        $("#modalCRUD").modal("show");
        idpersona=null;
    });

    $("#formPersonas").submit(function(e){
        e.preventDefault();//evita que se recargue la pagina
        idpersona = $.trim($("#idpersona").val());
        nombre = $.trim($("#nombre").val());
        correo = $.trim($("#correo").val());
        usuario = $.trim($("#usuario").val());
        clave = $.trim($("#clave").val());
        rol = $.trim($("#rol").val());
        $.ajax({
            url: "economistas/sistema/probando_crud1/bd/crud.php",
            type: "POST",
            dataType: "json",
            data: {nombre:nombre, correo:correo, usuario:usuario, clave:clave, rol:rol,idpersona:idpersona},

            success: function(data){
                console.log(data);

                var datos = JSON.parse(data);//Para darle un formatoa los arreglos o vectores que estamos recibiendo.
                idpersona = data[0].idpersona;
                nombre = data[0].nombre;
                correo = data[0].correo;
                usuario = data[0].usuario;
                clave = data[0].clave;
                rol = data[0].rol;
                //if(opcion == 1){
                    tablaPersonas.row.add([idpersona,nombre,correo,usuario,clave,rol]).draw();
                //}else{tablaPersonas.row(fila).data([id,nombre,pais,edad]).draw();}
            }
        });
        $("#modalCRUD").modal("hide");

    });
});