module cilindro_hueco(diametro, altura, grosor) {
    difference() {
        cylinder(h=altura, d=diametro);
        translate([0, 0, -1]) 
            cylinder(h=altura+2, d=diametro - 2*grosor);
    }
}

// Usar el módulo varias veces
cilindro_hueco(30, 50, 2);
translate([40, 0, 0]) cilindro_hueco(20, 30, 3);
