!Programa Realizado el 14/02/2020 por Diego Alejandro Reyes Ramos
program Estacionario
	implicit none
    !Declaracion de variables
    real, dimension(12,12):: A,B,C
    integer i,j,op,d
    open(unit=10,file='Temperatura.txt',status='unknown')
    !Agregar Datos ya establecidos
    do i= 1,12
      do j= 1,12
        A(i,j) = 47
      end do
    end do
    A(3,8) = 110
    do i = 1,12
      A(1,i) = 18
      A(12,i) = 18
    end do
    do i = 1,12
      A(i,1) = 18
      A(i,12) = 18
	end do
    !Impresion de la visualizacion primaria
    100 format(3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F5.1,3X,1F4.1,3X,1F4.1,3X,1F4.1,3X,1F4.1)
    write(10,*)'La temperatura de una placa es la siguiente:'
    write(10,*)''
    do i = 1,12
      write(10,100) A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,6),A(i,7),A(i,8),A(i,9),A(i,10),A(i,11),A(i,12)
    end do
    !Ciclo de condicionales
    op = 1
    d = 0
    do while(op == 1)
      !Obtencion y asignacion de promedios 
      do i = 2,11
        do j = 2,11
          B(i,j) = A(i,j)
          A(i,j) = (A(i+1,j) + A(i-1,j) + A(i,j+1) + A(i,j-1))/4
          A(3,8) = 110
          !Diferencia de temperaturas
          C(i,j)= abs(A(i,j)-B(i,j))
        end do
      end do
      !Condiciones para repetir
      op = 2
      do i = 2,11
        do j = 2,11
          if (op == 2) then
            if (C(i,j) > 0.001) then
              op = 1
            else
              op = 2
            end if
          end if
        end do
      end do
      d = d +1
    end do
    !Impresion de resultados
    write(10,*)''
    write(10,*)'La temperatura de cada nodo estabilizada es la siguiente:'
    write(10,*)'Iteraciones',d
    write(10,*)''
    do i = 1,12
      write(10,100) A(i,1),A(i,2),A(i,3),A(i,4),A(i,5),A(i,6),A(i,7),A(i,8),A(i,9),A(i,10),A(i,11),A(i,12)
    end do
    close(10)
    pause
end program

