program nada
	implicit none
    integer z,i
    real r,rlim
    real, allocatable, dimension(:):: E
    allocate(E(7))
    z = 3
    do i = 1,7
    	E(i) = 0
    end do
    
	do i = 1,z+1
    	write(*,*)'Coeficeinte del exponente: ',i-1
    	read(*,*) E(i)
    end do
	do i = 1,7
    	write(*,*) E(i)
    end do
	r = 10
    call funcion(r,E,rlim)
    write(*,*)rlim
    
end program

subroutine funcion(a,X,n)
	real a,n
    real ,dimension(7):: X
    n = X(7)*a**6+X(6)*a**5+X(5)*a**4+X(4)*a**3+X(3)*a**2+X(2)*a**1+X(1)
    return
end subroutine