include <threads.scad>

diametro = 10;
paso = 1.5;
longitud = 30;

// Tornillo
translate([0, 0, 10])
    metric_thread(diameter=diametro, pitch=paso, length=longitud);

// Tuerca
difference() {
    cylinder(d=diametro * 1.5, h=paso * 5);
    metric_thread(diameter=diametro, pitch=paso, length=paso * 5, internal=true);
}
