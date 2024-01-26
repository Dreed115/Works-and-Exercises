!Programa hecho el 28/01/2020 por Diego Alejndro Reyes Ramos
program Fibonacci 
	implicit none
    !Declaracion de Variables
    integer a,b,c
    real lim
    !Obtencion de datos
    write(*,*)'Este programa imprime la secuencia fibonacci hasta cierto limite dado'
    write(*,*)'Ingresa el numero limite'
    read(*,*) lim
    a = 0
    b = 1
    !Calculo de resultados e impresion
    do while(a.le.lim)
      write(*,*) a
      c = a + b
      a = b
      b = c
    end do
    pause
end program
      