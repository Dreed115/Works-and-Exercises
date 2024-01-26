#include "colors.inc"
#include "textures.inc" 
#include "rand.inc"  
#include "debug.inc"

camera{
	location<0,0,15>
	look_at<0,0,0>
}
      
light_source{
	<0,0,100>
	White
	parallel
	point_at <0,0,0>
}	

background {Grey}

#declare Pos = array[20]; 

#declare a = 5;
#declare b = 0.6180339887498948;
#declare c = 0.08;

#declare Pos[0] = (a/2)*<-b,1/b,0>;
#declare Pos[1] = (a/2)*<b,1/b,0>;
#declare Pos[2] = (a/2)*<b,-1/b,0>;
#declare Pos[3] = (a/2)*<-b,-1/b,0>;
#declare Pos[4] = (a/2)*<0,b,1/b>;
#declare Pos[5] = (a/2)*<0,-b,1/b>;
#declare Pos[6] = (a/2)*<0,b,-1/b>;
#declare Pos[7] = (a/2)*<0,-b,-1/b>;
#declare Pos[8] = (a/2)*<1/b,0,b>;
#declare Pos[9] = (a/2)*<1/b,0,-b>;
#declare Pos[10] = (a/2)*<-1/b,0,b>;
#declare Pos[11] = (a/2)*<-1/b,0,-b>; 
#declare Pos[12] = (a/2)*<1,1,1>;
#declare Pos[13] = (a/2)*<-1,1,1>;
#declare Pos[14] = (a/2)*<1,-1,1>;
#declare Pos[15] = (a/2)*<-1,-1,1>;
#declare Pos[16] = (a/2)*<1,1,-1>;
#declare Pos[17] = (a/2)*<1,-1,-1>;
#declare Pos[18] = (a/2)*<-1,1,-1>;
#declare Pos[19] = (a/2)*<-1,-1,-1>;
                           
               
                                                          
#declare i = 0;            
            
#while(i<20)    
    sphere { Pos[i], 0.4 pigment{color Red}}  
    #local i = i+1;
#end

   
#fopen datos "Dodecaedro.dat" read

#while (defined(datos))
    #read (datos, VectorA, VectorB)
    cylinder{VectorA, VectorB 0.07 pigment{color Green}}
    #end 
 
#fclose datos 

cylinder {Pos[12] , Pos[13] c pigment{color Blue}} 
cylinder {Pos[13] , Pos[15] c pigment{color Blue}} 
cylinder {Pos[15] , Pos[14] c pigment{color Blue}} 
cylinder {Pos[14] , Pos[12] c pigment{color Blue}} 
cylinder {Pos[16] , Pos[17] c pigment{color Blue}} 
cylinder {Pos[17] , Pos[19] c pigment{color Blue}} 
cylinder {Pos[19] , Pos[18] c pigment{color Blue}} 
cylinder {Pos[18] , Pos[16] c pigment{color Blue}}

cylinder {Pos[13] , Pos[18] c pigment{color Blue}}
cylinder {Pos[12] , Pos[16] c pigment{color Blue}}
cylinder {Pos[15] , Pos[19] c pigment{color Blue}}
cylinder {Pos[14] , Pos[17] c pigment{color Blue}}