module caja(ancho, profundidad, altura, espesor) {
    difference() {
        cube([ancho, profundidad, altura]);
        translate([espesor, espesor, espesor]) 
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]);
    }
}

module tapa(ancho, profundidad, espesor) {
    cube([ancho, profundidad, espesor]);
}

// Dibujar caja y tapa
caja(60, 40, 30, 3);
translate([0, 0, 35]) tapa(60, 40, 3);
