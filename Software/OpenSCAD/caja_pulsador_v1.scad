/* Diseño de una caja en 3D */

// Variables con las medidas de la caja (en mm)
largoCaja=65;
anchoCaja=65;
grosorCaja=74;

// Hace la unión de todo lo que está en la función de diferencia y las figuras a partir de la linea 38.
union () {
    
    // Hace la diferencia (resta) de arriba hacia abajo
    difference(){
            
             // Función para crear un cubo
             minkowski() {
                cube([largoCaja,anchoCaja,grosorCaja], center=true);
                cylinder(r=2,h=2, $fn=100);
            }
        
            // Coloco lo que voy a restar 2mm hacia arriba en Z para que haga de fondo
            translate([0,0,3])
            cube([65, 65, 74], center=true);
            
            // Hueco botón arcade grande
            translate([0, 0, -35])
            #cylinder (r=28.6, h=10, $fn=100, center=true);
            
            // Hueco mueca botón arcade
            translate([-28, 0, -35])
            #cylinder (r=2.5, h=10, $fn=100, center=true);
     
            // Hueco USB
            rotate([0, 0, 90])
            translate([33,1, 23.5])
            #cube([5, 11, 8], center=true);
    }

    color([1, 0, 0])
    translate([31.2, 0, 34.5])
    cube ([3, 65, 3], center = true);
    
    translate([-31.2, 0, 34.5])
    cube ([3, 65, 3], center = true);

}