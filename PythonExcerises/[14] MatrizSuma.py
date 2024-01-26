#Programa Matriz Suma

import numpy as np

print('Este Programa realiza la suma de 3 matrices 4x4')
A = np.zeros(shape=(4,4))
B = np.zeros(shape=(4,4))
C = np.zeros(shape=(4,4))

for i in range(0,4):
    for j in range(0,4):
        print('Ingrese el valor ' + str(i+1) + ' ,' + str(j+1) + ' de la Mariz A')
        A[i,j] = float(input())
        
for i in range(0,4):
    for j in range(0,4):
        print('Ingrese el valor ' + str(i+1) + ' ,' + str(j+1) + ' de la Mariz B')
        B[i,j] = float(input())
        

for i in range(0,4):
    for j in range(0,4):
        print('Ingrese el valor ' + str(i+1) + ' ,' + str(j+1) + ' de la Mariz C')
        C[i,j] = float(input())
        
mi_archivo = open("MatrizSuma.txt", "w")
mi_archivo.write(b'\n')
mi_archivo.write(b'La suma de A: \n')
mi_archivo.write(str(A))
mi_archivo.write(b'\n')
mi_archivo.write(b'mas B: \n')
mi_archivo.write(str(B))
mi_archivo.write(b'\n')
mi_archivo.write(b'mas C: \n')
mi_archivo.write(str(C))
mi_archivo.write(b'\n')
mi_archivo.write(b'Es: \n')
mi_archivo.write(str(A+B+C))