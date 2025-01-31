/*  Ejemplos OpenSCAD
    www.automatismos-mdq.com.ar
*/

// dibujar un cubo
translate([-10,10,0])
cube([20,20,5]);

// dibujar un cilindro
translate([0,-20,0])
cylinder(r=10, h=5, $fn=100);

// dibujar un triangulo
translate([-20,0,0])
cylinder(r=10, h=5, $fn=3);

// dibujar un pentagono
translate([20,0,0])
cylinder(r=10, h=5, $fn=5);
