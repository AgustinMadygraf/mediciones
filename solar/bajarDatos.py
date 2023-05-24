import requests

url = "http://panel.powermeter.com.ar/descargar/directa/inst/7c275d46-0122-4c05-81f8-e973ecbe26d7/"
ruta_guardado = "C:\AppServ\www\mediciones\solar"

# Realizar la solicitud GET para descargar el archivo
response = requests.get(url)

# Verificar si la descarga fue exitosa
if response.status_code == 200:
    # Guardar el contenido de la respuesta en un archivo local
    with open(ruta_guardado, 'wb') as archivo:
        archivo.write(response.content)
    print("Archivo descargado y guardado correctamente.")
else:
    print("Error al descargar el archivo.")
