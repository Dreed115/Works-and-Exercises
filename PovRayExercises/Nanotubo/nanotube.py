import numpy as np
import math

n,m = map(int, input('-----> Ingresa los coeficientes n,m separados por un espacio: ').split())

if n<m:
	print('El valor de m debe ser menor al de n')
	exit()
	
elif n<1:
    print('n debe ser un entero mayor a 1')
    exit()

elif m<0:
	print('m debe ser cero o un entero')
	exit()

b = float(input('-----> Ingresa el valor de la conexion entre los atomos en Armnstrong: '))

if b<=0 :
	print('El valor debe ser mayor a cero')
	exit()
	
if m==0:
	hcd=n
else:
	for hcd in range(m,1,-1):
			if n%hcd == 0:
				if m%hcd == 0:
					break

l = m*m+n*m+n*n

rm = b*math.sqrt(3*float(l))

radius = rm/(2*math.pi)

if (n-m)%(3*hcd)==0:
	dr=3*hcd
else:
	dr=hcd
	
length = (3*b*math.sqrt(float(l)))/float(dr)

print('   Unit cell length: ' + str(length) +' Angstroms.')

ncells = int(input('-----> Ingresa la cantidad de celdas unitarias: '))

if ncells<1:
	print('El numero de celdas debe ser mayor a 1')
	exit()

print('   Tube length: ' + str(ncells*length) + ' Angstroms.')
print('   Tube radius: '+ str(radius) +' Angstroms.')

nc = 2*l/dr

tamaño = int(2*nc*ncells)

x = np.zeros(int(tamaño)+1)
y = np.zeros(int(tamaño)+1)
z = np.zeros(int(tamaño)+1)
u = np.zeros(int(tamaño)+1)


phi = (math.pi*float(m+n))/float(l)

t = b*float(n-m)/(2*math.sqrt(float(l)))

for p1 in range(0,n):
	if (hcd+p1*m)%n == 0:
		p2=(hcd+p1*m)/n
		break
        
alpha = math.pi*(m*(2*p2+p1)+n*(2*p1+p2))/float(l)

h = (3*hcd*b)/(2*math.sqrt(float(l)))

x[1] = (radius)
y[1] = (0)
z[1] = (0)
u[1] = (0)

x[2] = (radius*math.cos(phi))
y[2] = (radius*math.sin(phi))
z[2] = (t)
u[2] = (u[1]+phi)

with open("Nanotubo.xyz","w") as data:
	data.write(str(tamaño) + "\n")
	data.write("Nanotubo" + "\n")
	for i in range(3,2*hcd):
		x[i] = (radius*math.cos(u[i-2]+(2*math.pi)/float(hcd)))
		y[i] = (radius*math.sin(u[i-2]+(2*math.pi)/float(hcd)))
		z[i] = (z[i-2])
		data.write("C   " + str(x[i]) + "   " + str(y[i]) + "   " + str(z[i]) + "\n")

	for i in range(2*hcd+1,tamaño+1):
		x[i] = (radius*math.cos(u[i-(2*hcd)]+alpha))
		y[i] = (radius*math.sin(u[i-(2*hcd)]+alpha))
		z[i] = (z[i-(2*hcd)]+h)
		u[i] = (u[i-(2*hcd)]+alpha)
		data.write("C   " + str(x[i]) + "   " + str(y[i]) + "   " + str(z[i]) + "\n")
data.close()    