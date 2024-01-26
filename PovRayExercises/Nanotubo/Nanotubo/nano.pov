#include "colors.inc"         

camera{
	location<0,30,40>
	look_at<0,-60,-40>
}
      
light_source{
	<100,100,100>
	White
	parallel
	point_at <0,0,0>
}

#declare a=3.4;	

background {Grey}
                        
#fopen file "nano.dat" read                       


#declare Mystring = "C"


#while (defined(file)) 
    #read (file, Vector)
    sphere { Vector, 0.4 pigment{color Red}} 
    #end 
#fclose file  


#fopen datos "NanoConexion.dat" read

#while (defined(datos))
    #read (datos, VectorA, VectorB)
    cylinder{VectorA, VectorB 0.07 pigment{color Green}}
    #end 
 
#fclose datos  
 
 
       