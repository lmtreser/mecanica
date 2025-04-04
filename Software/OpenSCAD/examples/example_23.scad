// Parámetros
soportes = true;  // Cambiar a false para desactivarlos

module caja() {
    cube([50, 50, 30]);  // Caja base
}

// Soportes opcionales en las esquinas
module soporte() {
    cylinder(h=5, d=10);
}

// Ensamblaje
caja();

// Agregar soportes solo si están activados
if (soportes) {
    translate([5, 5, -5]) soporte();
    translate([45, 5, -5]) soporte();
    translate([5, 45, -5]) soporte();
    translate([45, 45, -5]) soporte();
}
