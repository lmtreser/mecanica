largoCaja=70;
anchoCaja=60;
grosorCaja=45;

largoTuerca=9;
anchoTuerca=9;
grosorTuerca=9;

taladroPasante=0;
diametroBoton=0;
tuercaAlojada=0;

difference() {
    cube([largoCaja, anchoCaja, grosorCaja], center=true);
    // Coloco lo que voy a restar 2 mm hacia arriba en Z para que haga de fondo
    translate([0,0,2])
    cube([66, 56, 45], center=true);
    // Hueco botón arcade
    translate([0, 0, -20])
    #cylinder (r=15.4, h=10, $fn=100, center=true);
    // Hueco USB
    translate([-33,0, 8])
    #cube([8, 11, 8], center=true);
}

difference() {
    // Para atornillar Arriba Izquierda
    translate([-28.5, 23.5, 15])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
    // Mueca tuerca
    translate([-28.5, 23.5, 14])
    #cylinder (r=3.4, h=3, $fn=6, center=true);
    // Taladro
    translate([-28.5, 23.5, 15.5])
    #cylinder (r=1.5, h=25, $fn=100, center=true);
    // Ranura para meter la tuerca
    translate([-27.5, 23.5, 17])
    #cube([9, 6.8, 3.3], center=true);
}

difference() {
    // Para atornillar Arriba derecha
    translate([28.5, 23.5, 15])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
    // Mueca tuerca
    translate([28.5,23.5,14])
    #cylinder (r=3.4, h=3, $fn=6, center=true);
    // Taladro
    translate([28.5,23.5,15.5])
    #cylinder (r=1.5, h=25, $fn=100, center=true);
    // Ranura para meter la tuerca
    translate([27.5, 23.5, 17])
    #cube([9, 6.8, 3.3], center=true);
}

difference() {
    // Para atornillar Abajo Izquierda
    translate([-28.5, -23.5, 15])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
    // Mueca tuerca
    translate([-28.5, -23.5, 14])
    #cylinder (r=3.4, h=3, $fn=6, center=true);
    // Taladro
    translate([-28.5, -23.5, 15])
    #cylinder (r=1.5, h=25, $fn=100, center=true);
    // Ranura para meter la tuerca
    translate([-27.5, -23.5, 17])
    #cube([9, 6.8, 3.3], center=true);
}

difference() {
    // Para atornillar Abajo Derecha
    translate([28.5, -23.5, 15])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
    // Mueca tuerca
    translate([28.5, -23.5, 14])
    #cylinder (r=3.4, h=3, $fn=6, center=true);
    // Taladro
    translate([28.5, -23.5, 15])
    #cylinder (r=1.5, h=25, $fn=100, center=true);
    // Ranura para meter la tuerca
    translate([27.5, -23.5, 17])
    #cube([9, 6.8, 3.3], center=true);
}