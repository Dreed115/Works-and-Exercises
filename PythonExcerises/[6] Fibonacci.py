#Programa Fibonacci

print('Este programa imprime la secuencia fibonacci hasta cierto limite dado')
print('Ingrese el limite: ')
lim = int(input())
a = 0
b = 1
while True:
    print(a)
    c = a + b
    a = b
    b = c
    if(a >= lim):
        break