#programa Numero

import math

print('Este prgroama realiza la raiz cuadrada, coseno inverso y potencia a la -3 de un numero')
a = float(input('Numero: '))
b = a**(0.5)
c = math.acos(a)
d = a**(-3)
print('')
print('Raiz Cuadrada: ' + str(b) + '  Coseno Inverso: ' + str(c) + '  Potencia a la -3: ' + str(d))