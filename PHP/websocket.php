<?php
require "conection.php";

$host='127.0.0.1';
$port=4000;
$mensaje="nuevo usuario desde php";
$tablaTickets=[];
$sql="SELECT 
    t.folio,
    t.fecha_Abierto,
    t.hora_Abierto,
    s.nombre AS sucursal,
    t.descripcion,
  
FROM tickets t
INNER JOIN sucursal s ON t.sucursal = s.id
WHERE t.estatus = 'ABIERTO'
ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC";
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