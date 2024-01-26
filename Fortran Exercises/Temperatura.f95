!Programa creado el 11/02/2020 por Diego Alejandro Reyes
program Temperatura
	implicit none
    !Declaracion de variables
    real, dimension(6,6):: A
    real, dimension(6):: L,S,Lo
    real p,la
    character(10) b,c
    integer i,j
    !Declaracion de datos
    b = "Longuitud"
    c = "Latitud"
    write(*,*)'Este programa calcula los valores promedio de las temperaturas de distintos lugares'
    write(*,*)''
    A(1,1)=68.2 ;A(1,2)=72.1 ;A(1,3)=72.5 ;A(1,4)=74.1 ;A(1,5)=74.4 ;A(1,6)=74.2
    A(2,1)=69.4 ;A(2,2)=71.1 ;A(2,3)=71.9 ;A(2,4)=73.1 ;A(2,5)=73.6 ;A(2,6)=73.7
    A(3,1)=68.9 ;A(3,2)=70.5 ;A(3,3)=70.9 ;A(3,4)=71.5 ;A(3,5)=72.8 ;A(3,6)=73.0
    A(4,1)=68.8 ;A(4,2)=69.9 ;A(4,3)=70.4 ;A(4,4)=70.8 ;A(4,5)=71.5 ;A(4,6)=72.2
    A(5,1)=68.1 ;A(5,2)=69.3 ;A(5,3)=69.8 ;A(5,4)=70.2 ;A(5,5)=70.9 ;A(5,6)=71.2
    A(6,1)=68.3 ;A(6,2)=68.8 ;A(6,3)=69.6 ;A(6,4)=70.0 ;A(6,5)=70.5 ;A(6,6)=70.9
    !Obtencion de promedios por columnas y filas
    do i = 1,6
      L(i) = 0
      do j = 1,6
      	L(i) = L(i) + A(j,i)
      end do
      L(i) = (L(i))/6.0
    end do
    do i = 1,6
      S(i) = 0
      do j = 1,6
      	S(i) = S(i) + A(i,j)
      end do
      S(i) = (S(i))/6.0
    end do
    p = 0
    do i = 1,6
      p = p + S(i)
    end do
    p = p/6.0
    do i = 1,6
      Lo(i) = ((i-1)*(0.5))+ 90
    end do
    !Impresion del resultante
    write(*,103) c,b
    write(*,*)''
    write(*,101) Lo(1),Lo(2),Lo(3),Lo(4),Lo(5),Lo(6)
    write(*,*)''
    la = 30
    do i = 1,6
      la = la + 0.5
      write(*,100) la,A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,6),S(i)
    end do
    !Formatos
    100 format(5X,1F4.1,5X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2,10x,1F5.2)
    101 format(14X,1F4.1,7X,1F4.1,6X,1F4.1,6X,1F4.1,6X,1F4.1,6X,1F4.1)
    102 format(14X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2,5X,1F5.2)
    103 format(3X,1A10,25X,1A10)
    write(*,*)''
    write(*,102) L(1), L(2), L(3), L(4), L(5), L(6)
    write(*,*)''
    write(*,*)'El promedio de todas las cuidades es:',p
    pause
end program