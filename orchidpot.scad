

num_columns = 30;
col_diameter = 5;
pot_diameter = 100;
pot_height = 100;

col_radius = col_diameter / 2;
pot_radius = pot_diameter/2;


for(i=[1:num_columns]){
    linear_extrude(100, center=false, twist = 20, convexity = 10){
        rotate([0,0,i* 360/num_columns]){
            translate([pot_radius, 0, 0]){
                circle(col_radius, $fn = 4);
            }
        }
    }
}

for(i=[1:num_columns]){
    linear_extrude(100, center=false, twist = -720/num_columns){
        rotate([0,0,i* 360/num_columns]){
            translate([pot_radius *.95, 0, 0]){
                circle(col_radius *.75, $fn = 20);
            }
        }
    }
}
