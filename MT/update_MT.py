import requests

url = 'http://localhost/mediciones/scada/update_MT.php'
response = requests.get(url)

print(response.text)
input("presione una tecla para salir")
