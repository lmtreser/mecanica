// Parámetros
ancho = 60;
profundidad = 40;
altura = 30;
espesor = 5;

// Caja
difference() {
    cube([ancho, profundidad, altura]);
    translate([espesor, espesor, espesor]) 
        cube([ancho - 2*espesor, profundidad - 2*espesor, altura]);
}
