largoCaja=70;
anchoCaja=60;
grosorCaja=45;

largoTuerca=70;
anchoTuerca=2;
grosorTuerca=2;

taladroPasante=0;
diametroBoton=0;
tuercaAlojada=0;


union () {
    difference(){
             minkowski() {
                cube([largoCaja,anchoCaja,grosorCaja], center=true);
                cylinder(r=2,h=1, $fn=100);
            }
        
            // Coloco lo que voy a restar 2 mm hacia arriba en Z para que haga de fondo
            translate([0,0,2])
            cube([70, 60, 45], center=true);
            
            // Hueco botón arcade
            translate([0, 0, -20])
            #cylinder (r=15.4, h=10, $fn=100, center=true);
            
            // Hueco USB
            translate([-33,0, 8])
            #cube([18, 11, 8], center=true);
    }


    // Para cierre
    color ("yellow")
    translate([0, 29.1, 19.5])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
        
    // Para cierre
    color ("yellow")
    translate([0, -29.1, 19.5])
    cube([largoTuerca, anchoTuerca, grosorTuerca], center=true);
}