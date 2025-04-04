// Caja base
difference() {
    cube([50, 50, 30]);
    translate([5, 5, 5]) cube([40, 40, 25]);
}

// Tapa desplazada arriba
translate([0, 0, 35]) cube([50, 50, 5]);
