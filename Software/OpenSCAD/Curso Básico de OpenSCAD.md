# Curso Básico de OpenSCAD

Fundamentos:

1. **Introducción y entorno de trabajo**: Cómo funciona OpenSCAD, interfaz y primeros comandos.
2. **Primitivas básicas**: Cubos, cilindros, esferas y cómo combinarlas.
3. **Transformaciones**: Traslaciones, rotaciones y escalados.
4. **Operaciones booleanas**: Unión, diferencia e intersección de sólidos.
5. **Uso de variables y módulos**: Parametrización de diseños.
6. **Loops y condicionales**: Automatización de piezas repetitivas.

Modelos más técnicos:

- **Gabinetes electrónicos** con ranuras de ventilación y soportes internos.
- **Tuercas y tornillos** con roscas paramétricas.
- **Piezas mecánicas** como engranajes o soportes estructurales.

OpenSCAD es un software de modelado 3D basado en programación. No se dibuja con el mouse, sino que se escriben comandos para generar y modificar formas.

## **Paso 1: Instalación**
1. Descargá OpenSCAD desde [openscad.org](https://openscad.org/).
2. Instalalo en tu sistema operativo (Windows, Linux o macOS).

## **Paso 2: Interfaz y primeros comandos**
Abrí OpenSCAD y probá este código:

```scad
cube([20, 30, 10]); // Un cubo de 20x30x10 mm
```
Hacé clic en **Preview (F5)** para ver el modelo y en **Render (F6)** para generar la geometría final.

Probá otros comandos básicos:

```scad
sphere(15); // Esfera de radio 15 mm
cylinder(h=30, r=10); // Cilindro de altura 30 mm y radio 10 mm
```

## **Ejercicio 1: Crear una caja simple**
Probá crear una caja sin tapa usando la función `difference()` para restar un volumen interno:

```scad
difference() {
    cube([50, 50, 30]); // Caja exterior
    translate([5, 5, 5]) cube([40, 40, 25]); // Hueco interior
}
```
Esto genera una caja de 50x50x30 mm con paredes de 5 mm de grosor.

### **Paso 3: Transformaciones básicas**
Las transformaciones en OpenSCAD te permiten mover, rotar y escalar objetos.

#### **1. Traslación (`translate()`)**
Mueve un objeto a una nueva posición sin cambiar su tamaño o forma.

```scad
translate([30, 20, 10]) sphere(10);
```
Esto coloca una esfera de radio 10 mm en la posición (30, 20, 10).

#### **2. Rotación (`rotate()`)**
Gira un objeto en torno a los ejes X, Y o Z.

```scad
rotate([0, 0, 45]) cube([30, 10, 10]);
```
Esto rota el cubo 45° alrededor del eje Z.

#### **3. Escalado (`scale()`)**
Cambia el tamaño de un objeto en cada eje.

```scad
scale([2, 1, 0.5]) cube([10, 10, 10]);
```
Esto dobla el tamaño en X, lo mantiene en Y y lo reduce a la mitad en Z.

### **Paso 4: Operaciones booleanas**
Son fundamentales para crear geometrías complejas combinando objetos.

#### **1. Unión (`union()`)**
Junta varios objetos en uno solo.

```scad
union() {
    cube([20, 20, 20]);
    translate([10, 10, 0]) sphere(10);
}
```
Esto crea un cubo con una esfera unida en la esquina superior.

#### **2. Diferencia (`difference()`)**
Resta un objeto de otro.

```scad
difference() {
    cube([30, 30, 10]); // Base
    translate([5, 5, -1]) cylinder(h=12, r=10); // Agujero
}
```
Esto genera un cubo con un cilindro perforado en su centro.

#### **3. Intersección (`intersection()`)**
Mantiene solo la parte donde dos objetos se superponen.

```scad
intersection() {
    sphere(15);
    cube([20, 20, 20]);
}
```
Esto crea una figura que es la parte común entre la esfera y el cubo.

### **Ejercicio 2: Crear una caja con tapa**
Ahora probemos hacer una caja con tapa separada:

```scad
// Caja base
difference() {
    cube([50, 50, 30]);
    translate([5, 5, 5]) cube([40, 40, 25]);
}

// Tapa desplazada arriba
translate([0, 0, 35]) cube([50, 50, 5]);
```

### **Paso 5: Variables y Parametrización**
En OpenSCAD podés usar variables para hacer que tus diseños sean más flexibles y fáciles de modificar.

#### **1. Definir Variables**
En lugar de escribir valores fijos, podés usar variables:

```scad
ancho = 50;
alto = 30;
profundidad = 20;

cube([ancho, profundidad, alto]);
```
Si cambiás el valor de `ancho`, el cubo se ajustará automáticamente.

#### **2. Uso en una Caja Paramétrica**
```scad
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
```
Si cambiás `ancho` o `espesor`, la caja se ajustará automáticamente.

---

### **Paso 6: Módulos y Reutilización de Código**
Los módulos permiten reutilizar código y organizar mejor los diseños.

#### **1. Definir un Módulo**
```scad
module cilindro_hueco(diametro, altura, grosor) {
    difference() {
        cylinder(h=altura, d=diametro);
        translate([0, 0, -1])
            cylinder(h=altura+2, d=diametro - 2*grosor);
    }
}

// Usar el módulo varias veces
cilindro_hueco(30, 50, 2);
translate([40, 0, 0]) cilindro_hueco(20, 30, 3);
```
Esto crea dos cilindros huecos con distintos tamaños.

### **Ejercicio 3: Caja con Tapa Paramétrica**
Hacé una caja con tapa usando módulos y parámetros:

```scad
module caja(ancho, profundidad, altura, espesor) {
    difference() {
        cube([ancho, profundidad, altura]);
        translate([espesor, espesor, espesor])
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]);
    }
}

module tapa(ancho, profundidad, espesor) {
    cube([ancho, profundidad, espesor]);
}

// Dibujar caja y tapa
caja(60, 40, 30, 3);
translate([0, 0, 35]) tapa(60, 40, 3);
```
Podés cambiar `ancho`, `profundidad` o `espesor` y la caja se ajustará.

### **Paso 7: Crear Roscas y Tuercas**
Ahora vamos a modelar tornillos y tuercas con OpenSCAD.

#### **1. Librería de Roscas**
En OpenSCAD, generar roscas manualmente es complicado, pero hay una librería lista para usar:

1. Descargá la librería [Threading Library](https://dkprojects.net/openscad-threads/)
2. Incluí el archivo en el mismo directorio de tu proyecto.
3. Usá `include <threads.scad>` para importarla.

#### **2. Crear un Tornillo Métrico M8**
```scad
include <threads.scad>

// Tornillo M8 x 20mm
metric_thread(diameter=8, pitch=1.25, length=20);
```
Esto genera un tornillo métrico de **8 mm de diámetro, 1.25 mm de paso y 20 mm de largo**.

#### **3. Crear una Tuerca M8**
```scad
difference() {
    cylinder(d=14, h=6); // Cuerpo de la tuerca
    metric_thread(diameter=8, pitch=1.25, length=6, internal=true);
}
```
Esto genera una **tuerca compatible con un tornillo M8**.

### **Ejercicio 4: Crear un Tornillo y una Tuerca Ajustables**
Hacé un **tornillo y tuerca paramétricos** para cualquier tamaño:

```scad
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
```
Podés cambiar `diametro`, `paso` y `longitud` para generar distintos tamaños.

### **Paso 8: Diseño de Gabinetes Electrónicos**
Ahora vamos a diseñar un **gabinete paramétrico** para alojar circuitos electrónicos.

#### **1. Caja con Ranuras de Ventilación**
```scad
// Parámetros
ancho = 100;
profundidad = 60;
altura = 40;
espesor = 3;

// Caja principal
module caja() {
    difference() {
        cube([ancho, profundidad, altura]); // Caja exterior
        translate([espesor, espesor, espesor])
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]); // Hueco interior

        // Ranuras de ventilación
        for (i = [10:10:ancho-10]) {
            translate([i, profundidad-espesor-1, altura/2])
                cube([2, espesor+2, 10], center=true);
        }
    }
}

// Tapa deslizable
module tapa() {
    translate([0, 0, altura + espesor])
        cube([ancho, profundidad, espesor]);
}

// Ensamblaje
caja();
tapa();
```
Esto genera un gabinete **con ranuras de ventilación en los laterales y una tapa superior separada**.

### **2. Perforaciones para Tornillos**
Si querés agregar **agujeros para tornillos**, podés hacer lo siguiente:

```scad
// Agujeros para tornillos en las esquinas
module agujeros_tornillo() {
    for (x = [5, ancho - 5]) {
        for (y = [5, profundidad - 5]) {
            translate([x, y, -1])
                cylinder(h=espesor + 2, d=3, center=false);
        }
    }
}

// Caja con agujeros
difference() {
    caja();
    agujeros_tornillo();
}
```
Esto agrega **cuatro agujeros** en las esquinas para fijar el gabinete con tornillos de 3 mm.

### **Ejercicio 5: Gabinete Personalizado**
Modificá el código para:
✅ **Cambiar el tamaño del gabinete**
✅ **Agregar más ranuras de ventilación**
✅ **Hacer la tapa con bordes sobresalientes para encajar mejor**

### **Paso 9: Ensamblajes con `translate()` y `rotate()`**
En OpenSCAD, podemos ensamblar piezas colocando y rotando objetos correctamente.

#### **1. Ensamblar una Caja con una Tapa con Encaje**
```scad
// Parámetros
ancho = 100;
profundidad = 60;
altura = 40;
espesor = 3;
tolerancia = 0.2; // Pequeño espacio para encaje

// Caja
module caja() {
    difference() {
        cube([ancho, profundidad, altura]);
        translate([espesor, espesor, espesor])
            cube([ancho - 2*espesor, profundidad - 2*espesor, altura]);
    }
}

// Tapa con encaje
module tapa() {
    translate([0, 0, altura]) {
        difference() {
            cube([ancho, profundidad, espesor]);
            translate([espesor - tolerancia, espesor - tolerancia, -1])
                cube([ancho - 2*espesor + 2*tolerancia, profundidad - 2*espesor + 2*tolerancia, espesor + 2]);
        }
    }
}

// Ensamblaje
caja();
tapa();
```
✔ **La tapa tiene bordes interiores con una pequeña tolerancia** para encajar bien en la caja.

### **Paso 10: Piezas con Ajustes Precisos (Snap-fit, Bisagras, y Más)**

#### **1. Sistema de Encaje (Snap-fit)**
Este es un diseño de **clip flexible** que permite unir piezas sin tornillos:

```scad
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
```
✔ Esto crea un **clip flexible** que se puede imprimir en 3D.

### **2. Bisagra Paramétrica**
Una bisagra simple con un eje central y dos partes que giran alrededor:

```scad
module bisagra() {
    difference() {
        union() {
            cylinder(h=10, d=6); // Eje central
            translate([-10, -3, 0]) cube([10, 6, 10]); // Parte fija
            translate([6, -3, 0]) cube([10, 6, 10]); // Parte móvil
        }
        translate([3, -4, -1]) cylinder(h=12, d=3); // Agujero para pasador
    }
}

// Muestra la bisagra
bisagra();
```
✔ **Esto puede servir para puertas de gabinetes electrónicos.**

### **Ejercicio 6: Diseñar una Caja con Tapa Abisagrada**
1. **Agregar bisagras** a la tapa para que se abra en lugar de ser removible.
2. **Optimizar el encaje** para que se sostenga sin tornillos.
3. **Agregar agujeros para cables** si es un gabinete electrónico.

### **Paso 11: Exportación y Preparación para Impresión 3D**

Ahora que tenemos diseños funcionales, veamos cómo exportarlos correctamente para impresión 3D.

#### **1. Exportar a STL**
En OpenSCAD, podés exportar cualquier modelo a **STL**, que es el formato estándar para impresión 3D.

1. Hacé clic en **Design → Compile and Render (F6)** para asegurarte de que el modelo está listo.
2. Luego, hacé clic en **File → Export → Export as STL**.
3. Guardá el archivo con extensión `.stl`.

### **Paso 12: Comprobación y Corrección del STL**
Antes de imprimir, es recomendable verificar si el modelo tiene errores de malla.

#### **1. Revisar en Cura o PrusaSlicer**
- **Abrí Cura o PrusaSlicer** y cargá el archivo STL.
- Mirá la **vista en capas** para asegurarte de que las paredes, soportes y detalles se ven bien.

#### **2. Reparar con Netfabb (opcional)**
Si el STL tiene errores (caras invertidas, agujeros en la malla), podés usar:
- **Netfabb (de Autodesk)**
- **Meshmixer**
- **PrusaSlicer (opción reparar modelo)**

### **Paso 13: Generar G-code para Impresión**
Si usás una impresora 3D FDM (tipo Ender 3, Prusa, etc.), necesitás convertir el STL a **G-code**.

1. **Elegí el material y el perfil de la impresora** en Cura o PrusaSlicer.
2. **Ajustá parámetros de impresión** como:
   - **Altura de capa**: 0.2mm (calidad normal)
   - **Densidad de relleno**: 20% (para piezas normales)
   - **Soportes**: Habilitar si hay voladizos
   - **Adhesión**: Brim o raft si la pieza es pequeña
3. **Guardá el archivo G-code en una SD/microSD**.

### **Ejercicio 7: Preparar e Imprimir un Modelo**
1. **Exportá tu gabinete o tornillo en STL**.
2. **Verificá que no tenga errores en Cura o PrusaSlicer**.
3. **Generá el G-code y probá imprimirlo en una impresora 3D**.

### **Paso 14: Condiciones (`if`) y Bucles (`for`) en OpenSCAD**

OpenSCAD permite generar modelos dinámicos usando **condiciones (`if`)** y **bucles (`for`)**, lo que facilita crear piezas personalizables.

### **1. Uso de `if`: Modelos Condicionales**
Podemos hacer que una pieza cambie dependiendo de una variable.

#### **Ejemplo: Agregar Soportes Opcionales a una Caja**
```scad
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
```
✔ **Cambia `soportes = false` y verificá que desaparecen los soportes.**

### **2. Uso de `for`: Bucles para Repetir Elementos**
Los bucles nos permiten generar patrones sin escribir muchas líneas de código.

#### **Ejemplo: Ranuras de Ventilación en una Caja**
```scad
module ranuras() {
    for (x = [10:10:40]) { // Cada 10 mm
        translate([x, 0, 15])
            cube([2, 50, 2]);  // Ranura
    }
}

difference() {
    cube([50, 50, 30]);  // Caja
    ranuras();
}
```
✔ **Esto genera varias ranuras automáticamente sin escribir cada una manualmente.**

### **3. Uso de `for` con `if`: Filas Alternadas**
Podemos combinar `for` e `if` para hacer diseños más avanzados.

#### **Ejemplo: Agujeros Alternados en una Placa**
```scad
module perforaciones() {
    for (x = [5:10:45]) {
        for (y = [5:10:45]) {
            if ((x + y) % 20 == 0) { // Solo en posiciones alternas
                translate([x, y, 0])
                    cylinder(h=5, d=3);
            }
        }
    }
}

difference() {
    cube([50, 50, 5]);  // Placa base
    perforaciones();
}
```
✔ **Mirá cómo los agujeros se alternan en un patrón cuadriculado.**

### **Ejercicio 8: Crear una Rejilla con un Patrón Personalizado**
1. **Usá `for` para hacer una serie de perforaciones en una placa.**
2. **Usá `if` para hacer que algunos agujeros sean más grandes que otros.**
3. **Cambiá parámetros para ver cómo afecta el resultado.**

### **Siguiente Paso: Modelos Paramétricos Avanzados**
Si terminaste con bucles y condiciones, ahora podemos ver:
✅ **Modelos totalmente paramétricos con `function` y `let`.**
✅ **Diseño de engranajes, tuercas y tornillos con ajustes precisos.**

### **Paso 15: Modelos Paramétricos con `function` y `let`**

Ahora veremos cómo hacer modelos **totalmente paramétricos**, lo que permite modificar diseños fácilmente con solo cambiar valores.

### **1. Uso de `let`: Variables Temporales**
La función `let` permite definir valores dentro de un bloque sin afectar otras partes del código.

#### **Ejemplo: Caja con Grosor Ajustable**
```scad
module caja(ancho, alto, profundidad, grosor) {
    let(interno = [ancho - 2*grosor, alto - 2*grosor, profundidad - grosor]) {
        difference() {
            cube([ancho, alto, profundidad]);
            translate([grosor, grosor, grosor]) cube(interno);
        }
    }
}

// Prueba con diferentes valores
caja(100, 60, 40, 3);
```
✔ **Cambiá los parámetros y mirá cómo se ajusta automáticamente el tamaño.**

### **2. Uso de `function`: Cálculos Personalizados**
Podemos definir funciones para calcular dimensiones o posiciones.

#### **Ejemplo: Tornillo con Paso Personalizado**
```scad
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
```
✔ **Probá con distintos diámetros y pasos para ver cómo cambia la rosca.**

### **Paso 16: Diseño de Engranajes y Roscado Preciso**

Podemos usar `function` y `let` para generar engranajes personalizados.

#### **Ejemplo: Engranaje Simple**
```scad
module engranaje(dientes, radio, grosor) {
    function angulo(i) = i * 360 / dientes;

    difference() {
        cylinder(h=grosor, d=radio*2);

        for (i = [0:dientes-1]) {
            rotate([0, 0, angulo(i)])
                translate([radio, 0, 0])
                    circle(5);
        }
    }
}

// Engranaje con 10 dientes
engranaje(10, 20, 5);
```
✔ **Cambiá la cantidad de dientes para ver cómo cambia la forma.**

### **Ejercicio Final: Tornillo con Tuerca Paramétrica**
1. **Crea un módulo de tuerca que encaje con el tornillo.**
2. **Asegura que la rosca se ajuste correctamente.**
3. **Verifica que la tuerca gire bien dentro del tornillo.**
