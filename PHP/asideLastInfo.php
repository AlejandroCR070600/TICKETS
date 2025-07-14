<?php
require "conection.php";
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
ORDER BY t.folio DESC
LIMIT 1

";
$result=$conn->query($sql);
$datosE=[];

if($result->num_rows>0){
    $row=$result->fetch_assoc();
    $datosE=$row;

    echo json_encode($datosE);
}

?>