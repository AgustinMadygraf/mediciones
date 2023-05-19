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
//if (isset($_GET['hora']) && isset($_GET['Pa_III']) && isset($_GET['potencia_s']) && isset($_GET['potencia_t']) ) {
//if (isset($_GET['hora'])  ) {
  $hora     = $_GET['hora'];
  $unixtime = $_GET['unixtime'];
  $Pa_III   = $_GET['Pa_III'];
  $v_L1_L2  = $_GET['v_L1_L2'];
  $v_L2_L3  = $_GET['v_L2_L3'];
  $v_L3_L1  = $_GET['v_L3_L1'];
  
  // Verificar si ya existe un registro con el mismo valor de unixtime

  // Insertar datos en la base de datos
  $sql = "INSERT INTO MT (`fecha`,`unixtime`, `pot_III`, `v_L1_L2`, `v_L2_L3`, `v_L3_L1` ) VALUES ('$hora','$unixtime', '$Pa_III', '$v_L1_L2', '$v_L2_L3', '$v_L3_L1' )";
  
  
  if ($conn->query($sql) === TRUE)  {
        echo "Los datos han sido ingresados correctamente en la base de datos";
  } else {
        echo "Error al ingresar datos: " . $conn->error;
  }
  //}


// Cerrar conexión a la base de datos
$conn->close();
?>