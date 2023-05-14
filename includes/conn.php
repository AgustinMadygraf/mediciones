<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "12345678";
$dbname = "mediciones";
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar si la conexión es exitosa
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
?>
