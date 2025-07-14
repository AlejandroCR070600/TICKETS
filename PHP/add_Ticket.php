<?php
require "conection.php";
$value=json_decode(file_get_contents("php://input",true));

function crearFolio(){
    $random_Num=random_int(1,99);
    $folio="SF".date("d").date("m").date("H").date("i").$random_Num;
    return $folio;
}

$date=[];

if(
    empty($value->sucursal) ||
    empty($value->usuario) ||
    empty($value->telefono) ||
    empty($value->problema) ||
    empty($value->descripcion) ||
    empty($value->ipEquipo)){
    
 $date=$value;
    $datesJS=["MENSAGE"=>"Tienes un campo vacio"];
}else{
$date=$value;
    
    $fecha_Abierto=date("Y-m-d");
    $hora_Abierto=date("H:i:s");
    $folio=crearFolio();
    $sucursal=$date->sucursal;
    $usuario=$date->usuario;
    $telefono=$date->telefono;
    $problema=$date->problema;
    $descripcion=$date->descripcion;
    $ipEquipo=$date->ipEquipo;
    
  
    

    $sql="INSERT INTO tickets(folio, sucursal, usuario, telefono, descripcion, ip_Equipo, fecha_Abierto, hora_Abierto ,problema) values (?,?,?,?,?,?,?,?,?)";
    $stmt=$conn->prepare($sql);
    $stmt->bind_param("sissssssi", $folio,$sucursal,$usuario,$telefono,$descripcion,$ipEquipo,$fecha_Abierto, $hora_Abierto,$problema);

    if($stmt->execute()===true){
        $MENSAGE=["MENSAGE"=>"se realizo el ticket con exito"];
        echo json_encode($MENSAGE);
        $stmt->close();
        exit;
    }else{
        $MENSAGE=["MENSAGE"=>"hubo un problema al realizar el ticket"];
        echo json_encode($MENSAGE);
        $stmt->close();
        exit;
    }
}







?>