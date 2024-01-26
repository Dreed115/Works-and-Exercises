!Programa hecho el 31/01/2020 por Diego Alejndro Reyes Ramos
program Matriz
	!Declaracion de Variables
	implicit none
    integer m,n,e,d 
    real, allocatable, dimension(:,:):: A, B, C
    !Asignacion de tamaño a la matriz
    write(*,*)'Este programa suma dos matrices de acuerdo con el tamaño asignado por el usuario'
    write(*,*)'Cantidad de filas: '
    read(*,*) m
    write(*,*)'Cantidad de columnas'
    read(*,*) n
    !Obtencion de valores a las matrices
    allocate(A(m,n),B(m,n),C(m,n))
    do e = 1,m
      do d = 1,n
        write(*,*)'Valor de la matriz A en el punto',e,d
        read(*,*)A(e,d)
      end do
    end do
    do e = 1,m
      do d = 1,n
        write(*,*)'Valor de la matriz B en el punto',e,d
        read(*,*)B(e,d)
      end do
    end do
    !Suma e impresion de la matriz resultante
    do e = 1,m
      do d = 1,n
        C(e,d)= A(e,d) + B(e,d)
        write(*,*)'La suma en la pocicion:',e,d,'es: ',C(e,d)
      end do
    end do
    write(*,*)A
    pause
end program