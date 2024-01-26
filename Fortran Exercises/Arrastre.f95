!Programa hecho el 29/01/2020 por Diego Alejndro Reyes Ramos
program Arrastre
	implicit none
    !Declaracion de Variables
    real a,b,c,d,e
    a = 1
    write(*,*)'Este programa calcula el arrastre de una esfera en cierta superficie con la viscocidad, velocidad y diametro'
    !Obtencion de datos
    do while(a == 1)
      write(*,*)'Escriba la viscocidad, velocidad y diametro en unidades de pies y libras'
      read(*,*) b,c,d
      !Calculo del Arrastre
      e = 3*3.14159*b*c*d
      write(*,*)'El arrastre va a ser: ',e
      write(*,*)'Si quiere volver a calcular oprima 1, sino oprima cualquier numero para continuar'
      read(*,*) a
    end do
    pause
end program