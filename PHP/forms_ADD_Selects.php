<?php
require "conection.php";

$sql1="SELECT * from supervisores";
$sql2="SELECT * from puesto";
$result1=$conn->query($sql1);
$result2=$conn->query($sql2);
$datos=["supervisores"=>[],
"puesto"=>[],
"MENSAGES"=>"",
"MENSAGEP"=>""
];

if($result1->num_rows>0){
    while($rowS=$result1->fetch_assoc()){
        $datos['supervisores'][]=$rowS;
        
    }
    $datos['MENSAGES']=["SUPERVISORES LISTOS"];
    
}else{
    
    $datos['MENSAGES']=["NO HAY SUPERVISORES"];

    
    
}
if($result2->num_rows>0){
    while($rowP=$result2->fetch_assoc()){
        $datos['puesto'][]=$rowP;
        
    }
    $datos['MENSAGEP']=["PUESTOS LISTOS"];
    
}else{
     
    $datos['MENSAGEP']=["NO HAY PUESTOS"];

    
    
}

echo json_encode($datos);


?>