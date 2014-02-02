/*
 * openscad celtic knot library
 * Copyright 2014 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * Sample of a simple bracelet
 */

use <celtic-knots.scad>

// radius=30 for a child
radius=30;
segments = 10;
inset = 0.2;


angle = 360/segments;
w = radius*sin(angle/2);
l = radius*cos(angle/2);
tile_width = w*2/6;
height = tile_width*3.5;
gap = tile_width*.1;

cylinder(r = radius, h = height, center = true, $fn = segments);

for (i = [ 0 : segments-1 ]) {
  difference() {
    rotate([-90, 0, i*angle]) translate([0, 0, l])
      fine_knot([ "-rqrq--r",
                  "wtdsYewt",
                  "fa__fafa" ],
                tile_width = tile_width, gap = gap, tile_height = inset);
    rotate([0, 180, (+0.5+i)*angle]) translate([0,0,-radius]) cube(radius*2);
    rotate([0,   0, (-0.5+i)*angle]) translate([0,0,-radius]) cube(radius*2);
  }
}

echo("length = ", l*segments);
echo("height = ", height);
echo("gap = ", gap);
