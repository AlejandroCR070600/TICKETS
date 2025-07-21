<?php
require 'clases/ticket.php';

$value=json_decode(file_get_contents("php://input",true));

$ticket=new ticket;

$ticket->fecha_Cerrado=date("Y-m-d");
$ticket->hora_Cerrado=date("H:i:s");
$ticket->folio=$value->folio;
$ticket->falla_Real=$value->falla_Real;
$ticket->causa=$value->causa;
$ticket->recomendacion=$value->recomendacion;
$ticket->area=$value->area;
$ticket->modo=$value->modo;
$ticket->equipo=$value->equipo;
$ticket->admin=$value->admin;
$ticket->turno='MATUTINO';
$ticket->error_Sucursal=$value->error_Sucursal;
$ticket->estatus="CERRADO";
$ticket->mes=date("m");
$ticket->year=date("Y");
$ticket->closeTicket();



//echo json_encode($value->folio);









?>