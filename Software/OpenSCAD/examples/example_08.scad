difference() {
    cube([30, 30, 10]); // Base
    translate([5, 5, -1]) cylinder(h=12, r=10); // Agujero
}
