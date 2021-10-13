thickness = 5;
hole_size = 5;
offset = 4;
width = 25;
height = 18;
$fn = 30;


corner = [  [0,0,0], [width, 0,0], [width, height, 0], [0,height,0] ];

plate_left();
translate([10,0,0])  plate_right();

module full_plate() {
    intersection(){
        difference(){
            hull(){
                for (i=corner){
                    translate(i) cylinder(thickness, d = hole_size + offset);
                }
            }
            for(i = corner){
                translate(i) cylinder(3*thickness, d = hole_size, center=true);
            }
        }
        $fn=80;
        translate([width/2, -height, -44]) rotate([-90,0,0]) cylinder(3*height, d=100); 
    }
}

module plate_left() {
    intersection(){
        //translate([-offset, -offset, ]) cube([width/2 + offset, height + 2*offset, thickness]);
        difference(){
            full_plate();
            translate([width/2 - 8, -1, thickness/3]) cube([4, height+2, thickness]);
            
            translate([width/2 - 4, height+1, thickness/3]) rotate([90,0,0])
            linear_extrude(height = height+2){
                polygon([[0,0], [1.8,0], [0, 2*thickness/3]]);
            }

        }
        translate([width/2,-25, thickness-1.2]) rotate([0,200,0]) cube([50,50,50]);
    }
}
module plate_right() {
    intersection(){
        translate([width/2, -offset, ]) cube([width/2 + offset, height + 2*offset, thickness]);
        full_plate();

    }
    difference(){
        translate([width/2, height, thickness]) scale([1,1,.75]) {
            rotate([90,0,0]) cylinder(height, r=8);

            //scale([1, .5, 1]) sphere(r=8);
             //translate([0,-height,0]) scale([1, .5, 1]) sphere(r=8);
        }
        translate([0,-10,-10]) cube([50, 50, thickness+10]);
        translate([width/2,height/2,thickness + 5.5]) rotate([0,0,-90]) 
             linear_extrude(height = 5) 
                 text("Tristan" , size = 3.5, halign="center",valign="center", 
                     font="Comic Sans MS:style=Bold");
    }

        translate([width/2 - 8, 0, thickness/2]) cube([2, height, thickness/2]);
        translate([width/2 - 6,height, thickness/2]) rotate([90,0,0])

        linear_extrude(height = height){
            polygon([[0,0], [2,0], [0, 2*thickness/2]]);
        }

}


module paddle(offset=0) {
    linear_extrude(height=thickness) {
        offset(delta = offset){
            translate([0,-height/10]) square([width/3, height/5]);
            translate([width/3, 0]) circle( d = height/3);
        }
    }
}
