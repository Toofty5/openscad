thickness = 2; //wall thickness

module tube(radius, height, slot_width=10){
    difference(){
        cylinder(height, r=radius + thickness);
        translate([0,0,thickness]) 
            cylinder(height, r=radius);
        translate([radius-thickness,-slot_width/2,thickness])
            cube([slot_width, slot_width, height]);
        
        translate([0,0,height])
            rotate([0, 30, 0])
                cube([radius * 10, radius*3, radius*2], center=true);
    }
    
}


module marker_holder(num_tubes, diameter, height = 90){
    radius = diameter / 2;

    difference(){
        union(){
            for(i=[0:num_tubes-1]) {
                translate([0, i * (2 * radius + thickness), 0])
                    tube(radius, height, slot_width = diameter / 2);
            }
            
            difference(){
                translate([-(radius+thickness *2), 0, 0])
                    cube([radius+2,(num_tubes-1) * (2*radius +thickness), height*.75]);
                
                for(i=[0:num_tubes-1]) {
                    translate([0, i * (2 * radius + thickness), 0])
                        cylinder(r=radius, h=height);
                }
            }
        }
        
        translate([-(radius+thickness/2), 7, height*.75 - 7])
            rotate([0,-90,0])
                cylinder(r=3.5, h=4);
        translate([-(radius + thickness/2), (num_tubes-1) * (2*radius +thickness) - 7, height*.75 - 7])
            rotate([0,-90,0])
                cylinder(r=3.5, h=4);    
    }
}
/*
diameter = 10;
height = 90;
num_tubes = 5;

marker_holder(5, 10, 90);
*/