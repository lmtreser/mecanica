module bisagra() {
    difference() {
        union() {
            cylinder(h=10, d=6); // Eje central
            translate([-10, -3, 0]) cube([10, 6, 10]); // Parte fija
            translate([6, -3, 0]) cube([10, 6, 10]); // Parte móvil
        }
        translate([3, -4, -1]) cylinder(h=12, d=3); // Agujero para pasador
    }
}

// Muestra la bisagra
bisagra();
