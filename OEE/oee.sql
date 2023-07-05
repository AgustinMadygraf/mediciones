CREATE DATABASE IF NOT EXISTS oee;

USE oee;

CREATE TABLE IF NOT EXISTS tabla_datos (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    peso_materia_prima DECIMAL(10,2),
    -- Agrega aquí las columnas adicionales para otros datos relevantes
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
