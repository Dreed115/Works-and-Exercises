#Programa Funciones H

import math

def senoh(a):
    global b
    b = (((2.7182)**(a))-((2.7182)**(-a)))/2
    return

def cosh(a):
    global c
    c = (((2.7182)**(a))+((2.7182)**(-a)))/2
    cosh = c
    return

print('Este programa calcula el seno, coseno y tangente hiperbolicos de un numero')
op = 1

while(op == 1):
    print('Escriba un numero entre -3 y 3: ')
    n = float(input())
    while (n < -3 or n > 3):
        print('Numero Incorrecto')
        print('Escriba un numero entre -3 y 3: ')
        n = float(input())
    senoh(n)
    cosh(n)
    d = b/c
    print('El seno, coseno y tangente hiperbolico es respectivamente: ' + '{:,.3f}'.format(b) + ' ,' + '{:,.3f}'.format(c) + ' y ' + '{:,.3f}'.format(d))
    print('Si quiere calcular otro numero oprima 1, sino cualquier otro')
    op = float(input())
             
    
             