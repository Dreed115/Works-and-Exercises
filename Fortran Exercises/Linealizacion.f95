!Este Programa fue hecho el 25/02/2020 por Diego Alejandro Reyes Ramos
program Linealizacion
	implicit none
    !Declaracion de variables
    real, allocatable, dimension(:,:):: A
    real c,w,v,p,q,bl,cl
    integer n,i
    write(*,*)'Ingrese la cantidad de puntos que se tienen'
    read(*,*) n
    allocate(A(n,2))
    !Obtencion de datos
    do i = 1,n
      write(*,*)'Valor en independiente y dependiente del punto', i
      read(*,*) A(i,1),A(i,2)
    end do
    !Caluclos de las partes
    v = 0
    do i = 1,n
      w = log(A(i,1))*log(A(i,2))
      v = v + w
    end do
    p = 0
    q = 0
    do i = 1,n
      p = p + log(A(i,1))
      q = q + log(A(i,2))
    end do
    !Calculo y aplicacion de los valores
    call Pendiente(A,n,v,p,q,bl)
    call Coeficiente(A,n,v,p,q,c,cl)
    c = (2.718)**c
    !Impresion
    write(*,*)'La pendiente es:', bl
    write(*,*)'El coeficiente es:', c
    write(*,*)'El coeficiente de corelacion es:', cl
end program

!Subrutinas para el calculo de cada parte
subroutine Pendiente(X,d,ve,pe,qe,mn)
	real ve,pe,qe,l,o,z,zp,mn
    integer in,d
    real,dimension(d,2):: X
    l = 0
    do in = 1,d
      o = (log(X(in,1)))**2
      l = l + o
    end do
    z = qe/d
    zp = pe/d
    !m = ((d*ve)-(pe*qe))/((d*l)-(pe**2))
    mn = (ve-(pe*z))/(l-(pe*zp))
end subroutine

subroutine Coeficiente(Y,e,t,s,g,r,rn)
	real t,s,g,le,ou,r,ol,lo,rn,un
    integer j,e
    real, dimension(e,2):: Y
    le = 0
    lo = 0
    do j = 1,e
      ou = (log(Y(j,1)))**2
      ol = (log(Y(j,2)))**2
      le = le + ou
      lo = lo + ol
    end do
    r = ((g*le)-(s*t))/((e*le)-(s**2))
    un = (e*le-(s**2))*(e*lo-(g**2))
    rn = (t-s*g)/(sqrt(un))
end subroutine