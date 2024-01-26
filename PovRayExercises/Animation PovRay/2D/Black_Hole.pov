#version 3.7;                      
#include "colors.inc"
#include "textures.inc"

global_settings {  assumed_gamma 1.0 }

//---------------------------------------
camera{ ultra_wide_angle
        angle 75
        right x*image_width/image_height
        location  <0.0 , 0.0 ,10>
        look_at   <0.0 , 0.0 , 0.0> }
//---------------------------------------
light_source{ <1500,2500,2500>
              color rgb<1,1,1> }
//---------------------------------------
sky_sphere{ pigment{color rgb<1,1,1>}}
//---------------------------------------


// Black Hole
sphere{ <0,0,0>, 1
        texture { pigment{ rgb<0,0,0> }
                  finish { diffuse 0.7
                           phong 1}
                } // end of texture
        translate < 0, 0, 0>
       } 
//----------------------------------- end        


// Ejes de simetria
#macro Axis_( AxisLen, RedTexture,WhiteTexture)
union{
    cylinder {<0,-AxisLen,0>,<0,AxisLen,0>,0.05
              texture{checker texture{RedTexture} texture{WhiteTexture}
                      translate<0.1,0,0.1>}}
     } // end of union "Axis"                  
#end // of macro Axis (AxisLen)
//-------------------------------------- 

 
#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ, TexRed, TexWhite)
//--------------------- 3 Achsen zeichnen -----------------------------
union{
object{Axis_(AxisLenX, TexRed, TexWhite)   rotate< 0,0,-90>}   // x-Axis
object{Axis_(AxisLenY, TexRed, TexWhite)   rotate< 0,0,  0>}   // y-Axis  
//object{Axis_(AxisLenZ, TexRed, TexWhite)   rotate<90,0,  0>}

//--------------------- Achsenbezeichnungen ---------------------------
} // end of union
#end// of macro "AxisXYZ(...)"
//---------------------------------------------------------------------- 



//Malla del sistema coordenado
//--------------------------drawing the axis ---- Achsen zeichnen ------
#declare Tex_Dark = texture{ pigment{ color rgb<1,0.45,0>}
                             finish { phong 1}}
#declare Tex_White =texture{ pigment{ color rgb<1,1,1>}
                             finish { phong 1}}

object{ AxisXYZ( 100, 100, 100, Tex_Dark, Tex_White)}
//--------------------------end of coordinates ---- Ende der Koordinaten 
 

// background ---------------------------------------------------<<<< Raster macro
//----------------------------------------------------------------
#macro Raster(RScale, HLine) 
       pigment{ gradient x scale RScale
                color_map{[0.000   color rgbt<1,1,1,0>*0.4]
                          [0+HLine color rgbt<1,1,1,0>*0.4]
                          [0+HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,0>*0.4]
                          [1.000   color rgbt<1,1,1,0>*0.4]} }
       finish {ambient 0.1 diffuse 0.9}
 #end// of Raster(RScale, HLine)-macro    
//-----------------------------------------------------------------<<< Grid macro
#macro Grid (RasterScale, RasterHalfLine, Background_pigment)
 plane{<0,1,0>, 0      // uses layerd textures!!!!
       texture{Background_pigment  finish { phong 0.1}}
       texture{Raster( RasterScale, RasterHalfLine) rotate<0,0,0> }
       texture{Raster( RasterScale, RasterHalfLine) rotate<0,90,0>}
      scale 1}
#end // end of macro  Grid (RasterScale, RasterHalfLine, Background_Texture)
//---------------------------------------------------------------------------

object{ Grid ( 1, 0.03, pigment{color rgb<1,1,1>*1.5} )  rotate<-90,0,0>}



#macro Campo_Aceleracion(Posicion, BH_Posicion, CG, MasaBH)
        #declare direccion = BH_Posicion - Posicion; 
        #declare distancia = pow(pow(direccion.x,2)+pow(direccion.y,2)+pow(direccion.z,2),1/2); 
        #declare aceleracion = ((CG*MasaBH)/(pow(distancia,2)))*direccion;
        
#end 

#macro Mover(Posicion, Velocidad)
        #declare Nueva_Posicion = Posicion + Velocidad*0.1; 
#end

#declare BH_Posicion = <0,0,0>;
#declare CG = 6.6743*(pow(10,-11));
#declare MasaBH = 4*(pow(10,11));   

 
#declare Vector = array[1000][300]; 
 
#macro Movimiento(Posicion,Vector,j)
        #declare velocidad = <0,0,0>;
        #declare Posicion_Actual = Posicion;
        #declare tiempo_max = 100;
        #declare paso = 0.1;
        #declare tiempo = 0; 
                
        #declare i = 0;

        #while (tiempo <= tiempo_max)
                Campo_Aceleracion(Posicion_Actual, BH_Posicion, CG, MasaBH)  
                #declare velocidad = velocidad + aceleracion*paso;
                Mover(Posicion_Actual, velocidad)  
                #declare Vector[j][i] = Nueva_Posicion; 
        
                #declare dis = BH_Posicion - Nueva_Posicion;       
                #if (pow(pow(dis.x,2)+pow(dis.y,2)+pow(dis.z,2),1/2) <= 1)
                        #break
                #end
                #declare Posicion_Actual = Nueva_Posicion;
                #declare tiempo = tiempo + paso; 
                #declare i = i+1;
        #end
        
        #while (i<100)
            #declare Vector[j][i] = <0,0,0>;
            #declare i = i+1;
        #end
#end

#declare j = 0; 
#declare k = 0; 

#declare num_atomo = 0;

//#fopen file "pares_conectados.dat" write
#while (j<21)
        #while(k<31)
                
                #declare Atomo = <15-k,10-j,0>;
                //#write (file, num_atomo, "  ", Atomo.x, "   ", Atomo.y, "   ", Atomo.z, "\n")
                
                Movimiento(Atomo, Vector,num_atomo)                
                
               
                #if ((clock >= 0) & (clock < 10))
                        sphere{ Vector[num_atomo][clock], 0.06
                                texture { pigment{ rgb<1,0,0> }
                                          finish { diffuse 0.7  phong 1}
                                } // end of texture
                        }
                #end
                #if ((clock >= 10) & (clock < 20))
                        sphere{ Vector[num_atomo][clock-10], 0.06
                                texture { pigment{ rgb<1,0,0> }
                                          finish { diffuse 0.7  phong 1}
                                } // end of texture
                        }
                #end 
                 #if ((clock >= 20) & (clock < 30))
                        sphere{ Vector[num_atomo][clock-20], 0.06
                                texture { pigment{ rgb<1,0,0> }
                                          finish { diffuse 0.7  phong 1}
                                } // end of texture
                        }
                #end
                 #if ((clock >= 30) & (clock < 40))
                        sphere{ Vector[num_atomo][clock-30], 0.06
                                texture { pigment{ rgb<1,0,0> }
                                          finish { diffuse 0.7  phong 1}
                                } // end of texture
                        }
                #end
                #declare k = k+1;
                #declare num_atomo = num_atomo + 1;
        #end        
        #declare j = j+1;
        #declare k = 0;
#end
//#fclose file


#fopen data "pares.dat" read

#while (defined(data))
        #read (data, A, B) 
        #if ((clock >= 0) & (clock < 10))
                #declare check = Vector[A][clock]-Vector[B][clock];
                #if (pow(pow(check.x,2)+pow(check.y,2)+pow(check.z,2),1/2) != 0)
                        cylinder{Vector[A][clock], Vector[B][clock] 0.04 pigment{color Green}} 
                #end
        #end
        #if ((clock >= 10) & (clock < 20))
                #declare check2 = Vector[A][clock-10]-Vector[B][clock-10];
                #if (pow(pow(check2.x,2)+pow(check2.y,2)+pow(check2.z,2),1/2) != 0)
                
                        cylinder{Vector[A][clock-10], Vector[B][clock-10] 0.04 pigment{color Green}} 
                #end
        #end 
        #if ((clock >= 20) & (clock < 30))
                #declare check2 = Vector[A][clock-20]-Vector[B][clock-20];
                #if (pow(pow(check2.x,2)+pow(check2.y,2)+pow(check2.z,2),1/2) != 0)
                
                        cylinder{Vector[A][clock-20], Vector[B][clock-20] 0.04 pigment{color Green}} 
                #end
        #end
        #if ((clock >= 30) & (clock < 40))
                #declare check2 = Vector[A][clock-30]-Vector[B][clock-30];
                #if (pow(pow(check2.x,2)+pow(check2.y,2)+pow(check2.z,2),1/2) != 0)
                
                        cylinder{Vector[A][clock-30], Vector[B][clock-30] 0.04 pigment{color Green}} 
                #end
        #end
#end  


#fclose data 
                  


