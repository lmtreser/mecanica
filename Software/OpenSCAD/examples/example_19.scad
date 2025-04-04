// Agujeros para tornillos en las esquinas
module agujeros_tornillo() {
    for (x = [5, ancho - 5]) {
        for (y = [5, profundidad - 5]) {
            translate([x, y, -1])
                cylinder(h=espesor + 2, d=3, center=false);
        }
    }
}

// Caja con agujeros
difference() {
    caja();
    agujeros_tornillo();
}
