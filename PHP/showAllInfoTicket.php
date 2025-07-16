<?php
require "conection.php";

$value=json_decode(file_get_contents("php://input",true));


$sql="SELECT
  t.folio,
  t.usuario,
  t.telefono,
  t.descripcion,
  t.ip_Equipo,
  t.falla_Real,
  t.causa,
  t.recomendacion,
  t.estatus,
  t.modo,
  t.turno,
  t.error_Sucursal,
  t.tiempo_Solucion,
  t.mes,
  t.year,
  t.fecha_Abierto,
  t.hora_Abierto,
  t.fecha_Cerrado,
  t.hora_Cerrado,

  s.nombre AS sucursal,
  a.nombre AS area,
  e.nombre AS equipo,
  u.nombre AS atendio,
  p.nombre AS problema

FROM tickets t 
INNER JOIN sucursal s ON t.sucursal = s.id
INNER JOIN area a ON t.area = a.id
INNER JOIN equipo e ON t.equipo = e.id
INNER JOIN admin u ON t.atendio = u.id
INNER JOIN problema p ON t.problema = p.id
where folio='$value'

";
$result=$conn->query($sql);
$datosE=[];
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $datosE[]=$row;

    }
    echo json_encode($datosE);
    

}



?>