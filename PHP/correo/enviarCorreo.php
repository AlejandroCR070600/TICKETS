<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require "../conection.php";
require __DIR__ . '/../../vendor/autoload.php';
 // si usas Composer

 $value=json_decode(file_get_contents("php://input"));
 datosSupervisor($value);
 


 function idSupervisor($sucursal){
    global $conn;
    $sql="SELECT supervisor FROM sucursal where id=$sucursal";
    $result=$conn->query($sql);
    $datos=[];
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $datos[]=$row;
        return $datos;
    }


 }
 function datosSupervisor($sucursal){
    global $conn;
    $supervisor =idSupervisor($sucursal);
    $sqlS="SELECT correo, claveApp FROM supervisores where id = {$supervisor[0]['supervisor']}";
    $result=$conn->query($sqlS);
    $datos=[];
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $datos[]=$row;
        enviarCorreo($datos[0]['correo'],$datos[0]['claveApp']);
    }
    
 }

 

//echo enviarCorreo('xxalinestarxx@gmail.com', 'samu joqp qany ajee');

function enviarCorreo($correo,$contraseña){
$mail = new PHPMailer(true);

try {
    // Configuración del servidor SMTP
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'xxalinestarxxcr0706@gmail.com';  // Tu Gmail
    $mail->Password = $contraseña; // Contraseña de aplicación que acabas de crear
    $mail->SMTPSecure = 'tls'; // También puede ser 'ssl'
    $mail->Port = 587; // Si usas 'ssl', cambia a 465

    // Remitente y destinatario
    $mail->setFrom('xxalinestarxxcr0706@gmail.com', 'Nicolas Casas');
    $mail->addAddress("$correo", 'Alejandro Rojas');

    // Contenido del mensaje
    $mail->isHTML(true);
    $mail->Subject = 'Asunto del correo';
    $mail->Body    = '<h1>Hola!</h1><p>Este es un mensaje enviado con PHPMailer y Gmail.</p>';
    $mail->AltBody = 'Este es el mensaje en texto plano para clientes que no soportan HTML';

    $mail->send();
    echo json_encode('El mensaje se envió correctamente');
} catch (Exception $e) {
    echo json_encode("Error al enviar el correo: {$mail->ErrorInfo}");
}
}
