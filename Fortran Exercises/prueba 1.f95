program raiz
	implicit none
    integer x,i
    real a,b
    real, allocatable, dimension(:):: F
    write(*,*)'Grado maximo de la funcion: '
    read(*,*) x
	allocate(F(x+1))
    do i = 1,x+1
      write(*,*)'Coeficiente del exponente: ',i-1
      read(*,*) F(i)
    end do
    a = 2
    call funcion(F,x,a,b)
    write(*,*)b
end program

subroutine funcion(E,c,x,f)
	integer c,i
    real x,f,b
    real, dimension(c+1)::E
    f = 0
    if(x == 0)then
      f = E(1)
    end if
    if (x /= 0)then
	  do i = 1,c+1
      	b = E(i)*x**(i-1)
    	f = f + b
      end do
    end if
end subroutine
      