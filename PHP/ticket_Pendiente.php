<?php
require 'clases/ticket.php';
require "conection.php";
$value=json_decode(file_get_contents("php://input", true));

$ticket=new ticket();
$ticket->folio=$value->folio;
$ticket->seguimiento=$value->seguimiento;
$fecha=date("Y-m-d");
$ticket->ticketPendiente($fecha);


?>