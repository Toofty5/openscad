*translate([0,0,-40]){
    include </home/jay/cura/openscad/speedloader.scad>
}





$fn=30;
union(){
    //pushers
    for(i=[0:5]){
        rotate(72*i){
            translate([2,-0.75,34]) cube([16,1.5,16]);
            translate([16,0,0]) cylinder(50, r=5);
        }
    }
    
    //center
    difference(){
        translate([0,0,34]) {
            difference(){
                cylinder(16, d=8);
                translate([0,0,-0.1]) cylinder(20,d=2.75);
            }
        }
    }
    
}
    