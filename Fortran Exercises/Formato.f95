!Programa creado el 10/02/2020 por Diego Alejandro Reyes
program tabla
	!Declaracion de variables
	implicit none
    integer i
    character(20) a,c
    real s,b
    !Impresion y formato
    a = "Angulo en Grados"
    c = "Seno del Angulo"
    write(*,*)'Este programa imprime una tabla del seno de varios angulos'
    101 format(2X,1A15,6X,1A15)
    write(*,101)a,c
    100 format(7X,1I2,19X,1F5.3)
    !Calculo de valores de seno
    do i = 0,90,5
      b = ((i/180.0))*(3.1416)
      s = sin(b)
      write(*,100) i,s
    end do
    pause 
end program