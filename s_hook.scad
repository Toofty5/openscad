small_diameter = 8;
small_extension = 20;
large_diameter = 12;
large_extension = 150;

middle_length = 180;

pipe_diameter = 5;
trunc_thickness = 8;

module cross_section() {
  intersection() {
    square([pipe_diameter * 2, trunc_thickness], center=true);
    circle(pipe_diameter);
  }
}
module half_cross_section() {
  intersection() {
    translate([pipe_diameter,0,0])
      square([pipe_diameter * 2, trunc_thickness], center=true);
    circle(pipe_diameter);
  }
}

module cap(length) {
  translate([0,length,0])
    rotate_extrude(angle=180, convexity = 10)
      half_cross_section();
  rotate([-90,0,0])
    linear_extrude(length)
      cross_section();
}
module small_hook() {
  small_minor_diameter = small_diameter + pipe_diameter;
  translate([-small_minor_diameter,0,0]) {
    rotate_extrude(angle=-180, convexity = 10) 
      translate([small_minor_diameter,0,0])
        cross_section();
    translate([-small_minor_diameter,0,0]) cap(small_extension);
  }
}

module large_hook() {
  rotate([0,0,180]) {
    large_minor_diameter = large_diameter + pipe_diameter;
    translate([-large_minor_diameter,0,0]) {
      rotate_extrude(angle=-180, convexity = 10) 
        translate([large_minor_diameter,0,0])
          cross_section();
      translate([-large_minor_diameter,0,0]) cap(large_extension);
    }
  }
}
module middle(length) {
  rotate([-90,0,0])
    linear_extrude(length)
      cross_section();
}

module main(){
  small_hook();
  translate([0,middle_length,0])
    large_hook();
  middle(middle_length);
}

main();
