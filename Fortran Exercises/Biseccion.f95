program Biseccion
	implicit none
	integer z,op,i 
    real r,l,p,rlim,llim,plim,er,ra
    real, allocatable, dimension(:):: E
	write(*,*)'Este programa enceuntra las raices de una funcion polinomial por el metodo de biseccion'
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
   		write(*,*)'Limite derecho: '
   		read(*,*) r
   		write(*,*)'Limite izquierdo: '
    	read(*,*) l
    	call funcion(r,E,rlim)
    	call funcion(l,E,llim)
    	do while (rlim*llim < 0)
        	call mitad(r,l,p)
        	call funcion(p,E,plim)
        	if (llim*plim < 0) then
            	r = p
            	rlim = plim
            	call error(p,l,er)
                write(*,*) er
            	if (er < 0.05) then
                	ra = p
                	write(*,*)'La raiz es: ',ra
                	exit
                end if
            end if 
        	if (llim*plim > 0) then
            	l = p
            	llim = plim
            	call error(p,r,er)
                write(*,*) er
            	if (er < 0.05) then
                	ra = p 
                	write(*,*)'La raiz es: ',ra
                	exit
                end if
            end if
        	if (llim*plim == 0) then
            	ra = p 
            	write(*,*)'La raiz es: ',ra
            	exit
            end if
        end do
    	write(*,*)'Oprima 1 para sacar otra raiz: '
    	read(*,*) op
	end do       
end program

subroutine error(a,b,e)
	real a,b,e
    e = abs((a-b)/a)*100
    return
end subroutine

subroutine mitad(a,b,m)
	real a,b,m
    m = ((b + a)/2)
    return
end subroutine

subroutine funcion(a,X,n)
	real a,n
    real ,dimension(7):: X
    n = X(7)*a**6+X(6)*a**5+X(5)*a**4+X(4)*a**3+X(3)*a**2+X(2)*a**1+X(1)
    return
end subroutine