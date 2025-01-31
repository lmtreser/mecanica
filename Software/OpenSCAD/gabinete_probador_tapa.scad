/*  Tapa para gabinete probador de continuidad
    CEKIT - 08/02/2001
*/

union(){
    
    // Tapa (base)
    difference(){
        cube([100,60,2]);
        // taladros buzzer
        translate([50,30,0])
        cylinder(r=2.2,h=4, $fn=100);
        translate([50,22,0])
        cylinder(r=1,h=4, $fn=100);
        translate([50,38,0])
        cylinder(r=1,h=4, $fn=100);
        translate([58,30,0])
        cylinder(r=1,h=4, $fn=100);
        translate([42,30,0])
        cylinder(r=1,h=4, $fn=100);
    }
    // Borde interno
    difference(){
        translate([2,2,0])
        cube([96,56,8]);
        translate([3,3,0])
        cube([94,54,8]);
    }
    
}