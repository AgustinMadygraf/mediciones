<?php
// Incluir el archivo de conexión a la base de datos (conn.php)
require_once 'conn.php';

// Verificar si se han enviado los datos del formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $pesoMateriaPrima = $_POST['peso_materia_prima'];
    // Agrega aquí la obtención de otros datos ingresados en el formulario

    // Realizar las validaciones necesarias y el procesamiento de los datos
    // ...

    // Insertar los datos en la base de datos
    $sql = "INSERT INTO tabla_datos (peso_materia_prima) VALUES ('$pesoMateriaPrima')";
    // Modifica 'tabla_datos' con el nombre de tu tabla en la base de datos

    // Ejecutar la consulta
    if ($conn->query($sql) === TRUE) {
        // Si la inserción fue exitosa, redireccionar a la página principal
        header('Location: index.php');
        exit;
    } else {
        // Si ocurre un error en la consulta, mostrar un mensaje de error
        echo 'Error: ' . $conn->error;
    }
}

// Cerrar la conexión a la base de datos
$conn->close();
