*translate([0,0,-30]){
    include </home/jay/cura/openscad/speedloader/speedloader_2a.scad>
}





$fn=30;
difference(){
    union(){
        //pushers
        for(i=[0:5]){
            rotate(72*i){
                //translate([-2.5,-0.75,45]) rotate([0,70,0]) cube([40,1.5,7]);
                fin();
                translate([16,0,0]) cylinder(12, r=5);
                translate([16,0,12]) sphere(5);
            }
        }
        //center
        translate([0,0,15]) cylinder(35, d=9);
        translate([0,0,50]) cylinder(5, d1=9, d2=13);
        translate([0,0,55]) cylinder(3, d=13);
        translate([0,0,58]) cylinder(1, d1=13, d2=12);
    }
    cylinder(60,d=4);
    translate([0,0,16]) cylinder(50, d=7);
    translate([-30,-30,-.1]) cube([60,60,4]);
}

module fin() {
    points = [[0,25],[12,4],[20,12], [4.5, 53]];

    rotate([90,0,0]){
        translate([0,0,-.75]){
            linear_extrude(height=1.5){
                polygon(points);
            }
        }
    }
}