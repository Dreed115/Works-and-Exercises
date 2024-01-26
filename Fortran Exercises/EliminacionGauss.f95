program EliminacionGauss
    !Declaracion de variables
	implicit none
    integer i,j,m,n,k
    real, allocatable, dimension(:,:):: A
    real, allocatable, dimension(:):: B,C
    !Obtencion de datos
    write(*,*)'Este programa resuelve un sistema de ecuaciones dado por Eliminacion Gaussiana'
    write(*,*)'Cantidad de terminos: '
    read(*,*) m
    write(*,*)'Cantidad de ecuaciones: '
    read(*,*) n
    allocate(A(m+1,n),B(n),C(n))
    !Obtener los elementos
    do i = 1,n
      do j = 1,m
        write(*,*)'Termino ',j,' de la ecuacion ',i
        read(*,*) A(j,i)
      end do
      write(*,*)'Resultado de la ecuacion ',i
      read(*,*) A(m+1,i)
    end do
	
	!Aplicar metodo de eliminacion
	do k = 1,n
   	  do i = k,n
        do j = k,n
      	  call ordenar(A(k,i),A(k,j),A,m,n,i,j)
        end do
      end do
	  call uno(A,m,n,k)
      call suma(A,m,n,k)
    end do
	
	!Escritura de los elementos ya acomodados
   	do i = 1,n
      do j = 1,m+1
        write(*,*)A(j,i)
      end do
      write(*,*)''
    end do
    
	do i =  1,n
      B(i) = A(m+1,i)
    end do 

	!Obtencion de los valores de cada uno
	do i = n,1,-1
      do j = m,1,-1
        C(j) = B(j)
        B(i) = B(i) - A(j,i)*C(j)
      end do
      B(i) = B(i) + A(i,i)*C(i)
    end do  
	do i = 1,m
      write(*,*)'El valor del termino', i ,' es' ,B(i)
    end do

end program

!Subrutina para ordenar
subroutine ordenar(w,e,X,m,n,k,l)
	integer j,k,l,m,n
    real w,e
	real, dimension(m+1,n):: X
    real, dimension(m+1):: Z
    if(abs(w).gt.abs(e)) then
      do j = 1,m+1
		Z(j) = X(j,k)
      end do
      do j = 1,m+1
		X(j,k) = X(j,l)
      end do
      do j = 1,m+1
		X(j,l) = Z(j)
      end do
    end if
end subroutine

!subrutina para convertir a uno
subroutine uno(X,m,n,k)
    integer k,m,n
    real a
	real,dimension(m+1,n)::X
    a = X(k,k)
    do i = k,m+1
      X(i,k) = X(i,k)/a
    end do
end subroutine

!subrutina para sumar elementos	
subroutine suma(X,m,n,k)
	integer m,n,k
    real b
    real, dimension(m+1,n)::X
    do i = k+1,n
      b = -X(k,i)
      do j = k,m+1 
      	X(j,i) = X(j,i)+b*X(j,k)
      end do
    end do
end subroutine