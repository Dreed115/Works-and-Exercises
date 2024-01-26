program MatrizElevada
	implicit none 
    real, allocatable, dimension(:,:):: A,B,C
    integer i,j,n,k,l
    write(*,*)'Ingresa el tama�o de la matriz cuadrada'
    read(*,*) n
    write(*,*)'Ingresa la potencia que deseas elevar la matriz'
    read(*,*)k
    allocate(A(n,n),B(n,n),C(n,n))
    do i = 1,n
      do j = 1,n
        write(*,*)'Valor de:',i,j
        read(*,*) A(i,j)
      end do
    end do
    do i = 1,n
	  do j = 1,n
        B(i,j) = A(i,j)
      end do
    end do
    do i = 1,k-1
      call Multiplicar(A,B,C,n)
      do j = 1,n
	    do l = 1,n
          A(j,l) = C(j,l)
        end do
      end do
    end do
    do i = 1,n
      do j = 1,n
        write(*,*) A(i,j)
      end do
    end do
end program

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
    