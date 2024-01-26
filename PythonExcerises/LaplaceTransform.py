#Programa transformada de laplace por Diego Alejandro Reyes Ramos al 17/11/2021

import numpy as np
import matplotlib.pyplot as plt
import math
import array as arr

#Funciones para cada clasificacion
def Constante(b):
    c = b +'/s'
    laplace.append(c)


def Variable(b,c):
    d = math.factorial(c)
    e = d*b
    f = str(e) +'/(s^'+ str(c+1)+')'
    laplace.append(f)

def VariableE(b,c):
    if c < 0:
        f = str(b)+'/(s + ' + str(-c)+ ' )'
        laplace.append(f)
    else: 
        f = str(b) +'/(s - '+ str(c)+' )'
        laplace.append(f)
        
def Seno(b,c):
    d = c*c
    e = b*c
    f = str(e) +'/(s^2 +'+ str(d)+')'
    laplace.append(f)
    
def Coseno(b,c):
    d = c*c
    f = str(b) + '*s/(s^2 +'+ str(d)+')'
    laplace.append(f)
    
def Senoh(b,c):
    d = c*c
    e = b*c
    f = str(e) +'/(s^2 -'+ str(d)+')'
    laplace.append(f)
    
def Cosenoh(b,c):
    d = c*c
    f = str(b) + '*s/(s^2 -'+ str(d)+')'
    laplace.append(f)
    
def Derivada(b,c):
    e = b*c
    f = str(b) + '*sY(s)-'+ str(e)
    laplace.append(f)

def Derivada2(b,c,d):
    f = c*b
    g = d*b
    h = str(b)+ '*s^2Y(s)-'+ str(f)+'s-' + str(g)    
    laplace.append(h)
        
#Iniciacion de las variables y arrays
ecuacion = []
laplace = []
simbolo = []

li=0
j=0
l=0
d=''
t=''

#Ingreso de la ecuacino
print('Ingrese la ecuacion utilizando a t como variable(con terminos separados por +/- y sin espacios):')
a = str(input())

print('\n')

#Evaluacion de la ecuacion
if a[0]=='-':
    t = t + '-'
    j=1

for i in range(len(a)-1):
    if (a[i] == '+') or (a[i] == '=') or (a[i-1:i+1] == ")-") or (a[i-1:i+1] == "t-") or (a[i-1:i+1] == '1-') or (a[i-1:i+1] == "2-") or (a[i-1:i+1] == "3-") or (a[i-1:i+1] == "4-") or (a[i-1:i+1] == "5-") or (a[i-1:i+1] == "6-") or (a[i-1:i+1] == "7-") or (a[i-1:i+1] == "8-") or (a[i-1:i+1] == "9-"):
        l=l+1
        ecuacion.append(a[j:i])
        simbolo.append(a[i])
        j = i+1
#Casos Especificos   
if (l == 0):
    ecuacion.append(a)
    
ecuacion.append(a[j:])


#Reaalizando la transfromada
for k in range(l+1):
    b = ecuacion[k]
    #Obteniendo el coeficiente
    for n in range(len(b)):
        if (b[n]=='0')or(b[n]=='1')or(b[n]=='2')or(b[n]=='3')or(b[n]=='4')or(b[n]=='5')or(b[n]=='6')or(b[n]=='7')or(b[n]=='8')or(b[n]=='9')or(b[n]=='.'):
            d = d+b[n]
            li = li+1
        else:
            break
    if li==0:
        d=1
    
    #Ver si es un coeficiente
    if (b==d):
        Constante(d)
        d = ''
        li = 0
    #Ver si es una variable
    if b[li] == 't':
        if len(b[li:]) == 1:
            c1 = 1
            d = float(d)
            Variable(d,c1)
            d = ''
            li = 0    
        if (b[li+1]) == '^':
            c1 = int(b[len(b)-1])
            d = float(d)
            Variable(d,c1)
            d = ''
            li = 0
    #Ver si es un exponencial
    if b[li] == 'e':
        if len(b[li:]) == 3:
            c1 = 1
            d = float(d)
            VariableE(d,c1)
            d = ''
            li = 0
        else:
            c1 = float(b[li+2:len(b)-1])
            d = float(d)
            VariableE(d,c1)
            d = ''
            li = 0
    #Ver si es una funcion seno
    if b[li:li+4] == 'sin(' or b[li:li+4] == 'sen(':
        if len(b[li:]) == 6:
            c1 = 1
            d = float(d)
            Seno(d,c1)
            d = ''
            li = 0
        else:
            if b[li+4:len(b)-2] == '-':
                c1=-1
            else:
                c1 = float(b[li+4:len(b)-2])
            d = float(d)
            Seno(d,c1)
            d = ''
            li = 0
    #Ver si es una funcion coseno
    if b[li:li+4] == 'cos(':
        if len(b[li:]) == 6:
            c1 = 1
            d = float(d)
            Coseno(d,c1)
            d = ''
            li = 0
        else:
            if b[li+4:len(b)-2] == '-':
                c1=-1
            else:
                c1 = float(b[li+4:len(b)-2])
            d = float(d)
            Coseno(d,c1)
            d = ''
            li = 0
    #Ver si es una funcion seno hiperbolica
    if b[li:li+4] == 'sinh'or b[li:li+4] == 'senh':
        if len(b[li:]) == 7:
            c1 = 1
            d = float(d)
            Senoh(d,c1)
            d = ''
            li = 0
        else:
            if b[li+5:len(b)-2] == '-':
                c1=-1
            else:
                c1 = float(b[li+5:len(b)-2])
            d = float(d)
            Senoh(d,c1)
            d = ''
            li = 0
    #Ver si es una funcion coseno hiperbolica
    if b[li:li+4] == 'cosh':
        if len(b[li:]) == 7:
            c1 = 1
            d = float(d)
            Cosenoh(d,c1)
            d = ''
            li = 0
        else:
            if b[li+5:len(b)-2] == '-':
                c1=-1
            else:
                c1 = float(b[li+5:len(b)-2])
            d = float(d)
            Cosenoh(d,c1)
            d = ''
            li = 0
    #Ver si es una derivada
    if b[li:li+2]=="t'" and len(b[li:])==2:
        if simbolo[k-1]=='-':
            d = -float(d)
        else: 
            d = float(d)
        print('Ingrese el valor del termino en cero')
        r = float(input())
        print('\n')
        Derivada(d,r)
        d = ''
        li = 0
        
    if b[li:li+3]=="t''":
        if simbolo[k-1]=='-':
            d = -float(d)
        else: 
            d = float(d)
        print('Ingrese el valor del termino en cero')
        r = float(input())
        print('\n')
        print('Ingrese el valor de la primera derivada en cero')
        v = float(input())
        print('\n')
        Derivada2(d,r,v)
        d = ''
        li = 0
        
#Creacion de la cadena
print('La transfromada de Laplace es:\n') 
t = t + laplace[0]
for i in range(l):
    t = t + simbolo[i]+laplace[i+1]

#Evaluacion de errores de signos    
t = t.replace('--','+')
t = t.replace('+-','-')
t = t.replace('-+','-')
t = t.replace('++','+')

#Impresion
print(t)    
  
        
            
            
            
            
            
            
            
            
            
            
            
            