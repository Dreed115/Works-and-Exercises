#include "colors.inc"         

camera{
	location<10,10,10>
	look_at<0,0,0>
}
      
light_source{
	<0,100,100>
	White
	parallel
	point_at <0,0,0>
}

#declare a=3.4;	

background {Grey}
                        
#fopen file "Au60.dat" read                       


#declare Mystring = "Au"

#declare Vector = array[100];
#local i = 0;

#while (defined(file)) 
    #local Vector[i] = <0,0,0>;
    #read (file, Mystring, Vector[i])
    sphere { Vector[i], 0.4 pigment{color Red}} 
    #local i = i+1;
    #end 
#fclose file  


#fopen datos "Conexiones.dat" read

#while (defined(datos))
    #read (datos, VectorA, VectorB)
    cylinder{VectorA, VectorB 0.07 pigment{color Green}}
    #end 
 
#fclose datos  
 
    
#fopen datosTriangulos "Triangulos.dat" read
//#fopen OutTriangles "PovRayTriangles.xyz" write
//#write (OutTriangles, )

#while (defined(datosTriangulos))
    #read (datosTriangulos, VectorA, VectorB, VectorC)
    triangle{VectorA, VectorB, VectorC  pigment{color rgbt<0,0,1,0.5>}}
    #end

#fclose datosTriangulos  
       