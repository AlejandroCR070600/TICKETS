<?php
require 'clases/ticket.php';
require "conection.php";

$value=json_decode(file_get_contents('php://input', true));
$ticket=new ticket;

$ticket->selectChange($value);



?>