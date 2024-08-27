CLIP_HEIGHT = 25.4;
MOUNT_HEIGHT = 1.6;
MOUNT_DIAMETER = 5.2;
MOUNT_HOLE_DIAMETER = 2.35;
MOUNT_HOLE_45CHAMFER = 0.4;
MOUNT_HOLE_DEPTH = 10;

$fn = 100;

// LM2596 mounting dimensions
X_OFFSET = 16;
Y_OFFSET = 30.6;

BASE_RAD = 0.5*CLIP_HEIGHT - (X_OFFSET*0.5);

module din_clip() {
    difference() {
        translate([0,0,0]) {
            union() {
                translate([-0.2,0,0]) linear_extrude(height=CLIP_HEIGHT, center=true, convexity=5) {
                    import(file="din_clip_01.dxf", layer="0");
                }
            }        
            union() {
        
                translate([-MOUNT_HEIGHT, 25+Y_OFFSET*0.5, X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HEIGHT, r1 = MOUNT_DIAMETER / 2, r2 = BASE_RAD);
                    }
                }
        
                translate([-MOUNT_HEIGHT, 25-Y_OFFSET*0.5, -X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HEIGHT, r1 = MOUNT_DIAMETER / 2, r2 = BASE_RAD);
                    }
                }
            }
        }
        union() {
        
                translate([-MOUNT_HEIGHT, 25+Y_OFFSET*0.5, X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HOLE_DEPTH, d = MOUNT_HOLE_DIAMETER);
                    }
                }
        
                translate([-MOUNT_HEIGHT, 25-Y_OFFSET*0.5, -X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HOLE_DEPTH, d = MOUNT_HOLE_DIAMETER);
                    }
                }
                translate([-MOUNT_HEIGHT, 25+Y_OFFSET*0.5, X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HOLE_DIAMETER+2*MOUNT_HOLE_45CHAMFER, d1 = MOUNT_HOLE_DIAMETER+2*MOUNT_HOLE_45CHAMFER, d2 = 0);
                    }
                }
        
                translate([-MOUNT_HEIGHT, 25-Y_OFFSET*0.5, -X_OFFSET*0.5]) {
                    rotate([0, 90, 0]) {
                        cylinder(h= MOUNT_HOLE_DIAMETER+2*MOUNT_HOLE_45CHAMFER, d1 = MOUNT_HOLE_DIAMETER+2*MOUNT_HOLE_45CHAMFER, d2 = 0);
                    }
                }
            }
    }
}

din_clip();

