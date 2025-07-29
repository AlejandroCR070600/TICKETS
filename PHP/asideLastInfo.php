<?php
require "conection.php";
require "clases/ticket.php";
$value=json_decode(file_get_contents("php://input",true));
$ticket=new ticket();
$ticket->estatus=$value->estatus;
$ticket->asideLastInfo();
?>