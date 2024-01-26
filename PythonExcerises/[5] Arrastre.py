#Porgrama Arrastre

import math

while True:
    print('Escriba la viscocidad, velocidad y diametro en unidades de pies y libras')
    a = float(input())
    b = float(input())
    c = float(input())
    e = 3*math.pi*a*b*c
    print('El arrastre seria: ' + str(e))
    print('')
    print('Si quiere volver a calcular oprima 1, sino oprima cualquier numero para continuar')
    f = int(input())
    if (f != 1):
        break