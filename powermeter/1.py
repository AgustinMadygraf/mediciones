import os
import requests
import time
import csv


print('actualizar MySQL desde datos.csv')
print("")
# si presiona la tecla "Y" actualiza la base de datos ejecutando upd_datos_csv.py 
# si presiona cualquier otra tecla continía sin ejecutar ningun otro comando
n = input('¿Desea actualizar datos.csv con los registros de los últimos 7 días? (Y/N)')
if n.lower() == 'y':
    # Ejecuta el archivo upd_datos_csv.py para actualizar la base de datos con los registros de los últimos 7 días
    exec(open("upd_datos_csv_powermeter.py").read())
else:
    print("")
    print('Continuando sin actualizar datos.csv')
print("")
print("")
print('El proceso de enviar todos los resgistro desde "datos.csv" puede demorar')
n = input('¿Desea enviar todos los registros desde "datos.csv" hacia MySQL (Y/N)')
print("")
if n.lower() == 'n':
    print("saliendo...")   
    time.sleep(2) 
    exit()
print("A continuación se enviarán todos los registros desde 'datos.csv' hacia MySQL")
time.sleep(2) 
print("")
exec(open("upd_sql_all_powermeter.py").read())
input("Presione cualquier tecla para salir")

