$fn=100;
difference(){
    union(){
        translate([25, 0, 2])
            cube([50, 20, 8], center=true);
        translate([0, 0, 15]) rotate([0, 90, 0])
            cylinder(50, r=15);
    }
    
    union(){
        translate([-1, 0, 15])rotate([0, 90, 0])
            cylinder(60, r=13);
        difference(){
            translate([24, 0, 30])
                cube([55, 10, 10], center = true);
            translate([20,-5,28.1]) rotate([0,90,0])
                cylinder(40, r=1, center = true);
            translate([20,5,28.1]) rotate([0,90,0])
                cylinder(40, r=1, center = true);
        }
        translate([65, 0,30]) rotate([0, 60, 0]) 
            cube([55, 55, 55], center= true);
        translate([-10,0,43]) rotate([0,50, 0])
            cube([40, 40, 40], center = true);
        
        translate([16,0,0])
            screw();
        translate([28,0,0])
            screw();
    }
}

module screw(){
    union(){
        translate([0,0,-9])
            cylinder(10, r=2);
        cylinder(4, r1=2, r2=5);
    }
}