!Programa hecho el 27/01/2020 por Diego Alejndro Reyes Ramos
program Cuadratica
	implicit none
    !Declaracion de Variables
    real a,b,c,d
    write(*,*)'Este programa lee los coeficientes de una funcion cuadratica y determina la naturaleza de sus raices y su valor'
    write(*,*)'Escriba el coeficiente cuadratico, lineal e independiente respectivamente'
    read(*,*) a,b,c
    d = (b**2)-(4*a*c)
    !Operaciones y condiciones de raiz
    if(d >= 0)then
      if(d == 0)then
        write(*,*)'Solo hay una raiz y es real'
        write(*,*)'La raiz es: ', -b/2*a
      else
        write(*,*)'Las raices son diferentes y reales'
        write(*,*)'Las raices son: ', (-b+sqrt(d))/2*a, 'y ', (-b-sqrt(d))/2*a
      end if
    else
      write(*,*)'Las raices son complejos conjugados'
      write(*,*)'Las raices son: ', (-b)/2*a,'+ i', (sqrt(abs(d)))/2*a,'y ', (-b)/2*a,'- i', (sqrt(abs(d)))/2*a
    end if
    pause
end program
    