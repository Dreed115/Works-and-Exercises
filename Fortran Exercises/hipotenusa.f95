!Este programa fue hecho el 21/02/2020 por Diego Alejandro Reyes Ramos
program hipotenusa
	implicit none
    !Declaracion de variables
    real a,b,c
    !Obtencion de valoers
    write(*,*)'Este programa calcula la hipotenusa de un triangulo cualquiera'
    write(*,*)'ingrese los catetos'
    read(*,*)a,b
    !Llamada e impresion de la subrutina
    call hipo(a,b,c)
    100 format(5X,1A20,4X,1F5.2)
    write(*,100)'La hipotenusa es: ',c
end program

!Subrutina para el calculo de la hipotenusa
subroutine hipo(x,y,z)
	real x,y,z
    z = sqrt(x**2+y**2)
    return
end subroutine