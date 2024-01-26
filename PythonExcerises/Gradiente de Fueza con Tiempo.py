import numpy as np

def campo_de_fuerza(posicion, agujero_negro_posicion, constante_gravitacional, masa_agujero_negro):
    direccion = agujero_negro_posicion - posicion
    distancia = np.linalg.norm(direccion)
    fuerza = (constante_gravitacional * masa_agujero_negro) / (distancia ** 2) * direccion
    return fuerza

def calcular_gradiente(posicion):
    # Gradiente del campo de fuerza en un punto específico
    return -1 * np.array(posicion)

def simular_particula(posicion_inicial, agujero_negro_posicion, constante_gravitacional, masa_agujero_negro, tiempo_maximo, paso_tiempo):
    tiempo = 0
    posicion_actual = np.array(posicion_inicial)
    while tiempo <= tiempo_maximo:
        fuerza = campo_de_fuerza(posicion_actual, agujero_negro_posicion, constante_gravitacional, masa_agujero_negro)
        gradiente = calcular_gradiente(posicion_actual)
        nueva_posicion = posicion_actual + (paso_tiempo**2) * (fuerza)
        print("Tiempo:", tiempo, "Posición actual:", nueva_posicion)
        if np.allclose(nueva_posicion, [0, 0], atol=1):
            print("La partícula ha alcanzado el agujero negro en el tiempo", tiempo)
            break
        posicion_actual = nueva_posicion
        tiempo += paso_tiempo

# Parámetros para la simulación
posicion_inicial = [10, 0]
agujero_negro_posicion = np.array([0, 0])
constante_gravitacional = 6.67430e-11
masa_agujero_negro = 1.0e10
tiempo_maximo = 1000  # Tiempo máximo para la simulación
paso_tiempo = 0.1  # Incremento de tiempo en cada paso

# Llamar a la función de simulación
simular_particula(posicion_inicial, agujero_negro_posicion, constante_gravitacional, masa_agujero_negro, tiempo_maximo, paso_tiempo)
