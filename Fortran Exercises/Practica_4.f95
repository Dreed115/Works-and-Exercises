!Programa hecho el 24/01/2020 por Diego Alejndro Reyes Ramos
program Array
	implicit none
    !Declaracion de arreglos a usar
    real, dimension(3):: v,v1
    real, dimension(2,2):: m
    write(*,*)'Este programa lee y guarda los valores de vectores y matrices'
    !Obtencion y guardado de los valores
    write(*,*)'Ingrese los valores de el primero vector de R3'
    read(*,*) v(1),v(2),v(3)
    write(*,*)'Ingrese los valores del segundo vector de R3' 
    read(*,*) v1(1),v1(2),v1(3)
    write(*,*)'Ingrese los valores de la matriz 2x2'
    read(*,*) m(1,1),m(1,2),m(2,1),m(2,2)
    !Impresion de los vlores especificados
    write(*,*)'Los valores del primer vector son: ',v(1),', ',v(2),', ',v(3)
    write(*,*)'El segundo elemento del segundo vector es: ',v1(2)
    write(*,*)'El componente (1,2) de la matriz es: ',m(1,2)
    !Pausa
    pause
end program