<?php
require "conection.php";
$sql="SELECT * from admin";
$result=$conn->query($sql);
$datos=[];
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $datos[]=$row;
        
    }
    echo json_encode($datos);
    
}else{
    $datos=["MENSAGE"=>"NO HAY PROBLEMAS"];
    echo json_encode($datos['MENSAGE']);
}


?>