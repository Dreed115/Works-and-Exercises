!Programa creado el 13/02/2020 por Diego Alejandro Reyes
program ArchivoSuma
	implicit none
    !Declaracion de variables
    real, dimension(4,4):: A,B,C,D
    integer i,j
    !Abrir archivo de impresion
    open(unit=10,file='matriz.txt',status='unknown')
    !Obtencion de datos
    write(*,*)'Este Programa realiza la suma de 3 matrices 4x4'
    do i = 1,4
      do j = 1,4
        write(*,*)'Ingrese el valor',i,j,'  de la matriz A'
        read(*,*)A(i,j)
      end do
    end do
    do i = 1,4
      do j = 1,4
        write(*,*)'Ingrese el valor',i,j,'  de la matriz B'
        read(*,*)B(i,j)
      end do
    end do
    do i = 1,4
      do j = 1,4
        write(*,*)'Ingrese el valor',i,j,'  de la matriz C'
        read(*,*)C(i,j)
      end do
    end do
    !Suma de las matrices
    do i = 1,4
      do j = 1,4
        D(i,j) = A(i,j) + B(i,j) + C(i,j)
      end do
    end do
    !Impresion con formato
    100 format(5X,1F5.1,3X,1F5.1,3X,1F5.1,3X,1F5.1)
    write(10,*)'La matriz suma de:'
    write(10,*)''
    do i = 1,4
      write(10,100)A(i,1),A(i,2),A(i,3),A(i,4)
    end do
    write(10,*)''
    do i = 1,4
      write(10,100)B(i,1),B(i,2),B(i,3),B(i,4)
    end do
    write(10,*)''
    do i = 1,4
      write(10,100)C(i,1),C(i,2),C(i,3),C(i,4)
    end do
    write(10,*)''
    write(10,*)'Es:'
    do i = 1,4
      write(10,100)D(i,1),D(i,2),D(i,3),D(i,4)
    end do
    close(10)
end program