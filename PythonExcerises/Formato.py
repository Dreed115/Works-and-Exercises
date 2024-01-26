import math

#Lee y guarda las coordenadas de cada atomo en una lista
Coordenadas = []
with open("Posiciones.xyz","r") as data:
    for i in data:
        palabras = i.split()
        x,y,z = map(float, palabras)
        Coordenadas.append((x,y,z))
data.close()

Cord = list(set(Coordenadas))

with open("C60nuevo.xyz", "w") as archivo_xyz:
    # Escribir el número de átomos en el archivo
    archivo_xyz.write(str(len(Cord)) + "\n")
    # Escribir un comentario opcional en la segunda línea
    archivo_xyz.write("Datos de coordenadas tridimensionales\n")
    
    # Escribir las coordenadas en el formato x y z en líneas separadas
    for coordenada in Cord:
        x, y, z = coordenada
        archivo_xyz.write(f"C {x} {y} {z}\n")


       
               
