!Este programa fue hecho el 20/02/2020 por Diego Alejandro Reyes Ramos
program funtrig
	implicit none
    !Declaraacion de variables
    real n,b,c,d,senoh,cosenoh
    integer op
    !Obtencion de Valores
    op = 1
    write(*,*)'Este programa calcula el seno, coseno y tangente hiperbolicos de un numero'
    write(*,*)''
    do while(op == 1) 
      write(*,*)'Escriba un numero de -3 a 3'
      read(*,*) n
       !Ciclo para asegurar un valor en el intervalo
      do while (n<-3.or.n>3) 
        write(*,*)'Numero incorrecto'
        write(*,*)'Escriba un numero de -3 a 3'
        read(*,*)n  
      end do
      !Uso de funciones
      b = senoh(n)
      c = cosenoh(n)
      d = senoh(n)/cosenoh(n)
      !Impresion de valores
      write(*,*)''
      write(*,*)'El seno, coseno y tangente hiperbolico es respectivamente',b,c,d
      write(*,*)''
      write(*,*)'Escriba 1 para volver a calcular otro numero, sino cualquier tecla'
      read(*,*) op
    end do
end program

!Funciones Utilizadas
real function senoh(a)
	real a,b
    b = (((2.7182)**(a))-((2.7182)**(-a)))/2
    senoh = b
    return
end function

real function cosenoh(a)
	real a,b
    b = (((2.7182)**(a))+((2.7182)**(-a)))/2
    cosenoh = b
    return
end function