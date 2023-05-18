import csv
import requests
import time

print('enviar datos')

# Definir la URL del archivo procesar_powermeter.php
url = 'http://localhost/mediciones/powermeter/procesar_powermeter.php'

while True:
    # Leer el archivo CSV y ordenar por timestamp en orden descendente
    with open('datos.csv', newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        sorted_rows = sorted(reader, key=lambda row: int(row['timestamp']), reverse=True)

    # Seleccionar las 10 primeras filas con el valor más alto de timestamp
    rows_to_send = sorted_rows[:10]

    # Iterar sobre las filas seleccionadas
    for row in rows_to_send:
        # Obtener los valores de fecha, timestamp y potencias
        fecha = row['fecha']
        timestamp = row['timestamp']
        r_v = row['R:v']
        r_i = row['R:i']
        r_p = row['R:p']
        r_q = row['R:q']
        s_v = row['S:v']
        s_i = row['S:i']
        s_p = row['S:p']
        s_q = row['S:q']
        t_v = row['T:v']
        t_i = row['T:i']
        t_p = row['T:p']
        t_q = row['T:q']

        # Enviar los datos al archivo procesar_powermeter.php
        payload = {'unixtime': timestamp, 'potencia_s': s_p, 'potencia_r': r_p, 'potencia_t': t_p}
        r = requests.get(url, params=payload)
        print(r.text)  # Mostrar la respuesta del servidor

    # Mostrar una cuenta regresiva hasta que se reanude la ejecución del programa
    print('Esperando 300 segundos...')
    for i in range(300, 0, -1):
        print(f'Tiempo restante: {i} segundos', end='\r')
        time.sleep(1)
    print('\n')
