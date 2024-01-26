import math

def Distancia(Apoint, Bpoint):
    dis = math.sqrt((Apoint[0] - Bpoint[0])**2+(Apoint[1] - Bpoint[1])**2+(Apoint[2] - Bpoint[2])**2)
    return dis

def Triangulos_Vertice(Triangulos, v1):
    Contador = 0
    for i in Triangulos:
        if v1 in i:
            Contador = Contador + 1
    return Contador

#Lee y guarda las coordenadas de cada atomo en una lista
Coordenadas = []
with open("Au60.xyz","r") as data:
    for i in data:
        palabras = i.split()
        x, y, z = map(float, palabras[1:])
        Coordenadas.append((x,y,z))
data.close()

#Crea una lista donde cada elemento son las conexiones que tiene un atomo
with open("Conexiones.dat","w") as datawrite:
    Conexiones = []
    for i in range(0,60):
        Aristas = []
        for j in range(0,60):
            if  Distancia(Coordenadas[i],Coordenadas[j]) >= 2.7 and Distancia(Coordenadas[i],Coordenadas[j]) <= 3.2:
                Aristas.append(j)
                Linea = "<" + str(Coordenadas[i][0]) + ", " + str(Coordenadas[i][1]) + ", " + str(Coordenadas[i][2]) + ">, " + "<" + str(Coordenadas[j][0]) + ", " + str(Coordenadas[j][1]) + ", " + str(Coordenadas[j][2]) + ">, \n"
                datawrite.write(Linea)
        Conexiones.append(Aristas)        
datawrite.close()

#Evalua si se generan triangulos y elimina los duplicados
Triangulos = set()
for v1 in range(0,60):
    for v2 in Conexiones[v1]:
        for v3 in Conexiones[v2]:
            if v3 != v1 and v1 in Conexiones[v3]:
                Punto = (v1,v2,v3)
                Triangulos.add(tuple(sorted(Punto)))
Triangulos_Final = list(Triangulos)

with open("Triangulos.dat","w") as datatriangle:
    for triangulo in Triangulos_Final:
        for i in triangulo:
            Linea = "<" + str(Coordenadas[i][0]) + ", " + str(Coordenadas[i][1]) + ", " + str(Coordenadas[i][2]) + ">, "
            datatriangle.write(Linea)
        datatriangle.write("\n")    
datatriangle.close()


#Imprime la cantidad de triangulos total del conjunto de atomos
print('La cantidad final de triangulos es: ' + str(len(Triangulos_Final)))

#for i in Triangulos_Final:
#    print(i)
