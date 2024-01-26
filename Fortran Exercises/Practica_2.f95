!Este programa fue elaborado el 24/01/2020 por Diego Alejandro Reyes Ramos
program multiplicar
	implicit none
    !Declaracion de Variables
    real a,b,c,d
    !Obtencion de Valores
    write(*,*) 'Este programa realiza la suma de tres numeros'
    write(*,*) 'Ingrese tres numeros cualesquiera'
    read(*,*) a,b,c
    !Operacion e Impresion
    d = a*b*c
    write(*,*) 'El resultado de la multiplicacion es: ', d
    pause
end program