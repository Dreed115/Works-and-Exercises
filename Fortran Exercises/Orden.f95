!Este Programa fue hecho el 24/02/2020 por Diego Alejandro Reyes Ramos
program Orden
	implicit none
    !Declaracion de variables
    real, allocatable, dimension(:):: N
    integer a,i,j
    !Ingreso de datos
    write(*,*)'Este programa ordena de mayor a menor n numeros dados'
    write(*,*)''
    write(*,*)'Ingrese la cantidad de numeros que desea ordenar'
    read(*,*) a
    allocate(N(a))
    do i = 1,a
      write(*,*)'Ingrese el valor', i
      read(*,*) N(i)
    end do
    !Aplicacion de la subrutina
    do i = 1,a
      do j = 1,a
        call ordenar(N(i),N(j))
      end do
    end do 
    100 format(1F5.2) 
    do i = 1,a
      write(*,100) N(i)
    end do
end program

!Subrutina para ordenar
subroutine ordenar(x,y)
	real x,y,z
    if(y .lt. x) then
      z = y
      y = x
      x = z
    end if
end subroutine