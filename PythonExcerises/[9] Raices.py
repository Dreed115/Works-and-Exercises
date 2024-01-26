#Programa Raices

print('Este programa lee los coeficientes de una funcion cuadratica y determina la naturaleza de sus raices y su valor')
print('Escriba el coeficiente cuadratico, lineal e independiente respectivamente')
a = float(input())
b = float(input())
c = float(input())
d = ((b**2)-(4*a*c))

if (d >= 0):
    if (d == 0):
        print('Solo hay una raiz')
        e = -b/2*a
        print('La raiz seria: ' + str(e))
    else:
        print('Las raices son diferentes y reales')
        e = (-b + d**(0.5))/2*a
        e1 = (-b - d**(0.5))/2*a
        print('Las raices son: ' + str(e) + ' y ' + str(e1))
else:
    print('Las raices son complejos conjugados')
    e = -b/2*a
    e1 = ((abs(d))**(0.5))/2*a
    print('Las raices son: ' + str(e) + ' + i ' + str(e1) + ' y ' + str(e) + ' - i ' + str(e1)) 