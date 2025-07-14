<?php
require "conection.php";

$value=json_decode(file_get_contents("php://input",true));



$fechaCerrado=date("Y-m-d");
$horaCerrado=date("H:i:s");
$folio=$value->folio;
$falla_Real=$value->falla_Real;
$causa=$value->causa;
$recomendacion=$value->recomendacion;
$area=$value->area;
$modo=$value->modo;
$equipo=$value->equipo;
$admin=$value->admin;
$turno=$value->turno;
$error_Sucursal=$value->error_Sucursal;
$estatus="CERRADO";
$tiempo_Solucion=getTimeOfClosing($value->folio);
$mes=date("m");
$year=date("Y");
$sql="UPDATE tickets SET falla_Real=?, 
    causa=?, 
    recomendacion=?, 
    area=?, 
    equipo=?, 
    modo=?, 
    atendio=?,
    turno=?,
    error_Sucursal=?, 
    tiempo_solucion=?, 
    mes=?, 
    year=?,
    estatus=?, 
    fecha_Cerrado=?, 
    hora_Cerrado=? where folio = ?" ;

    $stmt=$conn->prepare($sql);
    $stmt->bind_param("sssiisiisiiissss",
    $falla_Real,
    $causa,
    $recomendacion,
    $area, 
    $equipo,
    $modo, 
    $admin,
    $turno,
    $error_Sucursal,
    $tiempo_Solucion,
    $mes,
    $year,
    $estatus,
    $fechaCerrado,
    $horaCerrado,
    $folio);
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


//echo json_encode($value->folio);

function getTimeOfClosing($folio){
    global $conn;
    $sql="SELECT hora_Abierto from tickets where folio='$folio'";
    $result=$conn->query($sql);
    

    if($result->num_rows>0){
        $row=$result->fetch_assoc();
            
        
    $hora1= new DateTime($row['hora_Abierto']);
    $hora2=new DateTime(date("H:i:s"));

    $diferencia=$hora1->diff($hora2);

    $tiempo=($diferencia->h*60)+$diferencia->i;
    
    return $tiempo;
        
    }


    
}







?>