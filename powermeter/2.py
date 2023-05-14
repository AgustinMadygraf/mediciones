import time
a = 0  


while True:

    print(f"Actualizancion numero ",a, "                                           ")
    print("")
    time.sleep(1)
    a = a + 1
    def cuenta_regresiva(segundos):
        for i in range(segundos, 0, -1):
            print(f"Actualizando en {i} segundos...", end="\r")
            time.sleep(1)

    print('actualización de MySQL desde datos.csv')
    time.sleep(1)
    exec(open("upd_datos_csv_powermeter.py").read())
    time.sleep(1)
    print("")
    exec(open("upd_sql_fast_powermeter.py").read())

    cuenta_regresiva(300)

