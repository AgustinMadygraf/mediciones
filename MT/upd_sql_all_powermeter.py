import csv
import requests
import time


# Definir la URL del archivo procesar_powermeter.php
url = 'http://localhost/mediciones/MT/procesar_powermeter.php'
# Abrir el archivo CSV y leer los datos
input(url)

with open('datos.csv', newline='') as csvfile:
    # Crear un lector CSV
    reader = csv.DictReader(csvfile)
    # Iterar sobre cada fila del archivo
    for row in reader:
        # Obtener los valores de fecha, timestamp y potencias

        hora    =  row['hora']

        volt_L1 = row['Tension de Linea L1']
        amp_L1  = row['Corriente L1']
        Pa_L1   = row['Potencia Activa L1']
        Pq_L1   = row['Potencia Reactiva L1']
        FP_L1   = row['Factor de Potencia L1']

        volt_2  = row['Tension de Linea L2']
        amp_2   = row['Corriente L2']
        Pa_L2   = row['Potencia Activa L2']
        Pq_L2   = row['Potencia Reactiva L2']
        FP_L2   = row['Factor de Potencia L2']

        volt_L3 = row['Tension de Linea L3']
        amp_L3  = row['Corriente L3']
        Pa_L3   = row['Potencia Activa L3']
        Pq_L3   = row['Potencia Reactiva L3']
        FP_L3   = row['Factor de Potencia L3']

        Pa_III  = row['Potencia Activa III']
        Pqi_III = row['Potencia Inductiva III']
        Pqc_III = row['Potencia Capacitiva III']
        FP_III  = row['Coseno Fi']

        v_L1_L2 = row['Tension entre Lineas L1 y L2']
        v_L2_L3 = row['Tension entre Lineas L2 y L3']
        v_L3_L1 = row['Tension entre Lineas L3 y L1']

        PS_III  = row['Potencia Aparente III']
        DM_A1   = row['Demanda Maxima']
        ampIII  = row['Corriente de las Tres Fases']
        amp_N   = row['Corriente de Neutro']
        DM_A2   = row['Demanda Maxima A2']
        DM_A3   = row['Demanda Maxima A3']
        
        Ea_III  = row['Energia Activa']
        EqiIII  = row['Energia Reactiva Inductiva']
        EqcIII  = row['Energia Reactiva Capacitiva']

        # Enviar los datos al archivo procesar_powermeter.php
        payload = {
            'hora'                          : hora,
            'Potencia Activa III'           : Pa_III,
            'Tension entre Lineas L1 y L2'  : v_L1_L2,
            'Tension entre Lineas L2 y L3'  : v_L2_L3,
            'Tension entre Lineas L3 y L1'  : v_L3_L1,   
        }

        input(payload)
        r = requests.get(url, params=payload)
        input(r.text)  # Mostrar la respuesta del servidor
            

print("")
print("finalizado")
print("")
