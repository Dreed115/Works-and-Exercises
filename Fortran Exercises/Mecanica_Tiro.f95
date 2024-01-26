program Tiro_Parabolico
	implicit none 
    real t,x
    integer i
    real, dimension(5):: B 
    B(1) = (1.0/9)*(3.1416)
    B(2) = (36.9/180)*(3.1416)
    B(3) = (1.0/4)*(3.1416)
    B(4) = (53.1/180)*(3.1416)
    B(5) = (7.0/18)*(3.1416)
	write(*,*)'Este programa realiza el caluclo del tiro parabolico de un objeto'
    do i = 1,5
      write(*,*)'Cuando el angulo vale en grados:',(B(i)*180)/(3.1416)
      t = (2*(27.5)*sin(B(i)))/(9.81)
      x = (27.5)*(cos(B(i)))*t
      write(*,*)'Entonces el tiempo es:',t
      write(*,*)'Entonces la distancia recorrida es:',x
      write(*,*)''
    end do
    pause
end program