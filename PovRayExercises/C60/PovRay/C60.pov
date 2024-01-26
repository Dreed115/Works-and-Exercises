#include "colors.inc"         

camera{
	location<0,-20,10>
	look_at<0,0,0>
}
      
light_source{
	<0,-100,100>
	White
	parallel
	point_at <0,0,0>
}

#declare a=3.4;	

background {Grey}
                        
sphere { <0,0,0>, 7 pigment{color Red}}    

// Añadir meridianos
#declare LongitudinalCylinders = 24; // Número de meridianos
#declare LatitudeCylinders = 12; // Número de paralelos

// Agregar meridianos
#declare LongitudinalStep = 360 / LongitudinalCylinders;
#declare i = 0;

#while (i < 360)
    torus{
        7, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
        rotate <0, 0, i>
        pigment { color rgb <0, 0, 1> } // Color azul para los meridianos
    }
    #declare i = i + LongitudinalStep;
#end              

// Agregar paralelos
#declare step = 7/4;
#declare j = 7 ;  
#declare k = 1;
//#declare RadioCirculo = sqrt(7 * 7 - (7 / 9 * j) * (7 / 9 * j))


torus{
     0.5, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }

torus{
     0.5, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*8,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }
  
torus{
     4.7, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }  
  
torus{
     4.7, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*7,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }
 
 torus{
     6.1, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*2,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }  

 torus{
     6.1, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*6,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }  
 
 torus{
     6.8, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*3,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 } 
 
  torus{
     6.8, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*5,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }     
 
  torus{
     7, 0.02 // Altura del cilindro (desde el polo norte hasta el polo sur)
     translate <0,j-step*4,0>
     rotate <90, 0, 0>
     pigment { color rgb <0, 1, 0> } // Color azul para los meridianos
 }    