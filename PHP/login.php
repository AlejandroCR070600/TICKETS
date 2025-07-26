<?php
session_start();
header('Content-Type: application/json');  // Indica que devolverás JSON
require "conection.php";

$value = json_decode(file_get_contents("php://input"));

$usuario = $value->usuario ?? null;
$password = $value->password ?? null;

login($usuario, $password);

function login($usuario, $password){
    global $conn;

    if (!$usuario || !$password) {
        echo json_encode(["error" => "Usuario o contraseña vacíos"]);
        exit;
    }

    $sql = "SELECT * FROM usuario WHERE usuario=? AND password=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $usuario, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        unset($row['password']); // opcional, para no mandar la contraseña en la respuesta
        $_SESSION['usuario']=$row['usuario'];
        echo json_encode([
            "success" => true,
            "usuario" => $row,
            "message" => "LOGIN EXITOSO"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Usuario o contraseña incorrectos"
        ]);
    }
    exit;
}

