import math

def Distancia(Apoint, Bpoint):
    dis = math.sqrt((Apoint[0] - Bpoint[0])**2+(Apoint[1] - Bpoint[1])**2+(Apoint[2] - Bpoint[2])**2)
    return dis

#Lee y guarda las coordenadas de cada atomo en una lista
Coordenadas = []
with open("nano.xyz","r") as data:
    for i in data:
        palabras = i.split()
        x, y, z = map(float, palabras[1:])
        Coordenadas.append((x,y,z))
data.close()

#Crea una lista donde cada elemento son las conexiones que tiene un atomo
with open("NanoConexion.dat","w") as datawrite:
    Conexiones = []
    for i in range(0,200):
        Aristas = []
        for j in range(0,200):
            if  Distancia(Coordenadas[i],Coordenadas[j]) >= 1.40 and Distancia(Coordenadas[i],Coordenadas[j]) <= 1.44:
                Aristas.append(j)
                Linea = "<" + str(Coordenadas[i][0]) + ", " + str(Coordenadas[i][1]) + ", " + str(Coordenadas[i][2]) + ">, " + "<" + str(Coordenadas[j][0]) + ", " + str(Coordenadas[j][1]) + ", " + str(Coordenadas[j][2]) + ">, \n"
                datawrite.write(Linea)
        Conexiones.append(Aristas)        
datawrite.close()

