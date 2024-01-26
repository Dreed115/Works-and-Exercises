program nada
	implicit none
    real a,b,f
    a = 4
    b = f(a)
    write(*,*)b
end program

real function f(x)
	integer i,j
    j=1
    do i = 1,x
      j = j*i
    end do
    f = j
end function