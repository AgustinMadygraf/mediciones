<?php
// Obtener los datos ingresados en el formulario
$pesoMateriaPrima = $_POST['peso_materia_prima'];
// Agrega aquí la obtención de otros datos ingresados en el formulario

// Realizar las validaciones necesarias y el procesamiento de los datos
// ...

// Calcular el OEE (multiplicación de los 3 KPIs)
$calidad = 0.8; // Ejemplo de valor de calidad (de 0 a 1)
$disponibilidad = 0.9; // Ejemplo de valor de disponibilidad (de 0 a 1)
$velocidad = 0.95; // Ejemplo de valor de velocidad (de 0 a 1)

$oee = $calidad * $disponibilidad * $velocidad;

// Guardar los datos y el OEE en la base de datos o realizar otras acciones necesarias
// ...

// Redireccionar a la página principal o a otra página de tu elección
header('Location: index.php');
exit;
