// Parámetros
ancho = 100;
profundidad = 60;
altura = 40;
espesor = 3;
tolerancia = 0.2; // Pequeño espacio para encaje

// Caja
module caja() {
    difference() {
        cube([ancho, profundidad, altura]);
        translate([espesor, espesor, espesor]) 
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]);
    }
}

// Tapa con encaje
module tapa() {
    translate([0, 0, altura]) {
        difference() {
            cube([ancho, profundidad, espesor]);
            translate([espesor - tolerancia, espesor - tolerancia, -1]) 
                cube([ancho - 2*espesor + 2*tolerancia, profundidad - 2*espesor + 2*tolerancia, espesor + 2]);
        }
    }
}

// Ensamblaje
caja();
tapa();
