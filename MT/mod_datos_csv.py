import csv

# Ruta completa del archivo CSV original
csv1_path = 'C:/AppServ/www/mediciones/MT/datos.csv'

# Ruta completa del archivo CSV destino
csv2_path = 'C:/AppServ/www/mediciones/MT/datos_MT.csv'

# Definir el mapeo de columnas
column_mapping = {
    'hora': 'datetime',
    'hora': 'unixtime',
    'Potencia Activa III': 'potencia_III',
    'Tension entre Lineas L1 y L2': 'v_l1_l2',
    'Tension entre Lineas L2 y L3': 'v_l2_l3',
    'Tension entre Lineas L3 y L1': 'v_l3_l1'
}

# Leer el archivo CSV original
with open(csv1_path, 'r') as file:
    reader = csv.DictReader(file)
    rows = list(reader)

# Crear el archivo CSV destino con la nueva cabecera y orden de columnas
with open(csv2_path, 'w', newline='') as file:
    fieldnames = list(column_mapping.values())
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    # Escribir la nueva cabecera
    writer.writeheader()

    # Escribir las filas con las columnas modificadas
    for row in rows:
        new_row = {column_mapping[key]: value for key, value in row.items() if key in column_mapping}
        writer.writerow(new_row)

print("Proceso completado.")
