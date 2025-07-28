<?php
session_start();
require "../conection.php";
require '../clases/ticket.php';

$value=json_decode(file_get_contents("php://input", true));

$ticket=new ticket();
$ticket->sucursal=strtoupper($_SESSION['usuario']);
$ticket->estatus=$value->estatus;
$ticket->asieLIU();

?>