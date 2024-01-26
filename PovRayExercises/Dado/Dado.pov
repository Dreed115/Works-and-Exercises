#include "colors.inc"   
#include "textures.inc"     
          
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

background {Grey}          
          
#declare factor = 1.0;  
#declare angs = 1.0;            
#declare SineTime = sin(clock*3.1416);               
              
#declare  Pos1 = < 0.000000, 0.000000, 0.371394>;
#declare  Pos2 = < 0.000000, 0.000000, -0.371394>;
            
#declare v1 = < 0.00000, 0.000000, 0.71000>*angs/factor*SineTime;
#declare v1 = < 0.00000, 0.000000, -0.71000>*angs/factor*SineTime;

#declare H2 =
Union{
    sphere{Pos1+v1, RH texture {tH}}
    sphere{Pos2+v2, RH texture {tH}}
    cylinder{Pos1+v1, Pos2+v2, Rcilindro texture {tcil}}
}

object{H2 scale 0.6}            