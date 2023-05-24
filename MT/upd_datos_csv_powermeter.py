import os
import shutil
import time

# Carpeta donde se encuentran los archivos CSV
csv_folder = 'C:/AppServ/www/CSV/MT/'

# Ubicación donde se guardará el archivo renombrado
save_location = 'C:/AppServ/www/mediciones/MT/'

# Nuevo nombre que se le dará al archivo
new_name = 'datos.csv'

# Obtener la lista de archivos CSV en la carpeta
csv_files = [f for f in os.listdir(csv_folder) if f.endswith('.csv')]

# Verificar si hay archivos CSV en la carpeta
if len(csv_files) > 0:
    # Obtener el primer archivo CSV de la lista
    file_name = csv_files[0]
    file_path = os.path.join(csv_folder, file_name)

    # Construir la nueva ruta de destino con el nombre de archivo modificado
    new_file_path = os.path.join(save_location, new_name)

    # Renombrar el archivo moviéndolo a la nueva ubicación con el nuevo nombre
    shutil.move(file_path, new_file_path)

    print("Renombrado completado.")
else:
    print("No hay archivos CSV en la carpeta.")

# Pausa para visualizar el resultado
time.sleep(1)
exec(open("upd_sql_all_powermeter.py").read())
