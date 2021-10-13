#include <speedloader_1b.scad>

difference(){
    //top bump
    intersection(){
        union(){
            translate([0,0,25]) sphere(18);
            cylinder(30, r=50);
        }
        union(){
            cylinder(50,r=16);
            
            //barrels
            for(i=[0:5]){
                rotate(72*i){
                    translate([16,0,0]) cylinder(30, r=8);
                }
            }
        }
    }
    //slots and chambers
    for(i=[0:5]){
        rotate(72*i){
            translate([16,0,-1]) cylinder(42, d=13.25);
            translate([4, -1.25, 20]) cube([10, 2.5, 25]);
        }
    }
    
    //center channel
    union() {
        $fn=20;
        translate([0,0,-1]) cylinder(21, d=6);        
        cylinder(41, d=4);
        translate([0,0,20]) cylinder(d1=6, d2=0, h=6);
        translate([0,0,24]) cylinder(30, d=9);
    }

}
