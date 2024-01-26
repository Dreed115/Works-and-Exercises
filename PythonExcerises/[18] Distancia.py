#Programa Distancia

import numpy as np

def distancia(x,y):
    global d
    d = np.sqrt(x**2 + y**2)
    return

A = np.zeros(shape = (10,10))
B = np.arange(1,11)

print('Este programa calcula la distancia de los puntos (1,1) a (10,10) respectivamente')
a = 0
b = 0

for i in range(0,10):
    a = a + 1
    for j in range(0,10):
        b = b + 1
        distancia(a,b)
        A[i,j] = d
    b = 0
print('')

archivo = open("Distancia.txt","w")

archivo.write('          ' + str(B[0]) + '        ' + str(B[1]) + '        ' + str(B[2]) + '        ' + str(B[3]) + '        ' + str(B[4]) + '        ' + str(B[5]) + '        ' + str(B[6]) + '        ' + str(B[7]) + '        ' + str(B[8]) + '        ' + str(B[9]) + '\n')

for i in range(0,4):
    archivo.write('   ' + str(B[i]) + '     ' + '{:,.2f}'.format(A[i,0]) + '     ' + '{:,.2f}'.format(A[i,1]) + '     ' + '{:,.2f}'.format(A[i,2]) + '     ' + '{:,.2f}'.format(A[i,3]) + '     ' + '{:,.2f}'.format(A[i,4]) + '     ' + '{:,.2f}'.format(A[i,5]) + '     ' + '{:,.2f}'.format(A[i,6]) + '     ' + '{:,.2f}'.format(A[i,7]) + '     ' + '{:,.2f}'.format(A[i,8]) + '     ' + '{:,.2f}'.format(A[i,9]) + '\n')
    
archivo.write('   ' + str(B[4]) + '     ' + '{:,.2f}'.format(A[4,0]) + '     ' + '{:,.2f}'.format(A[4,1]) + '     ' + '{:,.2f}'.format(A[4,2]) + '     ' + '{:,.2f}'.format(A[4,3]) + '     ' + '{:,.2f}'.format(A[4,4]) + '     ' + '{:,.2f}'.format(A[4,5]) + '     ' + '{:,.2f}'.format(A[4,6]) + '     ' + '{:,.2f}'.format(A[4,7]) + '     ' + '{:,.2f}'.format(A[4,8]) + '    ' + '{:,.2f}'.format(A[4,9]) + '\n')
    
archivo.write('   ' + str(B[5]) + '     ' + '{:,.2f}'.format(A[5,0]) + '     ' + '{:,.2f}'.format(A[5,1]) + '     ' + '{:,.2f}'.format(A[5,2]) + '     ' + '{:,.2f}'.format(A[5,3]) + '     ' + '{:,.2f}'.format(A[5,4]) + '     ' + '{:,.2f}'.format(A[5,5]) + '     ' + '{:,.2f}'.format(A[5,6]) + '     ' + '{:,.2f}'.format(A[5,7]) + '    ' + '{:,.2f}'.format(A[5,8]) + '    ' + '{:,.2f}'.format(A[5,9]) + '\n')

archivo.write('   ' + str(B[6]) + '     ' + '{:,.2f}'.format(A[6,0]) + '     ' + '{:,.2f}'.format(A[6,1]) + '     ' + '{:,.2f}'.format(A[6,2]) + '     ' + '{:,.2f}'.format(A[6,3]) + '     ' + '{:,.2f}'.format(A[6,4]) + '     ' + '{:,.2f}'.format(A[6,5]) + '     ' + '{:,.2f}'.format(A[6,6]) + '     ' + '{:,.2f}'.format(A[6,7]) + '    ' + '{:,.2f}'.format(A[6,8]) + '    ' + '{:,.2f}'.format(A[6,9]) + '\n')

archivo.write('   ' + str(B[7]) + '     ' + '{:,.2f}'.format(A[7,0]) + '     ' + '{:,.2f}'.format(A[7,1]) + '     ' + '{:,.2f}'.format(A[7,2]) + '     ' + '{:,.2f}'.format(A[7,3]) + '     ' + '{:,.2f}'.format(A[7,4]) + '     ' + '{:,.2f}'.format(A[7,5]) + '    ' + '{:,.2f}'.format(A[7,6]) + '    ' + '{:,.2f}'.format(A[7,7]) + '    ' + '{:,.2f}'.format(A[7,8]) + '    ' + '{:,.2f}'.format(A[7,9]) + '\n')

archivo.write('   ' + str(B[8]) + '     ' + '{:,.2f}'.format(A[8,0]) + '     ' + '{:,.2f}'.format(A[8,1]) + '     ' + '{:,.2f}'.format(A[8,2]) + '     ' + '{:,.2f}'.format(A[8,3]) + '     ' + '{:,.2f}'.format(A[8,4]) + '    ' + '{:,.2f}'.format(A[8,5]) + '    ' + '{:,.2f}'.format(A[8,6]) + '    ' + '{:,.2f}'.format(A[8,7]) + '    ' + '{:,.2f}'.format(A[8,8]) + '    ' + '{:,.2f}'.format(A[8,9]) + '\n')

archivo.write('   ' + str(B[9]) + '    ' + '{:,.2f}'.format(A[9,0]) + '    ' + '{:,.2f}'.format(A[9,1]) + '    ' + '{:,.2f}'.format(A[9,2]) + '    ' + '{:,.2f}'.format(A[8,3]) + '     ' + '{:,.2f}'.format(A[8,4]) + '    ' + '{:,.2f}'.format(A[8,5]) + '    ' + '{:,.2f}'.format(A[9,6]) + '    ' + '{:,.2f}'.format(A[9,7]) + '    ' + '{:,.2f}'.format(A[9,8]) + '    ' + '{:,.2f}'.format(A[9,9]) + '\n')


    
    