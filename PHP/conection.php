<?php
date_default_timezone_set('America/Mexico_City');
// this is the conection to the data bases

$conn=new mysqli("localhost", "root","","tickets");
if($conn->connect_error){
    echo "conection faild: ". $conn->connect_error;
}

?>