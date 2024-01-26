!Este programa fue hecho el 18/02/2020 por Diego Alejandro Reyes Ramos
program Distancia
	implicit none
    !Declaracion de variables
    real lenght,a,b
    integer i,j
    real, dimension(10,10):: C
    integer, dimension(10)::E
    !Abrir archivo de impresion
    open (unit = 10, file='distancia.txt',status='unknown')
    write(10,*)'Este programa calcula la distancia de los puntos (1,1) a (10,10) respectivamente'
    write(10,*)''
    a = 0
    b = 0
    !Calculo de la distancia de cada punto al origen
    do i = 1,10
      a = a + 1
      do j = 1,10
        b = b + 1
        C(i,j) = lenght(a,b)
      end do
      b = 0
    end do
    do i = 1,10
      E(i) = i
    end do
    !Impresion de una tabla de valores de las distancias
    101 format (2X,1I2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2,2X,1F6.2)
    102 format (9X,1I1,7X,1I1,7X,1I1,7X,1I1,7X,1I1,7X,1I1,7X,1I1,7X,1I1,7X,1I1,6X,1I2)
    write(10,102)E(1),E(2),E(3),E(4),E(5),E(6),E(7),E(8),E(9),E(10)
    do i = 1,10
      write(10,101) E(i),C(i,1),C(i,2),C(i,3),C(i,4),C(i,5),C(i,6),C(i,7),C(i,8),C(i,9),C(i,10)
    end do
    close(10)
end program

!Funcion de la distancia
real function lenght (x,y)
	real d,x,y
    d = sqrt((x**2)+(y**2))
    lenght = d
end function