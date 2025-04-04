module tuercaTornillo(cubo=9, anchoTuerca=3, alturaTuerca=2, radioTaladro=1.5) {
    difference() {
        // Cubo
        cube([cubo, cubo, cubo], center=true);
        
        // Ranura para meter la tuerca
        color("yellow")
        translate([-1, 0, 1.5])
        cube([cubo, cubo-2.2, cubo/3], center=true);
    
        // Mueca tuerca
        translate([0,0,-1.4])
        cylinder (r=anchoTuerca+0.4, h=alturaTuerca+1, $fn=6, center=true);

        // Taladro
        translate([0,0,0])
        cylinder (r=radioTaladro, h=cubo*3, $fn=100, center=true);
    }
}