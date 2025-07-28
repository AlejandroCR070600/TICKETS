<?php

require 'clases/ticket.php';
require "conection.php";
$value=json_decode(file_get_contents("php://input",true));

$ticket=new ticket;
$ticket->sucursal=$value->sucursal;
$ticket->usuario=$value->usuario;
$ticket->telefono=$value->telefono;
$ticket->problema=$value->problema;
$ticket->descripcion=$value->descripcion;
$ticket->ipEquipo=$value->ipEquipo;
$ticket->addTicket();








?>