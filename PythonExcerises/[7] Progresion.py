#Programa Progresion

print('Este programa calcula e imprime la suma de la progresion geometrica de un numero definido de terminos')
print('Escriba el numero de terminos que desee: ')
n = int(input())
a = 1
b = 1
for i in range(1,n):
    c = a*(1.0/3.0)
    b = b + c
    a = c
    print(a)

e = 1/(1-(1.0/3.0))
print('La suma de los ' + str(n) + 'terminos es: ' + str(b) + ' y la suma cuando n tiende a infinito es: ' + str(e))