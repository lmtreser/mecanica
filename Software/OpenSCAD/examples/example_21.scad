module clip() {
    difference() {
        cube([10, 20, 3]); // Base
        translate([2, 20, 0]) 
            rotate([0, 0, -30]) cube([6, 8, 3]); // Lengüeta
    }
}

// Ver cómo encaja el clip en una base
cube([50, 50, 3]); // Base de prueba
translate([20, 20, 3]) clip();
