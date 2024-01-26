!Este programa fue realizado el 30/01/2020 por Diego Alejandro Reyes Ramos
program progresion
	implicit none
    !Declaracion de Variables
    real b,c,e,s
    integer a,n
    !Obtencion de datos
    write(*,*)'Este programa calcula e imprime la suma de la progresion geometrica de un numero definido de terminos' 
    write(*,*)'Escriba el numero de terminos que desee'
    read(*,*) n
    b = 1
    s = 1
    !Calculo e impresion de los terminos
    do a = 1,n
      c = b*(1.0/3.0)
      s = s + c
      b = c
      write(*,*) b
    end do
    !Calculo de la suma infinita e impresion
    e = 1/(1-(1.0/3.0))
    write(*,*)'La suma de los ', n,' terminos es: ', s,' y la suma cuando n tiende a infinito es: ', e
    pause
end program  