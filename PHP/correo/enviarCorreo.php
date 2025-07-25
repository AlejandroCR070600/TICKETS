<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/../../vendor/autoload.php';
 // si usas Composer


echo enviarCorreo('xxalinestarxx@gmail.com');

function enviarCorreo($correo){
$mail = new PHPMailer(true);

try {
    // Configuración del servidor SMTP
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'xxalinestarxxcr0706@gmail.com';  // Tu Gmail
    $mail->Password = 'samu joqp qany ajee'; // Contraseña de aplicación que acabas de crear
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
    json_encode('El mensaje se envió correctamente');
} catch (Exception $e) {
    json_encode("Error al enviar el correo: {$mail->ErrorInfo}");
}
}
