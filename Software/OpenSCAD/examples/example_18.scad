// Parámetros
ancho = 100;
profundidad = 60;
altura = 40;
espesor = 3;

// Caja principal
module caja() {
    difference() {
        cube([ancho, profundidad, altura]); // Caja exterior
        translate([espesor, espesor, espesor]) 
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]); // Hueco interior
        
        // Ranuras de ventilación
        for (i = [10:10:ancho-10]) {
            translate([i, profundidad-espesor-1, altura/2])
                cube([2, espesor+2, 10], center=true);
        }
    }
}

// Tapa deslizable
module tapa() {
    translate([0, 0, altura + espesor])
        cube([ancho, profundidad, espesor]);
}

// Ensamblaje
caja();
tapa();
