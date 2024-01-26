program Trapecio
	implicit none
    integer i,x,n
    real a,b,r,l,u,e,in,c,ai,bi,fi,er
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
    do while(abs(er) > 0.001)
        n = n + 10
    	e = 0
    	c = ((b-a)/n)
		do i = 1,n-1
      		call funcion(F,x,a+c*i,u)
      		e = e + u
    	end do
    	in = (b-a)*((l+2*e+r)/(2*n))
        call funcionerror(F,x,b,bi)
    	call funcionerror(F,x,a,ai)
    	fi = (bi-ai)/(b-a)
    	call error(fi,a,b,n,er)
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

subroutine funcionerror(E,c,x,f)
	integer i,c
    real x,b
    real, dimension(c+1)::E
    f = 0
	do i = 3,c+1
      	b = (i-1)*E(i)*x**(i-2)
    	f = f + b
    end do
end subroutine

subroutine error(f,a,b,n,er)
	integer n
	real f,a,b,c,d
    c = (b-a)**3
    d = 12*n**2
    er = ((c/d)*f)*100
end subroutine
