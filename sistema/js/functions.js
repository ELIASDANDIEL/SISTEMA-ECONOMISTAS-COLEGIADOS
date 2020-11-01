//alert("hola mundo");
<?php
date_default_timezone_set('America/Peru');
function fechaC(){
$mes = array("", "Enero",
                 "Febrero",
                 "Marzo",
                 "Abril",
                 "Mayo",
                 "Junio",
                 "Julio",
                 "Agosto",
                 "Septiembre",
                 "Octubre",
                 "Noviembre",
                 "Dciembre");
return date('d')." de ".$mes[date('n')]  .  " de " .date('Y');
}
?>