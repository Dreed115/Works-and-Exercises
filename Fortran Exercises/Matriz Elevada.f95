!Este Programa fue hecho el 24/02/2020 por Diego Alejandro Reyes Ramos
program MatrizElevada
	implicit none 
    !Declaracion de variables
    real, allocatable, dimension(:,:):: A,B,C
    integer i,j,n,k
    write(*,*)'Ingresa el tamaño de la matriz cuadrada'
    read(*,*) n
    write(*,*)'Ingresa la potencia que deseas elevar la matriz'
    read(*,*)k
    allocate(A(n,n),B(n,n),C(n,n))
    !Llenado de datos
    do i = 1,n
      do j = 1,n
        write(*,*)'Valor de:',i,j
      end do
    end do
    B = A
    !Aplicacion de la subrutina
    do i = 1,k
      call Multiplicar(A,B,C,n)
      A = C
    end do
    do i = 1,n
      do j = 1,n
        write(*,*) A(i,j)
      end do
    end do
end program

!Subrutina para multiplicar
subroutine Multiplicar(X,Y,Z,n)
	integer b,c,f,n
    real g
    real, dimension(n,n):: X,Y,Z
    do b = 1,n
      do c = 1,n
        Z(b,c) = 0
      end do
    end do
	do b = 1, n
      do c = 1, n
        do f = 1, n
          g = X(b,f)*Y(f,c) 
          Z(b,c) = Z(b,c) + g
        end do  
      end do
    end do
end subroutine
    