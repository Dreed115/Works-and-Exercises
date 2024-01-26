!Programa hecho el 04/02/2020 por Diego Alejndro Reyes Ramos
program ProductoVectores
	implicit none
    !Declaracion de Variables
    real, dimension(3):: A,B
    real c
    !Obtencion de valores
    write(*,*)'Este programa realiza el producto punto de dos vectores'
    write(*,*)'Ingrese los componentes del vector A respectivamente'
    read(*,*) A(1),A(2),A(3)
    write(*,*)'Ingrese los componentes del vector B respectivamente'
    read(*,*) B(1),B(2),B(3)
    !Operaciones e impresion
    c = A(1)*B(1)+A(2)*B(2)+A(3)*B(3)
    write(*,*)'El resultado es: ',c
    pause
end program