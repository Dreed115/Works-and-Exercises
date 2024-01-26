!Programa hecho por Diego Alejandro Reyes Ramos el 07/06/2020
program Graficas
    !Declaracion de Variables
	implicit none 
    integer i,j,m,n,k,s,con,s1,h
    real opcion,funcion,num,res,w,x,a1,b1,b2,r,er,b3,r1,e,g,c1,u,v,vol,in,y,b4,dx,u1,v1,b5,b6,a2,b7,r2
    real, allocatable, dimension(:,:):: A
    real, allocatable, dimension(:):: B,C,D,F,F1,F2,F3,F4,F5,F6,F7,F8
    character (LEN=20) op,op1,op2,q1,q2,q3,q4,q11,q31
    !Presentación
	write(*,*)'Bienvenido al programa de analisis grafico'
    write(*,*)'En este se podra realizar diversos calculos de interes para ciertas graficas'
    write(*,*)''
    op = 'si'
    !Programa
    do while(op == 'si' .or. op == 'Si' .or. op == 'SI')
      !Eleccion de accion a realizar
      write(*,*)'Lista de Opciones:'
      write(*,*)'1. Interpolar Polinomios'
      write(*,*)'2. Obtener Raices'
      write(*,*)'3. Obtener Rectas Tangentes'
      write(*,*)'4. Area bajo la curva'
      write(*,*)''
      write(*,*)'Escriba el numero de la accion que quiera realizar: '
      read(*,*) opcion
      do while(opcion .ne. 1 .and. opcion .ne. 2 .and. opcion .ne. 3 .and. opcion .ne. 4)
        write(*,*)''
        write(*,*)'Entrada incorrecta, debe elegir un numero de la lista'
        write(*,*)'Escriba el numero de la accion que quiera realizar: '
        read(*,*) opcion
        write(*,*)''
      end do
      
      !Interpolacion Polinomial
      do while(opcion == 1 .or. op1 == 'si' .or. op1 == 'Si' .or. op1 == 'SI')
        write(*,*)''
        write(*,*)'Interpolacion Polinomial'
        write(*,*)''
        
        !Obtencion de datos
        write(*,*)'Escriba el exponente del polinomio a encontrar: '
		read(*,*) w
        do while(w .le. 0 .or. mod(w,1.0) .ne. 0)
		  write(*,*)''
          write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
          write(*,*)'Escriba el exponente del polinomio a encontrar: '
		  read(*,*) w
          write(*,*)''
        end do
        write(*,*)''
        n = w + 1
        m = w + 1
		allocate(A(m+1,n),B(n),C(n),D(n))
        
        !Obtencion de elementos
        write(*,*)'Escriba los puntos que tiene'
        write(*,*)''
        do i = 1,n
          write(*,*)'Valor en x del punto',i
          read(*,*) D(i)
          write(*,*)''
          write(*,*)'Valor en y del punto',i
          read(*,*) A(n+1,i)
          write(*,*)''
          do j = n,2,-1
            A(j,i) = D(i)**(j-1)
          end do
          A(1,i) = 1
        end do

		!Aplicar metodo de eliminacion
	    do k = 1,n
   	      do i = k,n
            do j = k,n
      	      call ordenar(A(k,i),A(k,j),A,m,n,i,j)
            end do
          end do
	      call uno(A,m,n,k)
          call suma(A,m,n,k)
        end do

        do i =  1,n
          B(i) = A(m+1,i)
        end do 

        !Obtencion de los valores de cada uno
    	do i = n,1,-1
          do j = m,1,-1
            C(j) = B(j)
            B(i) = B(i) - A(j,i)*C(j)
          end do
          B(i) = B(i) + A(i,i)*C(i)
        end do  
        write(*,*)''
	    do i = 1,m
          write(*,*)'El valor del coeficiente del termino', i-1 ,' es' ,B(i)
        end do
	    write(*,*)''
		
		!Evaluacion
        write(*,*)'Quieres evaluar en un punto diferente del polinomio? si/no'
        read(*,*)op2
        write(*,*)''
        do while(op2 .ne. 'Si' .and. op2 .ne. 'si' .and. op2 .ne. 'SI' .and. op2 .ne. 'No' .and. op2 .ne. 'no' .and. op2 .ne. 'NO')
          write(*,*)''
          write(*,*)'Entrada incorrecta debe elegir si/no'
          write(*,*)'Quieres evaluar en un punto diferente del polinomio?'
          read(*,*) op2
          write(*,*)''
        end do
        do while(op2 == 'si' .or. op2 == 'Si' .or. op2 == 'SI')
          write(*,*)'Numero a evaluar: '
          read(*,*) num
          call evaluar(B,n,num,res)
          write(*,*)''
          write(*,*)'El resultado en el punto evaluado es: ',res
          write(*,*)''
          write(*,*)'Quieres evaluar en un punto diferente del polinomio? si/no'
          read(*,*)op2
          write(*,*)''
          do while(op2.ne.'Si'.and.op2.ne.'si'.and.op2.ne.'SI'.and.op2.ne.'No'.and.op2.ne.'no'.and.op2.ne.'NO')
            write(*,*)''
            write(*,*)'Entrada incorrecta debe elegir si/no'
            write(*,*)'Quieres evaluar en un punto diferente del polinomio?'
            read(*,*) op2
            write(*,*)''
          end do
        end do

        !Repeticion
		opcion = 0
        write(*,*)''
        write(*,*)'Quiere realizar otro calculo de este apartado? si/no'
        read(*,*) op1
        do while(op1 .ne. 'Si' .and. op1 .ne. 'si' .and. op1 .ne. 'SI' .and. op1 .ne. 'No' .and. op1 .ne. 'no' .and. op1 .ne. 'NO')
          write(*,*)''
          write(*,*)'Entrada incorrecta debe elegir si/no'
          write(*,*)'Quiere realizar otro calculo? si/no'
          read(*,*) op
          write(*,*)''
        end do
      end do
      
      !Obtener Raices
      do while(opcion == 2 .or. op1 == 'si' .or. op1 == 'Si' .or. op1 == 'SI')
		write(*,*)''
        write(*,*)'Obtencion de Raices'
        write(*,*)''
        write(*,*)'Que tipo de funcion es la que tiene? Escriba el numero de la opcion'
        write(*,*)'1. Polinomial'
        write(*,*)'2. Racional'
        write(*,*)'3. Exponencial'
        write(*,*)'4. Logarimica'
        write(*,*)''
		read(*,*) funcion
        write(*,*)''
        do while(funcion .ne. 1 .and. funcion .ne. 2 .and. funcion .ne. 3 .and. funcion .ne. 4)
          write(*,*)''
          write(*,*)'Entrada incorrecta, debe elegir un numero de la lista'
          write(*,*)'Escriba el numero de la funcion que tiene: '
          read(*,*) funcion
          write(*,*)''
        end do
        
		!Polinomios
        if (funcion == 1)then
          !Ingresar valores
          write(*,*)'Ingrese el exponente maximo de la funcion'
          read(*,*)x
          write(*,*)''
          do while(x .le. 0 .or. mod(x,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente del polinomio a encontrar: '
		    read(*,*) x
            write(*,*)''
          end do
		  s = int(x)	
          allocate(F(s+1))
          
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente: ',i-1
            read(*,*) F(i)
            write(*,*)''
          end do
          		  
		  r1 = 1
          !Obtencion de raices
          do i = -10,10
            a1 = real(i)
            er = 1
            con = 1
		    do while(er > 0.01) 
              call funcionP(F,s,a1,b1)
              if (abs(b1) > 200)then
                if(a1>0)then
				  a1 = a1-2
                else
                  a1 = a1+2
                end if
                call funcionP(F,s,a1,b1)
              end if
              call funcionP(F,s,a1+b1,b2)
              call Steffensen(a1,b1,b2,r)
              call error(a1,r,er)
              con = con + 1
              if (er > 0.01)then
                a1 = r
              end if
              if (b1 == 0)then
                r = a1
                er = 0
              end if
              if (con == 500)then
                er = 0
                r = r1
              end if
            end do
            call funcionP(F,s,r,r2)
     		if(abs(r-r1) > 0.01 .and. abs(r2) < 0.001 )then
              write(*,*)'Raiz: ',r
            end if
            r1 = r
          end do
          funcion = 0
        end if
        
        !Racionales
        if (funcion == 2)then
          !Ingresar valores
          write(*,*)'Ingrese el exponente maximo en el numerador'
          read(*,*)x
          write(*,*)''
          write(*,*)'Ingrese el exponente maximo en el denominador'
          read(*,*)y
          write(*,*)''
          do while(x .lt. 0 .or. mod(x,1.0) .ne. 0 .or. y .lt. 0 .or. mod(y,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'algun valor es incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente maximo en el numerador: '
		    read(*,*) x
            write(*,*)''
            write(*,*)'Ingrese el exponente maximo en el denominador'
            read(*,*)y
            write(*,*)''
          end do
		  s = int(x)
          s1 = int(y)	
          allocate(F1(s+1),F2(s1+1))
          
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente del numerador: ',i-1
            read(*,*) F1(i)
            write(*,*)''
          end do

          do i = 1,s1+1
            write(*,*)'Coeficiente del exponente del denomiador: ',i-1
            read(*,*) F2(i)
            write(*,*)''
          end do
          		  
		  r1 = 1
          !Obtencion de raices
          do i = -10,10
            a1 = real(i)
            er = 1
            con = 1
		    do while(er > 0.01) 
              call funcionP(F1,s,a1,b1)
              call funcionP(F2,s1,a1,b4)
              if(b4 == 0)then
                b4 = 0.00001
              end if
              if (abs(b1/b4) > 200)then
                if(a1>0)then
				  a1 = a1-2
                else
                  a1 = a1+2
                end if
                call funcionP(F1,s,a1,b1)
                call funcionP(F2,s1,a1,b4)
              end if
              call funcionP(F1,s,a1+(b1/b4),b2)
              call funcionP(F2,s1,a1+(b1/b4),b3)
              if (b3 == 0)then
                b3 = 0.00001
              end if
              call Steffensen(a1,(b1/b4),(b2/b3),r)
              call error(a1,r,er)
              con = con + 1
              if (er > 0.01)then
                a1 = r
              end if
              if (b1/b4 == 0)then
                r = a1
                er = 0
              end if
              if (con == 500)then
                er = 0
                r = r1
              end if
            end do
     		call funcionP(F1,s,r,r2)
     		if(abs(r-r1) > 0.01 .and. abs(r2) < 0.001 )then
              write(*,*)'Raiz: ',r
            end if
            r1 = r
          end do
          
		  if(F2(1) == 0)then
            write(*,*)'La funcion no tiene raices'
          end if

          if(F2(1) .ne. 0 .and. F1(1) == 0)then
            write(*,*)'Raiz:  0'
          end if

        end if

        !Exponencial
        if (funcion == 3)then
          !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(c^(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
		
		  r1 = 1	
          if(b4 .ne. 0 .and. b1 > 0)then
            h = (-b4/b3)
          else if ( b1 < 0 .and. b4 .ne. 0)then
          	h = 1-b4
          end if
          !Obtencion de raices
            a1 = h
            er = 1
            con = 1
		    do while(er > 0.01) 
              call funcionE(a2,b1,b2,b3,b4,a1,b5)
              if (abs(b5) > 200)then
                if(a1>0)then
				  a1 = a1-2
                else
                  a1 = a1+2
                end if
                call funcionE(a2,b1,b2,b3,b4,a1,b5)
              end if
              if(b5 > 20)then
				b5 = 0.0001
              end if
              call funcionE(a2,b1,b2,b3,b4,a1+b5,b6)
              call Steffensen(a1,b5,b6,r)
              call error(a1,r,er)
              con = con + 1
              if (er > 0.01)then
                a1 = r
              end if
              if (b5 == 0)then
                r = a1
                er = 0
              end if
              if (con == 500)then
                er = 0
                r = r1
              end if
            end do
     		if(abs(r-r1) > 0.01)then
              write(*,*)'Raiz: ',r
            end if
            r1 = r
          funcion = 0

          if(a2 .ge. 0 .and. b1 .gt. 0)then
            write(*,*)'No se tienen raices'
          end if

          if(a2 .le. 0 .and. b1 .lt. 0)then
            write(*,*)'No se tienen raices'
          end if
        end if

		!Logarimos
        if (funcion == 4)then
          !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(logc(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
          		  

          if(b4 .ne. 0 .and. b1 > 0)then
            h = (-b4/b3)+0.001
          else if(b1 > 0 .and. b4 == 0)then
            h = 1
          else if (a2 < 0 .and. b1 < 0 .and. b4 == 0)then
          	h = 1
          else if (a2 >= 0 .and. b1 < 0 .and. b4 .ne. 0)then
          	h = 1-b4
          else if (a2 >= 0 .and. b1 < 0 .and. b4 == 0)then
          	h = 1-b4
          else if(a2 < 0 .and. b1 < 0 .and. b4 .ne. 0)then
            h = (-b4/b3)
          end if
          !Obtencion de raices
           
            a1 = h
            er = 1
            con = 1
		    do while(er > 0.01) 
              if(a1 < (-h))then
                a1 = -h+0.05
              end if
              call funcionL(a2,b1,b2,b3,b4,a1,b5)
              if (abs(b5) > 200)then
                if(a1>0)then
				  a1 = a1-2
                else
                  a1 = a1+2
                end if
                call funcionL(a2,b1,b2,b3,b4,a1,b5)
              end if
              call funcionL(a2,b1,b2,b3,b4,a1+b5,b6)
              call Steffensen(a1,b5,b6,r)
              call error(a1,r,er)
              con = con + 1
              if(r < (-b4/b3))then
                a1 = -b4/b3+0.05
              end if
              if (er > 0.01)then
                a1 = r
              end if
              if (b5 == 0)then
                r = a1
                er = 0
              end if
              if (con == 500)then
                er = 0
                r = r1
              end if
            end do
            write(*,*)'Raiz: ',r

          
          funcion = 0
        end if
        
		opcion = 0
        write(*,*)''
        write(*,*)'Quiere realizar otro calculo de este apartado? si/no'
        read(*,*) op1
        do while(op1 .ne. 'Si' .and. op1 .ne. 'si' .and. op1 .ne. 'SI' .and. op1 .ne. 'No' .and. op1 .ne. 'no' .and. op1 .ne. 'NO')
          write(*,*)''
          write(*,*)'Entrada incorrecta debe elegir si/no'
          write(*,*)'Quiere realizar otro calculo? si/no'
          read(*,*) op
          write(*,*)''
        end do
      end do
      
      !Obtener Recta Tangente
      do while(opcion == 3 .or. op1 == 'si' .or. op1 == 'Si' .or. op1 == 'SI')
		write(*,*)''
        write(*,*)'Obtencion de Recta Tangente'
        write(*,*)''
        write(*,*)'Que tipo de funcion es la que tiene?'
        write(*,*)'1. Polinomial'
        write(*,*)'2. Racional'
        write(*,*)'3. Exponencial'
        write(*,*)'4. Logarimica'
        write(*,*)''
		read(*,*) funcion
        write(*,*)''
        100 format (4X,A3,1F8.2,A3,1F8.2,A5,1F8.2,A2)
        q1 = 'y -'
        q11 = 'y +'
        q2 = ' ='
        q3 = ' (x -'
        q31 = ' (x +'
        q4 = ')'
        do while(funcion .ne. 1 .and. funcion .ne. 2 .and. funcion .ne. 3 .and. funcion .ne. 4)
          write(*,*)''
          write(*,*)'Entrada incorrecta, debe elegir un numero de la lista'
          write(*,*)'Escriba el numero de la funcion que tiene: '
          read(*,*) funcion
          write(*,*)''
        end do
        
        !Polinomio
        if (funcion == 1)then
          !Obtencion de datos
          write(*,*)'Ingrese el exponente maximo de la funcion'
          read(*,*)x
          write(*,*)''
          do while(x .le. 0 .or. mod(x,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente del polinomio a encontrar: '
		    read(*,*) x
            write(*,*)''
          end do
		  s = int(x)	
          allocate(F3(s+1))
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente: ',i-1
            read(*,*) F3(i)
            write(*,*)''
          end do
          !Punto a aplicar
		  write(*,*)'Ingrese el valor en x en el cual desee conocer la recta'
          read(*,*)a1
		  !Evaluacion
          call derivadaP(F3,s,a1,b1)
          call funcionP(F3,s,a1,b2)
          
          !Impresion
          if(b2 > 0 .and. a1 >= 0)then
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b2,q2,b1,q3,a1,q4
          end if
          if(b2 < 0 .and. a1 >= 0)then
            b2 = abs(b2)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b2,q2,b1,q3,a1,q4
          end if
          if(b2 > 0 .and. a1 < 0)then
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b2,q2,b1,q31,a1,q4
          end if
          if(b2 < 0 .and. a1 < 0)then
            b2 = abs(b2)
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b2,q2,b1,q31,a1,q4
          end if
        end if
		
		!Racional
        if (funcion == 2)then
          !Obtencion de datos
          write(*,*)'Ingrese el exponente maximo en el numerador'
          read(*,*)x
          write(*,*)''
          write(*,*)'Ingrese el exponente maximo en el denominador'
          read(*,*)y
          write(*,*)''
          do while(x .lt. 0 .or. mod(x,1.0) .ne. 0 .or. y .lt. 0 .or. mod(y,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'algun valor es incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente maximo en el numerador: '
		    read(*,*) x
            write(*,*)''
            write(*,*)'Ingrese el exponente maximo en el denominador'
            read(*,*)y
            write(*,*)''
          end do
		  s = int(x)
          s1 = int(y)	
          allocate(F4(s+1),F5(s1+1))
          
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente del numerador: ',i-1
            read(*,*) F4(i)
            write(*,*)''
          end do

          do i = 1,s1+1
            write(*,*)'Coeficiente del exponente del denomiador: ',i-1
            read(*,*) F5(i)
            write(*,*)''
          end do
          
          !Punto a aplicar
		  write(*,*)'Ingrese el valor en x en el cual desee conocer la recta'
          read(*,*)a1
		  !Evaluacion
          call derivadaP(F4,s,a1,b1)
          call derivadaP(F5,s1,a1,b4)
          call funcionP(F4,s,a1,b2)
          call funcionP(F5,s1,a1,b3)
		  dx = (-b2*b4 + b3*b1)/b3**2
          
          !Impresion
          if(b3 == 0)then
            write(*,*)'No hay recta tangente en ese punto'
          else if(b2/b3 > 0 .and. a1 >= 0)then
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b2/b3,q2,dx,q3,a1,q4
          else if(b2/b3 < 0 .and. a1 >= 0)then
            b2 = abs(b2/b3)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b2,q2,dx,q3,a1,q4
          else if(b2/b3 > 0 .and. a1 < 0)then
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b2/b3,q2,dx,q31,a1,q4
          else if(b2/b3 < 0 .and. a1 < 0)then
            b2 = abs(b2/b3)
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b2,q2,dx,q31,a1,q4
          end if
        end if

        !Exponencial
        if(funcion == 3)then
          !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(c^(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
          
          !Punto a aplicar
		  write(*,*)'Ingrese el valor en x en el cual desee conocer la recta'
          read(*,*)a1
		  !Evaluacion
          call funcionE(a2,b1,b2,b3,b4,a1,b5)
          call derivadaE(b1,b2,b3,b4,a1,b6)
          
          !Impresion
          if(b5 > 0 .and. a1 >= 0)then
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b5,q2,b6,q3,a1,q4
          end if
          if(b5 < 0 .and. a1 >= 0)then
            b5 = abs(b5)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b5,q2,b6,q3,a1,q4
          end if
          if(b5 > 0 .and. a1 < 0)then
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b5,q2,b6,q31,a1,q4
          end if
          if(b5 < 0 .and. a1 < 0)then
            b5 = abs(b5)
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b5,q2,b6,q31,a1,q4
          end if
          funcion = 0
        end if

        !Logaritmo
        if(funcion == 4)then
          !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(logc(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
          

		  h = -b4/b3
          !Punto a aplicar
		  write(*,*)'Ingrese el valor en x en el cual desee conocer la recta'
          read(*,*)a1
          write(*,*)''
          do while(a1 <= h)
            write(*,*)''
            write(*,*)'Error en este valor la recta la funcion no esta definida'
            write(*,*)'Ingrese el valor en x en el cual desee conocer la recta'
            read(*,*)a1
          end do
		  !Evaluacion
          call funcionL(a2,b1,b2,b3,b4,a1,b5)
          call derivadaL(b1,b2,b3,b4,a1,b6)
          
          !Impresion
          if(b5 > 0 .and. a1 >= 0)then
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b5,q2,b6,q3,a1,q4
          end if
          if(b5 < 0 .and. a1 >= 0)then
            b5 = abs(b5)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b5,q2,b6,q3,a1,q4
          end if
          if(b5 > 0 .and. a1 < 0)then
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q1,b5,q2,b6,q31,a1,q4
          end if
          if(b5 < 0 .and. a1 < 0)then
            b5 = abs(b5)
            a1 = abs(a1)
		    write(*,*)'La ecuacion de la recta tangente es: '
            write(*,100)q11,b5,q2,b6,q31,a1,q4
          end if
          funcion = 0
        end if  
		opcion = 0
        write(*,*)''
        write(*,*)'Quiere realizar otro calculo de este apartado? si/no'
        read(*,*) op1
        do while(op1 .ne. 'Si' .and. op1 .ne. 'si' .and. op1 .ne. 'SI' .and. op1 .ne. 'No' .and. op1 .ne. 'no' .and. op1 .ne. 'NO')
          write(*,*)''
          write(*,*)'Entrada incorrecta debe elegir si/no'
          write(*,*)'Quiere realizar otro calculo? si/no'
          read(*,*) op
          write(*,*)''
        end do
      end do
      
      !Obtener Area bajo la curva
      do while(opcion == 4 .or. op1 == 'si' .or. op1 == 'Si' .or. op1 == 'SI')
		write(*,*)''
        write(*,*)'Obtencion de Area Bajo la Curva'
        write(*,*)''
        write(*,*)'Que tipo de funcion es la que tiene?'
        write(*,*)'1. Polinomial'
        write(*,*)'2. Racional'
        write(*,*)'3. Exponencial'
        write(*,*)'4. Logarimica'
        write(*,*)''
		read(*,*) funcion
        write(*,*)''
        do while(funcion .ne. 1 .and. funcion .ne. 2 .and. funcion .ne. 3 .and. funcion .ne. 4)
          write(*,*)''
          write(*,*)'Entrada incorrecta, debe elegir un numero de la lista'
          write(*,*)'Escriba el numero de la funcion que tiene: '
          read(*,*) funcion
          write(*,*)''
        end do
		
		!Polinomio
        if(funcion == 1)then
		  write(*,*)'Ingrese el exponente maximo de la funcion'
          read(*,*)x
          write(*,*)''
          do while(x .le. 0 .or. mod(x,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente del polinomio a encontrar: '
		    read(*,*) x
            write(*,*)''
          end do
		  s = int(x)	
          allocate(F6(s+1))
          
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente: ',i-1
            read(*,*) F6(i)
            write(*,*)''
          end do

          write(*,*)'Limite izquierdo: '
          read(*,*) a1
          write(*,*)
          write(*,*)'Limite derecho: '
          read(*,*) b1
          con = 0
          call funcionP(F6,s,a1,b2)
          call funcionP(F6,s,b1,r)
          er = 2
          vol = 100
          do while(abs(er) > 0.0001)
            con = con + 2
    	    e = 0
            g = 0
    	    c1 = ((b1-a1)/con)
		    do i = 1,con-1,2
            	call funcionP(F6,s,a1+c1*(i),u)
      		    e = e + abs(u)
    	    end do
            do i = 2,con-2,2
        	    call funcionP(F6,s,a1+c1*i,v)
                g = g + abs(v)
            end do
    	    in = (b1-a1)*(b2+4*e+2*g+r)/(3*con)
    	    call error(vol,in,er)
            vol = in
          end do
          write(*,*)''
          write(*,*)'El area de la region limitada es: ',in
		end if
          
		!Racional
		if(funcion == 2)then
		  !Obtencion de datos
          write(*,*)'Ingrese el exponente maximo en el numerador'
          read(*,*)x
          write(*,*)''
          write(*,*)'Ingrese el exponente maximo en el denominador'
          read(*,*)y
          write(*,*)''
          do while(x .lt. 0 .or. mod(x,1.0) .ne. 0 .or. y .lt. 0 .or. mod(y,1.0) .ne. 0)
		    write(*,*)''
            write(*,*)'algun valor es incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Escriba el exponente maximo en el numerador: '
		    read(*,*) x
            write(*,*)''
            write(*,*)'Ingrese el exponente maximo en el denominador'
            read(*,*)y
            write(*,*)''
          end do
		  s = int(x)
          s1 = int(y)	
          allocate(F7(s+1),F8(s1+1))
          
          do i = 1,s+1
            write(*,*)'Coeficiente del exponente del numerador: ',i-1
            read(*,*) F7(i)
            write(*,*)''
          end do

          do i = 1,s1+1
            write(*,*)'Coeficiente del exponente del denomiador: ',i-1
            read(*,*) F8(i)
            write(*,*)''
          end do

          write(*,*)'Limite izquierdo: '
          read(*,*) a1
          write(*,*)
          write(*,*)'Limite derecho: '
          read(*,*) b1
          con = 0
          call funcionP(F7,s,a1,b2)
          call funcionP(F8,s1,a1,b3)
          call funcionP(F7,s,b1,r)
          call funcionP(F8,s1,b1,r1)
          er = 2
          vol = 100
          do while(abs(er) > 0.0001)
            con = con + 2
    	    e = 0
            g = 0
    	    c1 = ((b1-a1)/con)
		    do i = 1,con-1,2
            	call funcionP(F7,s,a1+c1*(i),u)
                call funcionP(F8,s1,a1+c1*(i),u1)
      		    e = e + abs(u/u1)
    	    end do
            do i = 2,con-2,2
        	    call funcionP(F7,s,a1+c1*i,v)
                call funcionP(F8,s1,a1+c1*i,v1)
                g = g + abs(v/v1)
            end do
    	    in = (b1-a1)*((b2/b3)+4*e+2*g+(r/r1))/(3*con)
    	    call error(vol,in,er)
            vol = in
            if(con > 500)then
              write(*,*)
              write(*,*)'La funcion no esta definida en el intervalo'
              er = 0
            end if
          end do
          write(*,*)''
          if(con < 500)then
            write(*,*)'El area de la region limitada es: ',in
          end if
		end if

        !Exponencial
        if(funcion == 3)then
		  !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(c^(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do

          write(*,*)'Limite izquierdo: '
          read(*,*) a1
          write(*,*)
          write(*,*)'Limite derecho: '
          read(*,*) b7
          con = 0
          call funcionE(a2,b1,b2,b3,b4,a1,b5)
          call funcionE(a2,b1,b2,b3,b4,b7,b6)
          er = 2
          vol = 100
          do while(abs(er) > 0.0001)
            con = con + 2
    	    e = 0
            g = 0
    	    c1 = ((b7-a1)/con)
		    do i = 1,con-1,2
            	call funcionE(a2,b1,b2,b3,b4,a1+c1*(i),u)
      		    e = e + abs(u)
    	    end do
            do i = 2,con-2,2
        	    call funcionE(a2,b1,b2,b3,b4,a1+c1*i,v)
                g = g + abs(v)
            end do
    	    in = (b7-a1)*(b5+4*e+2*g+b6)/(3*con)
    	    call error(vol,in,er)
            vol = in
          end do
          write(*,*)''
          write(*,*)'El area de la region limitada es: ',in
		end if

        !Logarimica
        if(funcion == 4)then
		   !Ingresar valores
          write(*,*)'Ingrese los coeficientes, de acuerdo a la siguente forma:  '
          write(*,*)'   a + b(logc(dx + e))   '
          write(*,*)''
          write(*,*)'Valor para a'
          read(*,*)a2
          write(*,*)''
          write(*,*)'Valor para b'
          read(*,*)b1
          write(*,*)''
          write(*,*)'Valor para c'
          read(*,*)b2
          write(*,*)''
          do while(b2 .le. 0 .or. b2 == 1)
		    write(*,*)''
            write(*,*)'Valor incorrecto, el exponente debe ser entero y positivo'
            write(*,*)'Valor para c'
            read(*,*)b2
            write(*,*)''
          end do
          write(*,*)'Valor para d'
          read(*,*)b3
          write(*,*)''
          write(*,*)'Valor para e'
          read(*,*)b4
          write(*,*)''
          
		  h = -b4/b3

          write(*,*)'Limite izquierdo: '
          read(*,*) a1
          write(*,*)''
          write(*,*)'Limite derecho: '
          read(*,*) b7
          write(*,*)''
          do while(a1 <= h .or. b7 <= h)
            write(*,*)''
            write(*,*)'Error, la funcion no esta definida en ese intervalo'
            write(*,*)'Limite izquierdo: '
            read(*,*) a1
            write(*,*)''
            write(*,*)'Limite derecho: '
            read(*,*) b7
            write(*,*)''
          end do
          con = 0
          call funcionL(a2,b1,b2,b3,b4,a1,b5)
          call funcionL(a2,b1,b2,b3,b4,b7,b6)
          er = 2
          vol = 100
          do while(abs(er) > 0.0001)
            con = con + 2
    	    e = 0
            g = 0
    	    c1 = ((b7-a1)/con)
		    do i = 1,con-1,2
            	call funcionL(a2,b1,b2,b3,b4,a1+c1*(i),u)
      		    e = e + abs(u)
    	    end do
            do i = 2,con-2,2
        	    call funcionL(a2,b1,b2,b3,b4,a1+c1*i,v)
                g = g + abs(v)
            end do
    	    in = (b7-a1)*(b5+4*e+2*g+b6)/(3*con)
    	    call error(vol,in,er)
            vol = in
          end do
          write(*,*)''
          write(*,*)'El area de la region limitada es: ',in
		end if

		opcion = 0
        write(*,*)''
        write(*,*)'Quiere realizar otro calculo de este apartado? si/no'
        read(*,*) op1
        do while(op1 .ne. 'Si' .and. op1 .ne. 'si' .and. op1 .ne. 'SI' .and. op1 .ne. 'No' .and. op1 .ne. 'no' .and. op1 .ne. 'NO')
          write(*,*)''
          write(*,*)'Entrada incorrecta debe elegir si/no'
          write(*,*)'Quiere realizar otro calculo? si/no'
          read(*,*) op
          write(*,*)''
        end do
      end do

      write(*,*)''
      write(*,*)'Quiere realizar otro calculo en un apartado diferente? si/no'
      read(*,*) op
      do while(op .ne. 'Si' .and. op .ne. 'si' .and. op .ne. 'SI' .and. op .ne. 'No' .and. op .ne. 'no' .and. op .ne. 'NO')
        write(*,*)''
        write(*,*)'Entrada incorrecta debe elegir si/no'
        write(*,*)'Quiere realizar otro calculo en un apartado diferente? si/no'
        read(*,*) op
        write(*,*)''
      end do
    end do
 end program

!Subrutina para ordenar
subroutine ordenar(w,e,X,m,n,k,l)
	integer j,k,l,m,n
    real w,e
	real, dimension(m+1,n):: X
    real, dimension(m+1):: Z
    if(abs(w).gt.abs(e)) then
      do j = 1,m+1
		Z(j) = X(j,k)
      end do
      do j = 1,m+1
		X(j,k) = X(j,l)
      end do
      do j = 1,m+1
		X(j,l) = Z(j)
      end do
    end if
end subroutine

!subrutina para convertir a uno
subroutine uno(X,m,n,k)
    integer k,m,n
    real a
	real,dimension(m+1,n)::X
    a = X(k,k)
    do i = k,m+1
      X(i,k) = X(i,k)/a
    end do
end subroutine

!subrutina para sumar elementos	
subroutine suma(X,m,n,k)
	integer m,n,k
    real b
    real, dimension(m+1,n)::X
    do i = k+1,n
      b = -X(k,i)
      do j = k,m+1 
      	X(j,i) = X(j,i)+b*X(j,k)
      end do
    end do
end subroutine

!subroutina para evaluar
subroutine evaluar(X,n,a,b)
	integer n,i
    real a,b
    real, dimension(n)::X
    b = 0
    if(a == 0)then
      b = X(n)
    end if
    if(a /= 0)then
      do i = 1,n
        b = b + X(i)*a**(i-1)
      end do
    end if
end subroutine
  
!subrutina para evaluar polinomios  
subroutine funcionP(E,c,x,f)
	integer c,i
    real x,f,b
    real, dimension(c+1)::E
    f = 0
    if(x == 0)then
      f = E(1)
    end if
    if (x /= 0)then
	  do i = 1,c+1
      	b = E(i)*x**(i-1)
    	f = f + b
      end do
    end if
end subroutine

!Subrrutina para raices
subroutine Steffensen(a,b,c,d)
	real a,b,c,e
    e = c-b
    if((c-b)== 0)then
      e = 0.0001
    end if
    d = a - (((b)**2)/(e))
end subroutine

!Subrutina para errores
subroutine error(a,b,e)
	real a,b,e
    if(a == 0)then
      a = 0.0001
    end if
    e = abs((a-b)/a)*100
    return
end subroutine

!Subrutina Derivada
subroutine derivadaP(E,c,x,f)
	integer i,c
    real x,b
    real, dimension(c+1)::E
    f = 0
	do i = 2,c+1
      	b = (i-1)*E(i)*x**(i-2)
    	f = f + b
    end do
end subroutine

!Subrutina evaluar exponencial
subroutine funcionE(a,b,c,d,e,x,f)
	real a,b,c,d,e,x,f
    f = a +(b*(c**(d*x + e)))
end subroutine

!Subrutina para derivar exponencial
subroutine derivadaE(b,c,d,e,x,f)
	real b,e,c,d,f
    f = b*(c**(d*x+e))*log(c)*(d)
end subroutine

!Subrutina evaluar logarimo
subroutine funcionL(a,b,c,d,e,x,f)
	real a,b,c,d,e,x,f,g
    if(d*x+e <= 0)then
		g = 0.0001
    else
      g = log(d*x+e)
    end if
    f = a + (b*g)/log(c)
end subroutine

!subrutina para derivar logaritmos
subroutine derivadaL(b,c,d,e,x,f)
	real b,c,d,e,f,x
    f = (b)/((d*x+e)*log(c))    
end subroutine