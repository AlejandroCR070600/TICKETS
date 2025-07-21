<?php
require "conection.php";
$value=json_decode(file_get_contents("php://input", true));

$sql="SELECT 
    t.folio,
    t.fecha_Abierto,
    t.hora_Abierto,
    s.nombre AS sucursal,
    t.usuario,
    t.telefono,
    p.nombre AS problema,
    t.descripcion,
    t.ip_Equipo,
    t.estatus
FROM tickets t
INNER JOIN sucursal s ON t.sucursal = s.id
INNER JOIN problema p ON t.problema = p.id
WHERE t.estatus = ?
ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC
";

$stmt=$conn->prepare($sql);
$stmt->bind_param("s", $value->ESTATUS);
$stmt->execute();
$tickets=[];
$result=$stmt->get_result();
if($result->num_rows>0){
    
    while($row=$result->fetch_assoc()){
        $tickets[]=$row;
        
        
    }
    echo json_encode($tickets);
}else{
    $tickets[ "MESSAGE"]="no hay tickets";
    echo json_encode($tickets);
}


?>