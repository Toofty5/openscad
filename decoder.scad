$fn=100;
SCREW=4;

charset="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
len=len(charset);

dia=80;

body();
//spinner();
translate([0,0,2.5]) spinner();


module body() {
    difference(){
        union(){
            for(i=[0:len]){
                r=-i*360/len;
                rotate([0,0,r+180/len]) translate([dia*.42,0,4.5]) rotate([0,0,-90]) 
                    linear_extrude(1) text(charset[i],5.5,halign="center");
            }
            difference(){
                cylinder(5, d=dia);

                for(i=[0:len]){
                    r=-i*360/len;
                    rotate([0,0,r]) translate([dia*.5,0,5]) cube([40,1,2], center=true);
                }

                translate([0,0,2]) cylinder(4,d=dia*.8);
            }
            translate([0,0,2]) cylinder(.5,d=dia*.45);
            cylinder(6,d=9.5);
        }
        translate([0,0,-1]) cylinder(8,d=SCREW);
    }
}
     //   translate([0,0,-1]) cylinder(10,d=SCREW);
module spinner(){
    difference(){
        cylinder(4, d=dia*.79);

        for(i=[0:len]){
            r=-i*360/len;
            rotate([0,0,r]) translate([dia*.5,0,4]) cube([50,.7,2], center=true);
        }
        translate([0,0,-1]) cylinder(8,d=10);
        translate([0,0,3]) cylinder(5,d=45);
    }
    for(i=[0:len]){
        r=-i*360/len;
        rotate([0,0,r+180/len]) translate([dia*.3,0,4]) rotate([0,0,-90]) 
            linear_extrude(.5) text(charset[i],5,halign="center");
    }

}
