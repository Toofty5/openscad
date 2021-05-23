translate([14, 8, 2]){
    difference(){
        union(){
            translate([4, 8, 6]){
                rotate([90, 0, 0]){
                    cylinder(8, r=4, $fn=30);
                }
            }
            cube([8,8, 6]);
        }
        translate([4, 8, 6]){
            rotate([90, 0, 0]){
                cylinder(10, r=1, $fn=10);
            }
        }
    }
}

difference(){
    cube([24, 25, 2]);
    union(){
        translate([2, 2, -1]){
            cylinder(4, r=1, $fn=10);
        }
        
        translate([2, 23, -1]){
            cylinder(4, r=1, $fn=10);
        }
        
        translate([16, 23, -1]){
            cylinder(4, r=1, $fn=10);
        }
        translate([16, 2, -1]){
            cylinder(4, r=1, $fn=10);
        }
    }
}
