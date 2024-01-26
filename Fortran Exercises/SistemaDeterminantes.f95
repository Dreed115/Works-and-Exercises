program SistemasDeterminantes
	implicit none
    integer op,i,j
    real n,n1,n2,n3,r,r1,r2
    real, allocatable, dimension(:,:):: A
    write(*,*)'Este programa resuelve un sistema de dos y tres variables con determinantes'
    write(*,*)'Para 2 variables oprima 0, para 3 oprima 1'
    read(*,*) op
    if(op == 0)then
      allocate(A(2,3))
      do i = 1,2
        do j = 1,2
          write(*,*)'Terimno ',j,' de la ecuacion ',i
          read(*,*) A(i,j)
        end do
        write(*,*)'Resultado de la ecuacion ',i
        read(*,*) A(i,3)
      end do
      call det(A,n)
      call cambiar(A,1,3,2)
      call det(A,n1)
      call cambiar(A,1,2,2)
      call cambiar(A,2,3,2)
      call det(A,n2)
      r = n1/n
      r1 = n2/n
      write(*,*)'El resultado del primer termino es: ',r
      write(*,*)'El resultado del segundo termino es: ',r1
      end if

      if(op == 1)then
        allocate(A(3,4))
        do i = 1,3
          do j = 1,3
            write(*,*)'Terimno ',j,' de la ecuacion ',i
            read(*,*) A(i,j)
          end do
          write(*,*)'Resultado de la ecuacion ',i
          read(*,*) A(i,4)
        end do
        call deter(A,n)
        call cambiar(A,1,4,3)
        call deter(A,n1)
        call cambiar(A,1,4,3)
        call cambiar(A,2,4,3)
        call deter(A,n2)
        call cambiar(A,2,4,3)
        call cambiar(A,3,4,3)
        call deter(A,n3)
        r = n1/n
        r1 = n2/n
        r2 = n3/n
        write(*,*)'El resultado del primer termino es: ',r
        write(*,*)'El resultado del segundo termino es: ',r1
        write(*,*)'El resultado del tercer termino es: ',r2
        end if
end program

subroutine det(X,a)
    real a
	real, dimension(2,3)::X
    a = X(1,1)*X(2,2)-X(1,2)*X(2,1)
end subroutine

subroutine deter(X,d)
    real a,b,c,d
	real, dimension(3,4)::X
    a = X(1,1)*(X(2,2)*X(3,3)-X(2,3)*X(3,2))
    b = X(1,2)*(X(2,1)*X(3,3)-X(3,1)*X(2,3))
    c = X(1,3)*(X(2,1)*X(3,2)-X(3,1)*X(2,2))
    d = a-b+c
end subroutine     

subroutine cambiar(X,n,m,e)
	integer n,m,j,e
	real, dimension(e,e+1)::X
    real, dimension(e)::B
	do j = 1,e
      B(j) = X(j,n)
      X(j,n) = X(j,m)
      X(j,m) = B(j)
    end do
end subroutine
        
    
    