
// Base
module base_ppal() {
    // Partes a sumar
    difference(){
        minkowski(){
            sphere(1, $fn=16);
            cube ([169, 115, 8], center = true);
        }
        
    // Partes a restar (Hueco parte inferior, para calzar en otro tray)   
    difference() { 
        translate([0,0, -7 ]) cube ([200, 150, 8], center = true);
        translate([0,0, -7 ]) cube ([165, 111, 8], center = true);
        
    }
    }
}


// Cuerpo del micro
module micro() {
    // Cuerpo del micro
    translate([0,0, 7 ]) cube ([38, 38, 10], center = true);
    // Pines del micro
    translate([0,0,-1 ]) cube ([31, 31,  7], center = true); //achicado 1mm
}


//Tray
module tray() {
    difference() {
        union() {
            base_ppal();

        }
        // Partes a restar 
        union(){
            translate([ 63, 28,-2.5 ]) micro();
            translate([-63, 28,-2.5 ]) micro();     
            
            translate([ 21 ,-28,-2.5 ]) micro();
            translate([-21 ,-28,-2.5 ]) micro(); 
            
            translate([ 21 , 28,-2.5 ]) micro();
            translate([-21 , 28,-2.5 ]) micro();             
     
            translate([ 63,-28,-2.5 ]) micro();
            translate([-63,-28,-2.5 ]) micro();  
            
            // Hueco parte superior, para calzar en otro tray   
            translate([0,0, 7 ]) cube ([167, 113, 8], center = true);

            // Huecos para los dedos, para poder retirar los micros mas facil
            rotate ([ 0, 90, 90]) translate ([-8, 21,0]) cylinder(200, 8,8, $fn=64, center=true);
            rotate ([ 0, 90, 90]) translate ([-8,-21,0]) cylinder(200, 8,8, $fn=64, center=true);  
            rotate ([ 0, 90, 90]) translate ([-8, 63,0]) cylinder(200, 8,8, $fn=64, center=true);
            rotate ([ 0, 90, 90]) translate ([-8,-63,0]) cylinder(200, 8,8, $fn=64, center=true);   
            
        }
    }
}


 tray();