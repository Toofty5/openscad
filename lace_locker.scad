width=30;
height=18;
$fn=30;

thickness = 4;
margin = 6;
dovetail_span = 10;


clip();
//translate([width, height, 0]) rotate([0,0,180]) clip();


module clip() {
    difference(){
        union(){
            intersection(){
                clip_blank();
                dovetail();
            }
            translate([width/2 - dovetail_span*.80, -margin, 0]) shelf();
        }
        
        translate([width/2, -margin, 0]) shelf();
        
        
        translate([9,height/2,thickness-.5])  
            rotate([0,0,90]) 
                linear_extrude(height=1) text(text="Tristan", size=5, halign = "center");
       
    }
}

module shelf(){
    cube([dovetail_span/2, height + 2*margin, thickness/2]);
}

module clip_blank(){
    corners = [[0,0,0],[width,0,0],[width,height,0],[0,height,0]];
    
    difference(){
        hull(){
            for (point=corners)
            translate(point) cylinder(thickness, r = margin);
        }
        
        for(point=corners)
            translate([0,0,-.1]) translate(point) cylinder(thickness + .2, d=5);
        
    }
    
}

//currently only for 1.5 dovetails.  Maybe later I'll parameterize that instead of the giant point array.
module dovetail() {
    full_height = height + (2*margin);
    pitch = .6;
    dovetail_crown = full_height / (1.5 + (1.5*pitch));
    dovetail_base = dovetail_crown * pitch;
    dovetail_left = (width-dovetail_span)/2;
    dovetail_right = (width+dovetail_span)/2;
    tolerance = -.15;
    
    points = [  [-margin+tolerance,-margin+tolerance], 
                [dovetail_right, - margin+tolerance],
                [dovetail_right, -margin + dovetail_crown/2],
                [dovetail_left, -margin + dovetail_base/2],
                [dovetail_left, -margin + dovetail_base/2 + dovetail_crown], 
                [dovetail_right, -margin + dovetail_crown/2 + dovetail_base] ,
                [dovetail_right, -margin + 1.5*dovetail_crown + dovetail_base] ,
                [dovetail_left, -margin + dovetail_crown + 1.5*dovetail_base], 
                [dovetail_left, -margin + 1.5*dovetail_crown + 1.5*dovetail_base-tolerance],
                [-margin+tolerance , height + margin-tolerance ]
    ];
    
    linear_extrude(height = thickness) offset(delta = tolerance) polygon(points);
}
    