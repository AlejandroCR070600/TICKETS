<?php
require "conection.php";

$sql="SELECT 
    t.folio,
    t.fecha_Abierto,
    t.hora_Abierto,
    s.nombre AS sucursal, 
    t.descripcion
    
    
FROM tickets t
INNER JOIN sucursal s ON t.sucursal = s.id

WHERE t.estatus = 'ABIERTO'
ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC
";
$result=$conn->query($sql);
$tickets=[];
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $tickets[]=$row;
        
    }
   echo json_encode($tickets);
}else{
    $tickets["MESSAGE"]="no hay tickets";
    echo json_encode($tickets);
}


?>