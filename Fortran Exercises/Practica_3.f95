!Este Programa fue elaborado el 24/01/2020 por Diego Alejandro Reyes Ramos
program numero
	implicit none 
    !Declaracion de variables
    real a,b,c,d
    write(*,*)'Este prgrama realiza la raiz cuadrada, coseno inverso y potencia al -3 de un numero'
    !Obtencion de datos
    write(*,*)'introduzca un numero'
    read(*,*) a
    !Operaciones
    b = sqrt(a)
    c = acos(a)
    d = a**(-3)
    !Impresion de resultados
    write(*,*)'La raiz cuadrada del numero es: ',b
    write(*,*)'El coseno inverso del numero es: ',c
    write(*,*)'La potencia a la menos tres es: ',d
    pause
end program