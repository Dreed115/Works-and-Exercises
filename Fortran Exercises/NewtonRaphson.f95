program NewronRaphson
	implicit none
	integer op,i 
    real r,l,u,v,uprimx,uprimy,vprimx,vprimy,px,py,er,el
    real, dimension(6):: E,F
	write(*,*)'Este programa enceuntra las raices de una funcion de dos variables por Newton Raphson'
    write(*,*)'De la forma Ax2 + By2 + Cxy + Dx + Ey + F'
	do i = 1,6
    	write(*,*)'Coeficeinte del termino: ',i,' Para la ecuacion 1 '
    	read(*,*) E(i)
    end do
    
	do i = 1,6
    	write(*,*)'Coeficeinte del termino: ',i,' Para la ecuacion 2 '
    	read(*,*) F(i)
    end do
    
	op = 1

	do while(op == 1)
   		write(*,*)'valor inicial en x: '
        read(*,*) r
        write(*,*)'Valor inicial en y: '
    	read(*,*) l
    	er = 1
        el = 1
    	do while (er > 0.05 .and. el > 0.05 )
        	call funcion(r,l,E,u)
            call funcion(r,l,F,v)
            call primax(r,l,E,uprimx)
            call primax(r,l,F,vprimx)
            call primay(r,l,E,uprimy)
            call primay(r,l,F,vprimy)
        	call Newton(r,u,vprimy,v,uprimy,uprimx,vprimx,px)
            call Newton(l,v,uprimx,u,vprimx,vprimy,uprimy,py)
        	call error(px,r,er)
            call error(py,l,el)
        	r = px
            l = py
        end do
    	write(*,*)'La raiz en x es: ',r
        write(*,*)'La raiz en y es: ',l
    	write(*,*)'Oprima 1 para sacar otra raiz: '
    	read(*,*) op
	end do       
end program

subroutine error(a,b,e)
	real a,b,e
    e = abs((a-b)/a)*100
    return
end subroutine

subroutine Newton(b,c,d,e,f,g,h,m)
	real b,c,d,e,f,g,h,m
    m = b -(((c*d)-(e*f))/((g*d)-(f*h)))
    return
end subroutine

subroutine primax(a,b,X,n)
	real a,b,n
    real ,dimension(6):: X
    n = 2*X(1)*a + X(3)*b + X(4)
    return
end subroutine

subroutine primay(a,b,X,n)
	real a,b,n
    real ,dimension(6):: X
    n = 2*X(2)*b + X(3)*a + X(5)
    return
end subroutine

subroutine funcion(a,b,X,n)
	real a,b,n
    real ,dimension(6):: X
    n = X(1)*a**2 + X(2)*b**2 + X(3)*a*b + X(4)*a + X(5)*b + X(6)
    return
end subroutine