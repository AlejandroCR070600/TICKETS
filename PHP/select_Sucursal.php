<?php
require "conection.php";
$sql="SELECT * from sucursal";
$result=$conn->query($sql);
$datos=[];
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $datos[]=$row;
        
    }
    echo json_encode($datos);
    
}else{
    $datos=["MENSAGE"=>"NO HAY SUCURSALES"];
    echo json_encode($datos['MENSAGE']);
}


?>