#Programa Formato.py

import math

a = 'Este programa imprime una tabla del seno de varios angulos'
print a.title()

b = 'Angulo en Grados'
c = 'Seno del Angulo'
print('')
print(b + '          ' + c)

for i in range(0,95,5):
    d = ((i/180.0))*(math.pi)
    s = math.sin(d)
    print('       ' + str(i) + '                    ' +  '{:,.5f}'.format(s))