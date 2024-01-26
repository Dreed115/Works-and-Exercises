!Programa hecho el 04/02/2020 por Diego Alejndro Reyes Ramos
program Multiplicar
	implicit none
    !Declaracion de variables
    integer n,m,o,b,c,f,p,i,j
    real g
    real, allocatable, dimension(:,:):: A,D,E
    write(*,*)'Este programa multiplica dos matrices cumpliendo sus condiciones'
    !Obtencion de tamaño de las matrices
    write(*,*)'Cantidad de filas de la matriz A'
    read(*,*) n
    write(*,*)'Cantidad de columnas de la matriz A'
    read(*,*) m
    write(*,*)'Cantidad de filas de la matriz B'
    read(*,*) p
    write(*,*)'Cantidad de columnas de la matriz B'
    read(*,*) o
    do while(m .ne. p)
      write(*,*)'Valor no correspondiente para multiplicar'  
      write(*,*)'Cantidad de filas de la matriz A'
      read(*,*) n
      write(*,*)'Cantidad de columnas de la matriz A'
      read(*,*) m
      write(*,*)'Cantidad de filas de la matriz B'
      read(*,*) p
      write(*,*)'Cantidad de columnas de la matriz B'
      read(*,*) o
    end do
    allocate(A(n,m),D(m,o),E(n,o))
    !Declaracion de los elementos de las matrices
    do b = 1, n
      do c = 1,m
        write(*,*)'Valor del elemento de la matriz A:',b,c
        read(*,*) A(b,c)
      end do
    end do
    do b = 1, m
      do c = 1,o
        write(*,*)'Valor del elemento de la matriz B:',b,c
        read(*,*) D(b,c)
      end do
    end do
    !Asignacion de la matriz resultante
    do b = 1, n
      do c = 1,o
        E(b,c) = 0
      end do
    end do
    !Operaciones e impresion de resultados
    do b = 1, n
      do c = 1, o
        do f = 1, m
          g = A(b,f)*D(f,c) 
          E(b,c) = E(b,c) + g
        end do  
      end do
    end do
    write(*,*)'El resultado es:'
    do i=1,n
      write(*,*) (E(i,j),j=1,o)
    end do
    pause
end program