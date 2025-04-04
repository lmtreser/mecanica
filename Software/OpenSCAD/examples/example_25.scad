module perforaciones() {
    for (x = [5:10:45]) {
        for (y = [5:10:45]) {
            if ((x + y) % 20 == 0) { // Solo en posiciones alternas
                translate([x, y, 0])
                    cylinder(h=5, d=3);
            }
        }
    }
}

difference() {
    cube([50, 50, 5]);  // Placa base
    perforaciones();
}
