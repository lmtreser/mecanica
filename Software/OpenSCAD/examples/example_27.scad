function paso_metrico(n) = n * 1.25; // Relación estándar

module tornillo(diametro, largo, rosca) {
    cylinder(h=largo, d=diametro);
    
    // Simulación de rosca usando el paso
    for (h = [0:paso_metrico(rosca):largo]) {
        translate([diametro/2, 0, h])
            rotate([0, 0, h * 5]) 
                cylinder(h=paso_metrico(rosca)/2, d=diametro*0.9, center=true);
    }
}

// Tornillo M6 con paso 1
tornillo(6, 30, 1);
