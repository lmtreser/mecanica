//************************************************************
//  title: Universal_Left_DIN_PCB_tray
//  author: Erwin Casier
//  version: 1.0
//
//
//  The PCB TRAY SUPPORT section is based on
//  the original design off OK1HRA
//  URL: http://remoteqth.com/3d-din-rail-mount-clip.php

//***********************  PCB Input Parameters **************
pcb_thickness = 1.6;           // thickness of the pcb
pcb_height = 70;               // height of the pcb
pcb_offset = 0; // (pcb_height/2)-35 = center
pcb_gap = 20;                  //Gap between PCB and bottom
pcb_tol = 0.2;                  // pcb tolerance
width = 8;                      // width off the support tray

//***********************  Default is M3x8 lock_screw_length = 8;  *******
lock_screw_length = 8; 
lock_screw_thread_diameter = 3.2;
lock_nut_height = 2.6;
r_lock_screw = lock_screw_thread_diameter / 2;

$fn=100;

scale = 1;

//************************************************************

Universal_DIN_PCB_Tray();

module Universal_DIN_PCB_Tray(){
    
//***********************  PCB TRAY  *************************
    
    translate([-1.5,-1.5,0])
        cube([1.5,(1.5+pcb_height+pcb_tol+1.5),width],false);
    
        difference() {
            translate([-(1.5+pcb_gap),-1.5,0])
                cube([pcb_gap,(1.5+pcb_height+pcb_tol+1.5),width],false);
            
            translate([-(1.5+pcb_gap),2.5,3])
                cube([pcb_gap,(pcb_height+pcb_tol-5),(width-3)],false);
            
            translate([-11.5,58,0])
                cylinder(h=5, r1=6.6, r2=6.6, center=false);
            
            translate([-11.5,18,0])
                cylinder(h=5, r1=3.1, r2=3.1, center=false);
            
            translate([-5,27,0]) rotate([0,0,90]) mirror([1,0,0])
                linear_extrude(height = 1)
                        text("ON   OFF",size = (3*scale),font = "Arial:style=Black",valign = "center");
        }
//        
//        difference() {
//            translate([-(1.5+pcb_gap+pcb_thickness+pcb_tol),-1.5,0])
//                cube([(pcb_thickness+pcb_tol),(1.5+pcb_height+pcb_tol+1.5),width],false);
//            
//            translate([-(1.5+pcb_gap+pcb_thickness+pcb_tol),0,1.5])
//                cube([(pcb_thickness+pcb_tol),(pcb_height+pcb_tol),(width-1.5)],false);
//        }
//        
//        difference() {
//            translate([-(1.5+pcb_gap+pcb_thickness+pcb_tol+1.5),-1.5,0])
//                cube([1.5,(1.5+pcb_height+pcb_tol+1.5),width],false);
//            
//            translate([-(1.5+pcb_gap+pcb_thickness+pcb_tol+1.5),1.5,3])
//                cube([1.5,(pcb_height+pcb_tol-3),(width-3)],false);
//            
//            translate([-(1.5+pcb_gap+pcb_thickness+pcb_tol+1.5),48,0])
//                cube([1.5,14,(width)],false);
//            
//        }
    
//***********************  PCB TRAY SUPPORT *****************
    
     difference() {
         union() {
         translate([0,pcb_offset,0]) {
             difference() {
                union() {
                    hull() {
                        translate([15+1,45-2,0]) {
                            cylinder(h=width, r=2, center=false);}
        
                        translate([12+1,37.5,0]) {
                            cube([5,1,width], center=false);}
        
                        translate([12+1,45-1,0]) {
                            cube([1,1,width], center=false);}
                    }
        
                    hull() {
                        translate([16+1,35.7,0]) {
                            cylinder(h=width, r=1, center=false);}
        
                        translate([14.2+1,37.5,0]) {
                            cube([2.8,1,width], center=false);}
                    }
        
                    hull() {
                        translate([18.5+1,0.5,0]) {
                            cylinder(h=width, r=0.5, center=false);}
                        translate([14.5+1,3.8,0]) {
                            cylinder(h=width, r=0.3, center=false);}
                        translate([14.2+1,0,0]) {
                            cube([1,1,width], center=false);}
                    }
        
                    cube([3.5,4,width], center=false);
                    cube([15+1,2,width], center=false);
        
                    hull() {
                        translate([12+1,4,0]) {
                            cylinder(h=width, r=1, center=false);}
        
                        translate([0,3,0]) {
                            cube([1,1,width], center=false);}
        
                        translate([0,45-1,0]) {
                            cube([13+1,1,width], center=false);}
                    }
        
                    hull() {
                    translate([0,40,0]) {
                        cube([14,1,width], center=false);}
        
                    translate([0,50+16,0]) {
                        cube([4,4,width], center=false);}
        
                    translate([6,50+18,0]) {
                        cylinder(h=width, r=2, center=false);}
                    }
        
                }
                // Clip fillet
                translate([3.5,2.5,-1]) {
                    cylinder(h=width+2, r=0.5, center=false);}
                
                // Lock Screw and Nut
                translate([10,-1,width/2]) rotate([-90,0,0]){
                    cylinder(h=lock_screw_length+3, r=r_lock_screw, center=false);}
        
                translate([6.15+1,5,-1]) {
                    cube([5.7,lock_nut_height,width+2], center=false);}
        
           }
       }
       }
 
       //***********************  LOGO  *****************


        union() {
         translate([5,40,0]) rotate([0,0,90]){
             mirror([1,0,0]) {
                difference() {
                    cylinder(h=2,d=10*scale,false,$fn=100);
                    
                    cylinder(h=2,d=8*scale,false,$fn=100);
                }
                
                difference() {
                    cylinder(h=2,d=6*scale,false,$fn=100);
                    
                    cylinder(h=2,d=5*scale,false,$fn=100);
                   
                }
                
                translate([-1.5*scale,0,.5])
                    cube([3*scale,.5*scale,1],true);
                 
            
                translate([1.2*scale,-4*scale,0])
                cube([1*scale,8*scale,2],false);
            }
                
            translate([20*scale,0,0]) 
                mirror([1,0,0]) {
                    linear_extrude(height = 1)
                        text("2019",size = (3*scale),font = "Arial:style=Black",valign = "center");
               }
               
        }
      }
    //*****************************************************

    }
}