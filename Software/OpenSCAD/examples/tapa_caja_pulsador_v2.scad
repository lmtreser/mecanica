// Grosor, diámetro, taladro

// modulo-rueda.scad lo he sacado del tutorial de Obijuan https://www.youtube.com/watch?v=86PLSLyK3Bc
use <modulo-rueda.scad> 

// Creo la tapadera
module tapadera(largo=66, ancho=56, grosor=3  ) {
    // Defino la posición la tapadera
    translate ([0,0,0])
    // Creo tapadera
    cube([largo, ancho, grosor], center=true);       
}


difference() {
    tapadera();
    
    // Mueca 1 a 1 mm por cada lado
    translate([-28.5,-23.5,-0.4])
    #rueda(2, 3.1, 1);
    translate([-28.5,-23.5,-8])
    #cylinder (r=1.5, h=15, $fn=100);
    
    // Mueca 2 a 1 mm por cada lado
    translate([28.5,-23.5,-0.4])
    #rueda(2, 3.1, 1);
    translate([28.5,-23.5,-8])
    #cylinder (r=1.5, h=15, $fn=100);
    
    // Mueca 3 a 1 mm por cada lado
    translate([28.5,23.5,-0.4])
    #rueda(2, 3.1, 1);
    translate([28.5,23.5,-8])
    #cylinder (r=1.5, h=15, $fn=100);
    
    // Mueca 4 a 1 mm por cada lado
    translate([-28.5,23.5,-0.4])
    #rueda(2, 3.1, 1);
    translate([-28.5,23.5,-8])
    #cylinder (r=1.5, h=15, $fn=100);
}
</modulo-rueda.scad>