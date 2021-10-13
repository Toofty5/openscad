WALL_T = 2;
TOL=.5;
$fn=30;

void_w = 57+TOL;
void_h = 41+TOL;
void_l = 21+TOL;

bottom = [[0,0],[void_w, 0], [void_w, void_l], [0, void_l]];
difference(){
    union(){
        difference(){
            linear_extrude(void_h+ 2*WALL_T){
                hull() {
                    for(i=bottom){
                        translate(i) circle(WALL_T);
                    }
                }
            }

            translate([-WALL_T-.05,0,WALL_T]) cube([void_w+WALL_T, void_l, void_h]);

            //top
            hull(){
                translate([12, void_l/2, void_h]) cylinder(d=20, h=10);
                translate([-WALL_T-.05, 0, void_h]) cube([5, void_l-1, 10]);
                translate([-WALL_T-.05, -15, void_h]) cube ([30,void_l/2,10]);

            }
            //front
            hull(){
                translate([43, 1, 27+ WALL_T]) rotate([90,0,0]) cylinder(d=27, h=10);
                height=2;
                translate([-WALL_T-.05, -WALL_T-.05, WALL_T+height]) cube([25, 10, void_h-height]);
            }
        }
        //translate([-WALL_T, void_l, void_h/2 + WALL_T - 10]) linear_extrude(20) polygon([[0,0], [2, 0], [0, -1]]);
        translate([-WALL_T/2, void_l, void_h/2 + WALL_T - 10]) {
            cylinder(d=2, h=20);
            sphere(d=2);
            translate([0,0,20]) sphere(d=2);
        }
        
        translate([void_w/2, void_l/2, -7]) cylinder(d1=18, d2=24, h=7);
    }

    translate([void_w/2, void_l/2, WALL_T-4.9]) union(){
        cylinder($fn=6, d=12, h=5);
        translate([0,0,-9.9])cylinder(d=6, h=10);
    }
    
}


