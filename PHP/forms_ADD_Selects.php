<?php
require "conection.php";

$sql1="SELECT nombre from supervisores";
$sql2="SELECT nombre from puesto";
$result1=$conn->query($sql1);
$result2=$conn->query($sql2);
$datos=["supervisores"=>[],
"puesto"=>[],
"MENSAGES"=>"",
"MENSAGEP"=>""
];

if($result1->num_rows>0){
    while($row=$result1->fetch_assoc()){
        $datos['supervisores'][]=$row;
        $datos=["MENSAGES"=>"SUPERVISORES LISTOS"];
    }
    echo json_encode($datos);
}else{
      while($row=$result1->fetch_assoc()){
    $datos=["MENSAGES"=>"NO HAY SUPERVISORES"];

    }
    
}
if($result2->num_rows>0){
    while($row=$result2->fetch_assoc()){
        $datos['puesto'][]=$row;
        $datos=["MENSAGEP"=>"PUESTOS LISTOS"];
    }
    
}else{
      while($row=$result1->fetch_assoc()){
    $datos=["MENSAGEP"=>"NO HAY SUPERVISORES"];

    }
    
}

echo json_encode($datos);


?>