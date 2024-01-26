!Programa hecho el 06/02/2020 por Diego Alejndro Reyes Ramos
program seno
	implicit none
    !Declaracion de variables
    real a,b,f,si,s
    integer n,j,p,i
    integer, dimension(4):: C
    C(1) = 5
    C(2) = 8
    C(3) = 10
    C(4) = 12
    !Ingreso de datos
    write(*,*)'Este programa calcula y compara la funcion seno de cualquier angulo dado'
    write(*,*)'Ingrese el angulo en grados'
    read(*,*) a
    b = (a/180)*(3.1416)
    s = 0
    !Para una sumatoria de 8,10,12
    do i = 1,4
      do n = 1,C(i)
        p = (2*n-1)
        f = 1
        !Obtener factorial
        do j = 0,p-1 
          f = f*(p-j)
        end do
        !Sumatoria
        s = s + ((-1)**(n+1))*((b**p)/(f))
      end do
      si = sin(b)
      write(*,*)'El seno de',a,'con sumatoria de',C(i),' es',s
      s = 0
    end do
    !Comparacion resultados
    write(*,*)'El seno es:',si
    pause
end program




