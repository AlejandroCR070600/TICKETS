<?php
require "conection.php";

$host='127.0.0.1';
$port=4000;
$mensaje="nuevo usuario desde php";
$tablaTickets=[];
$sql="SELECT folio,fecha_Abierto,sucursal,usuario,telefono,problema,descripcion,ip_Equipo, estatus from tickets where estatus='ABIERTO' order by fecha_Abierto desc, hora_Abierto desc";
$result=$conn->query($sql);
if($result->num_rows>0){
    while($row =$result->fetch_assoc()){
        $tablaTickets[]=$row;
    }
    $json= json_encode($tablaTickets);
    
}


$socket=socket_create(AF_INET, SOCK_STREAM,SOL_TCP);

socket_connect($socket,$host,$port);

socket_write($socket, $json . "\n", strlen($json) + 1);

socket_close($socket);





?>