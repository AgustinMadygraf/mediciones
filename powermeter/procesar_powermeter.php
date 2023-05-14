<?php
// Configuración de conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "12345678";
$dbname = "powermeter";

// Conexión a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión a la base de datos: " . $conn->connect_error);
}

// Obtener valores del formulario
if (isset($_GET['unixtime']) && isset($_GET['potencia_r']) && isset($_GET['potencia_s']) && isset($_GET['potencia_t']) ) {
  $unixtime = $_GET['unixtime'];
  $potencia_r = $_GET['potencia_r'];
  $potencia_s = $_GET['potencia_s'];
  $potencia_t = $_GET['potencia_t'];

  // Verificar si ya existe un registro con el mismo valor de unixtime
  $sql = "SELECT * FROM mediciones_potencia WHERE unixtime = '$unixtime'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    echo "El registro con unixtime = $unixtime ya existe en la base de datos.";
  } else {
    // Insertar datos en la base de datos
    $sql = "INSERT INTO mediciones_potencia (unixtime, potencia_r, potencia_s, potencia_t) VALUES ('$unixtime', '$potencia_r', '$potencia_s', '$potencia_t' )";

    if ($conn->query($sql) === TRUE) {
        echo "Los datos  Pot R: ".$potencia_r."   Pot S: ".$potencia_s."   Pot T: ".$potencia_t."   unixtime ".$unixtime."  han sido ingresados correctamente en la base de datos";
    } else {
        echo "Error al ingresar datos: " . $conn->error;
    }
  }
}

// Cerrar conexión a la base de datos
$conn->close();
?>
<meta http-equiv="refresh" content="10;/mediciones/powermeter/formulario_powermeter.php">
