# Programa Hipotenusa

import numpy as np

def subrutina():
    global z
    z = np.sqrt(x**2 + y**2)
    return

print('Este programa calcula la hipotenusa de un triangulo cualquiera')
print('Ingrese los catetos: ')
x = float(input())
y = float(input())
subrutina()
print('')
print('La hipotenusa es: ' + str(z))

