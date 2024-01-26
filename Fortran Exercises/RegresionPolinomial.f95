program RegresionPolinomial
    !Declaracion de variables
	implicit none
    integer i,j,m,n,k,w,op
    real num,res
    real, allocatable, dimension(:,:):: A
    real, allocatable, dimension(:):: B,C,D
    !Obtencion de datos
    write(*,*)'Este programa resuelve una regresion polinomial'
    write(*,*)'Exponente de la funcion a encontrar: '
    read(*,*) w
    n = w + 1
    m = w + 1
    allocate(A(m+1,n),B(n),C(n),D(n))
    !Obtener los elementos
    do i = 1,n
      write(*,*)'Valor en x del conjunto',i
      read(*,*) D(i)
      write(*,*)'Valor en y del conjunto',i
      read(*,*) A(n+1,i)
      do j = n,2,-1
        A(j,i) = D(i)**(j-1)
      end do
      A(1,i) = 1
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
    write(*,*)''
	do i = 1,m
      write(*,*)'El valor del termino del coeficiente', i-1 ,' es' ,B(i)
    end do
	write(*,*)''

    !Evaluacion en Puntos de la funcion
	write(*,*)'Si desea evaluar en otro punto oprima 1, sino cualquier numero'
    read(*,*) op
      
    do while(op == 1)
      write(*,*)'Numero a evaluar: '
      read(*,*) num
      call evaluar(B,n,num,res)
      write(*,*)''
      write(*,*)'El resultado en el punto evaluado es: ',res
      write(*,*)''
      write(*,*)'Si desea evaluar en otro punto oprima 1, sino cualquier numero'
      read(*,*) op
      write(*,*)''
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

!subroutina para evaluar
subroutine evaluar(X,n,a,b)
	integer n,i
    real a,b
    real, dimension(n)::X
    b = 0
    if(a == 0)then
      b = X(n)
    end if
    if(a /= 0)then
      do i = 1,n
        b = b + X(i)*a**(i-1)
      end do
    end if
end subroutine
	