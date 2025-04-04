module caja(ancho, alto, profundidad, grosor) {
    let(interno = [ancho - 2*grosor, alto - 2*grosor, profundidad - grosor]) {
        difference() {
            cube([ancho, alto, profundidad]);
            translate([grosor, grosor, grosor]) cube(interno);
        }
    }
}

// Prueba con diferentes valores
caja(100, 60, 40, 3);
