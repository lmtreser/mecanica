module engranaje(dientes, radio, grosor) {
    function angulo(i) = i * 360 / dientes;
    
    difference() {
        cylinder(h=grosor, d=radio*2);
        
        for (i = [0:dientes-1]) {
            rotate([0, 0, angulo(i)])
                translate([radio, 0, 0])
                    circle(5);
        }
    }
}

// Engranaje con 10 dientes
engranaje(10, 20, 5);
