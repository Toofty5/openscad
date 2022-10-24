$fn=150;
RIDGE_H = 2.5;
RIDGE_W1 = 4.2;
RIDGE_W2 = 2.5;
RIDGE_SPACING = 16;
DIAMETER = 80;
RADIUS=DIAMETER/2;
MIDDLE=3;

module ridge_profile() {
  polygon([[-RIDGE_W1,0], [RIDGE_W1,0], [RIDGE_W2, RIDGE_H], [-RIDGE_W2,RIDGE_H]]);
}

module bar(length, turn=false) {
  rotate([90,0,-90* (turn ? 1 : 0)]) 
    translate([0,0,-length])
      linear_extrude(length) 
          ridge_profile();
  
}
module ridges() {
  intersection() {
    translate([-RADIUS, -RADIUS, 0])
      union() {
        for (i=[0:RIDGE_SPACING:DIAMETER]) {
          translate([i,0,0])
            bar(DIAMETER);
        }

        for (i=[0:RIDGE_SPACING:DIAMETER]) {
          translate([0,i,0])
            bar(DIAMETER, turn=true);
        }
      }
    cylinder(RIDGE_H, d=DIAMETER);
  }


  rotate_extrude(convexity=10) {
    translate([RADIUS,0])
      ridge_profile();
  }
}
translate([0,0,MIDDLE])
  ridges();
rotate([180,0,0])
  ridges();
cylinder(MIDDLE, d=DIAMETER+2*RIDGE_W1);
