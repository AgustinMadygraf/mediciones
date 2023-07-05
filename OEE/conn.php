<?php
// Configuración de la conexión a la base de datos
$servername = "localhost"; 
$username = "root"; 
$password = "12345678"; 
$dbname = "OEE"; 

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar si hay errores en la conexión
if ($conn->connect_error) {
    die("Error de conexión a la base de datos: " . $conn->connect_error);
}

// Establecer el juego de caracteres a utilizar
$conn->set_charset("utf8");

// Puedes agregar más configuraciones y personalizaciones de la conexión según tus necesidades

?>
