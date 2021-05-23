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
            
            
            difference(){
                translate([0, -1.25, 0]) cube([10, 2.5, 50]);
                translate([-18, -1.5, 0]) rotate([0,45,0]) cube([20,3,20]);
            }
            
        }
    }       
    //center channel
    translate([0,0,6]) cylinder(40, d=10);
    translate([0,0,1]) cylinder(10, d=2.5);

}
