module ranuras() {
    for (x = [10:10:40]) { // Cada 10 mm
        translate([x, 0, 15])
            cube([2, 50, 2]);  // Ranura
    }
}

difference() {
    cube([50, 50, 30]);  // Caja
    ranuras();
}
