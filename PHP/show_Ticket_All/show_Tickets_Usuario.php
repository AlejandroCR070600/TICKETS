<?php
session_start();
require '../clases/ticket.php';
require "../conection.php";
header("Content-Type: application/json");
$value=json_decode(file_get_contents("php://input",true));

$ticket=new ticket();
$ticket->sucursal=strtoupper($_SESSION['usuario']);
$ticket->estatus=$value->estatus;
$ticket->showTicketsUsuarios();

?>