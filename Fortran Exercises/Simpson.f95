program Trapecio
	implicit none
    integer i,x,n
    real a,b,r,l,u,e,in,c,er,v,g,vol
    real, allocatable, dimension(:):: F
    write(*,*)'Este programa calcula la integral definida de una funcion polinomial'
    write(*,*)'Grado maximo de la funcion: '
    read(*,*) x
	allocate(F(x+1))
    
    do i = 1,x+1
      write(*,*)'Coeficiente del exponente: ',i-1
      read(*,*) F(i)
    end do

    write(*,*)'Limite izquierdo: '
    read(*,*) a
    write(*,*)'Limite derecho: '
    read(*,*) b
	n = 0
	call funcion(F,x,a,l)
    call funcion(F,x,b,r)
    er = 2
    vol = 100
    do while(abs(er) > 0.0001)
        n = n + 2
    	e = 0
        g = 0
    	c = ((b-a)/n)
		do i = 1,n-1,2
      		call funcion(F,x,a+c*i,u)
      		e = e + u
    	end do
        do i = 2,n-2,2
        	call funcion(F,x,a+c*i,v)
            g = g + v
        end do
    	in = (b-a)*((l+4*e+2*g+r)/(3*n))
    	call error(vol,in,er)
        vol = in
    end do
    write(*,*)'El resultado de la integral definida es: ',in
    write(*,*)'Intervalos: ',n
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

subroutine error(c,d,er)
	real c,d
    er = abs(((d-c)/d))*100
end subroutine
