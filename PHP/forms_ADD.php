<?php
require "conection.php";
$value=json_decode(file_get_contents("php://input", true));


switch($value->tabla){
    case "sucursal":
        $sucursal= strtoupper($value->sucursal);
        $table="sucursal";
        $columnas="nombre, supervisor, segmento";
        $signo="?,?,?";
        $valores=[$sucursal,$value->supervisor,$value->segmento];
        $tipo="sii";
    break;

    case "problema":
        $table="problema";
        $columnas="nombre";
        $signo="?";
        $valores=[$value->nombre];
        $tipo="s";
    break;
    case "admin":
        $table="admin";
        $columnas="nombre, puesto";
        $signo="?,?";
        $valores=[$value->nombre, $value->puesto];
        $tipo="si";
    break;
    case "equipo":
        $table="equipo";
        $columnas="nombre";
        $signo="?";
        $valores=[$value->nombre];
        $tipo="s";
    break;
    case "supervisores":
        $table="supervisores";
        $signo="?, ?, ?";
        $columnas="nombre, correo, telefono";
        $valores=[$value->nombre, $value->correo, $value->telefono];
        $tipo="sss";
    break;
    case "area":
        $table="area";
        $signo="?";
        $columnas="nombre";
        $valores=[$value->nombre];
        $tipo="s";
    break;
    case "puesto":
        $table="puesto";
        $signo="?";
        $columnas="nombre";
        $valores=[$value->nombre];
        $tipo="s";
    break;

}



$sql="insert into $table($columnas) values ($signo)";
$stmt=$conn->prepare($sql);
$stmt->bind_param("$tipo", ...$valores);
if($stmt->execute()===true){
    $MENSAGE=["MENSAGE"=>"se agrego nuevo elemento a $value->tabla"];
    echo json_encode($MENSAGE);
}else{
    $MENSAGE=["MENSAGE"=>"no se pudo agregar nuevo elemento a $value->tabla"];
    echo json_encode($MENSAGE);
}



?>