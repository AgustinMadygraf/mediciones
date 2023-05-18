import os
import shutil
import time

file_path = 'C:/AppServ/www/mediciones/CSV/MT/2019-09-25.csv'
save_location = 'C:/AppServ/www/mediciones/MT/'
new_name = 'datos.csv'

print(f"file_path: {file_path}")
print(f"save_location: {save_location}")

# Verificar si el archivo existe en la ubicación especificada
if os.path.isfile(file_path):
    # Obtener el nombre del archivo
    file_name = os.path.basename(file_path)

    # Construir la nueva ruta de destino con el nombre de archivo modificado
    new_file_path = os.path.join(save_location, new_name)

    # Renombrar el archivo
    shutil.move(file_path, new_file_path)

    print("Renombrado completado.")
else:
    print("El archivo no existe en la ubicación especificada.")

# Pausa para visualizar el resultado
time.sleep(1)
