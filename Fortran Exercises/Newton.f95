program NewronRaphson
	implicit none
	integer z,op,i 
    real r,p,rlim,er,rprima
    real, allocatable, dimension(:):: E
	write(*,*)'Este programa enceuntra las raices de una funcion polinomial por el metodo de Newton Raphson'
	write(*,*)'Maximo exponente de la funcion hasta 6: '
	read(*,*) z 
	allocate(E(7))
    
    do i = 1,7
    	E(i) = 0
    end do
    
	do i = 1,z+1
    	write(*,*)'Coeficeinte del exponente: ',i-1
    	read(*,*) E(i)
    end do
    
	op = 1

	do while(op == 1)
   		write(*,*)'valor inicial en x: '
    	read(*,*) r
    	er = 1
    	do while (er > 0.05)
        	call funcion(r,E,rlim)
        	call prima(r,E,rprima)
        	call newton(r,rlim,rprima,p)
        	call error(p,r,er)
        	r = p
        end do
    	write(*,*)'La raiz es: ',p
    	write(*,*)'Oprima 1 para sacar otra raiz: '
    	read(*,*) op
	end do       
end program

subroutine error(a,b,e)
	real a,b,e
    e = abs((a-b)/a)*100
    return
end subroutine

subroutine Newton(b,c,t,m)
	real b,c,t,m
    m = b -(c/t)
    return
end subroutine

subroutine prima(a,X,n)
	real a,n
    real ,dimension(7):: X
    n = 6*X(7)*a**5 + 5*X(6)*a**4 + 4*X(5)*a**3 + 3*X(4)*a**2 + 2*X(3)*a + X(2)
    return
end subroutine

subroutine funcion(a,X,n)
	real a,n
    real ,dimension(7):: X
    n = X(7)*a**6+X(6)*a**5+X(5)*a**4+X(4)*a**3+X(3)*a**2+X(2)*a**1+X(1)
    return
end subroutine