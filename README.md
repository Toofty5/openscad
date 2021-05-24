This repository contains the various objects I've designed in OpenSCAD.  OpenSCAD (https://openscad.org/) is a code-based CAD modeling program that I use for making 3D print models.  


There is no interaction with the model by mouse other than controlling the view.  Instead, you enter lines of code such as:

            difference(){
                translate([0, -1.25, 0]) cube([10, 2.5, 50]);
                translate([-18, -1.5, 0]) rotate([0,45,0]) cube([20,3,20]);
            }

Instead of compiling a program, OpenSCAD renders a model.

At first it seems like a hassle, but once you start leveraging the programmatic aspects of the program and start introducing things like variables, loops, and functions, the payoffs start to add up, such as:

            for(i=[0:num_tubes-1]) {
                translate([0, i * (2 * radius + thickness), 0])
                    tube(radius, height, slot_width = diameter / 2);
            }

This excerpt is from markerholder.scad, which allows you to adjust the number of markers you would like to hold, along with their dimensions.  Some modeling programs do account for repetition and scaling, but they're usually buried in the pile of other UI features.  The code-based nature of modeling in OpenSCAD means you can dig through documentation rather than a complex UI.
