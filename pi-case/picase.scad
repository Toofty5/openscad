$fn=30;
model_top();
//model_bottom();

module model_bottom(){
    bottom();
    color("green", 0.3)
    translate([0,49,20])
        rotate([180,0,0]) 
            top();
}


module model_top(){
    top();

    color("green", 0.3)
    translate([-17.5,49,0]) 
        rotate([0,0,180]) bottom();

    translate([-9, 6, 10])
        rotate([-90, 0, 0])
            cylinder(d=5, h=35);

}

module top(){
    difference() {
        //outer shell
        translate([0,0,-2])
            minkowski() {
                cube([80,49,8]);
                cylinder(r=6.5 , h=14);
            }
        
        translate([0,0,0])
            minkowski() {
                cube([80,49,11]);
                cylinder(r=5, h=15);
            }


        //ports
        translate([0,0,0]){
            translate([8.7, 55, 21])
                usb_c();
            translate([23.5, 55, 21])
                mini_hdmi();
            translate([37, 55, 21])
                mini_hdmi();
            translate([51.5, 55, 10])
                audio_jack();
            translate([3.7, 53, 14])
                cube([51.3, 4, 8]);
        }


        //chamfer
        translate([-7, 50, -2.5])
            rotate([90, 0, 0])
                linear_extrude(51) 
                    polygon([[0,0], [5, 5], [0, 5]]);

        //rear opening
        translate([-10,-4,0])
            cube([10,57,30]);

        //top vent
        translate([10, 10, -3]){
            difference(){
                cube([50, 40, 10]);

                for (i=[-6:1:10]) {
                    translate([i*6, 0, 0])
                        rotate([0,0,-45])
                            cube([2, 150, 4]);
                }

            }
        }

        //ports cutout
        #translate([79,0,0]) cube([30, 50, 30]);
    }

    //knuckle
    difference(){
        translate([-14, 15.5, -2]) {
            intersection(){
                {
                    cube([10, 18, 20]);
                    translate([5,0,10])
                        rotate([-90,0,0]) 
                            cylinder(r=8, h=30);
                }
            }
            difference(){
                cube([10, 18, 7]);
                rotate([0,45,0]) cube([4, 50, 4], center=true);
            }
        }
        //pivot
        translate([-9, 6, 10])
            rotate([-90, 0, 0])
                cylinder(d=6, h=35);
    }
}

module bottom(){
    difference(){
        union(){
            //bottom plate
            translate([0,0,-2])
                minkowski() {
                    cube([80,49,1]);
                    cylinder(r=6.5, h=1);
                }

                //racetrack
                difference(){
                    minkowski() {
                        cube([80,49,1]);
                        cylinder(r=5, h=1);
                    }

                    
                    translate([0,0,-.1])
                        minkowski() {
                            cube([80,49,3]);
                            cylinder(r=4, h=1);
                        }

                    translate([-6, 15, -.1]) 
                        cube([10,19,5]);
                    
                }
                //port cutout cover
                translate([3.7, -6, 0])
                    cube([51.3, 2, 5]);

            //standoffs
            for (i= [   [1,0,0],
                        [1,49,0],
                        [59,0,0],
                        [59,49,0]   ])
                translate(i) 
                    difference()
                        cylinder(d1=8, d2=6, h=2);
                    
        }

       
        //standoff holes
        for (i= [   [1,0,-1.8],
                    [1,49,-1.8],
                    [59,0,-1.8],
                    [59,49,-1.8]   ])
            translate(i) 
                difference()
                    cylinder(d=2.5, h=10);

        //chamfer
        translate([-6.25, 70, -2.5])
            rotate([90, 0, 0])
                linear_extrude(100) 
                    polygon([[0,0], [3, 3], [0, 3]]);
    }

    //hinge knuckles
    translate([-3.5, 10, -2]) knuckle();
    translate([-3.5,39,-2]) mirror([0,1,0]) knuckle();
    
    translate([-8.5, 6, 10])
        rotate([-90, 0, 0])
            cylinder(d=5, h=35);
}
module knuckle(){
    intersection() {
        
        difference(){
            linear_extrude(24){
                difference(){
                    union(){
                        translate([0, -4]) circle(r=10);
                        translate([-10,-4]) square([10,14]);
                    }
                    translate([0, -15]) square([30, 30]);
                    translate([-11,5]) square([30, 30]);
                }
            }

            translate([-11, -15, 4])
                rotate([-90, 0, 0])
                    linear_extrude(30) 
                        polygon([[0,0],[5,5],[0, 5]]);
        }

        union(){
            translate([0, 0, 4]){
                translate([0,20,10])
                    rotate([90, 0, 0])
                        cylinder(r=10, h=50);
                translate([-10, -30, -10]) 
                    cube([20,50, 20]);
            }
        }
    }
}


//cutouts for jacks.  create at center point
module usb_c(){
    cube([10, 10, 22], center = true);
}

module mini_hdmi(){
    cube([7, 7, 22], center= true);
}

module audio_jack(){
    rotate([90, 0, 0]) cylinder(d=7, h=10, center=true);
    translate([-3.5, -5, 0]) cube([7, 10, 15]);
}
