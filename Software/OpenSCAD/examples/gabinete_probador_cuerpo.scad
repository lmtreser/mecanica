/* Gabinete para probador de continuidad
   CEKIT - 08/02/2021
*/

union(){
    // cubo principal
    difference() {  
        cube([100,60,25]);
        translate([2,2,2])
        cube([96,56,27]);
        // taladro jack
        translate([-1,11.5,10])
        rotate([0, 90, 0])
        cylinder(r=2.5,h=4, $fn=100);
        // taladro LED
        translate([-1,26,10])
        rotate([0, 90, 0])
        cylinder(r=1.5,h=4, $fn=100);
        // taladro llave
        translate([-0,38,6.5])
        cube([5,13,7]);
    }

    // división para batería 9V
    difference(){
        translate([66,0,0])
        cube([1.5,60,15]);
        translate([66,6,10])
        rotate([0, 90, 0])
        cylinder(r=2,h=4, $fn=100);
    }
}