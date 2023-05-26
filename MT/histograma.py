import pymysql
import matplotlib.pyplot as plt

# Conexión a la base de datos MySQL
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='12345678',
    database='circuitor'
)

try:
    cursor = connection.cursor()

    # Definir el rango de fechas en formato unixtime
    start_unixtime = 1630000000  # Fecha de inicio en unixtime
    end_unixtime = 1635000000  # Fecha de fin en unixtime

    # Obtener los conteos de filas en cada intervalo de tiempo
    query = """
    SELECT FLOOR(unixtime / interval_duration) * interval_duration AS interval_start, 
           COUNT(*) AS count
    FROM mt
    WHERE unixtime >= %s AND unixtime <= %s
    GROUP BY interval_start
    ORDER BY interval_start
    """
    interval_duration = 3600  # Duración del intervalo en segundos (por ejemplo, 1 hora)
    cursor.execute(query, (start_unixtime, end_unixtime))
    results = cursor.fetchall()

    # Extraer los datos del resultado de la consulta
    intervals = [row[0] for row in results]
    counts = [row[1] for row in results]

    # Crear el histograma
    plt.bar(intervals, counts, width=interval_duration, align='edge')
    plt.xlabel('Intervalo de tiempo (Unixtime)')
    plt.ylabel('Cantidad de registros')
    plt.title('Histograma de registros en intervalos de tiempo')

    # Mostrar el histograma
    plt.show()

finally:
    connection.close()
