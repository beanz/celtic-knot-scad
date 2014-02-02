/*
 * openscad celtic knot library
 * Copyright 2014 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * Sample of a simple pendant
 */

use <celtic-knots.scad>

tile_width = 5;
tile_height = 2.5;
pointy = true;

// define the shape of the knot
k = [ (pointy ? "  <~>  " : "  ,~.  "),
                "  !&;  ",
      (pointy ? "<~w&e~>" : ",~w&e~."),
                "|(&&&):",
      (pointy ? "[-a&s-]" : "{-a&s-}"),
                "  !&;  ",
                "  !&;  ", // or try "  |X:  "
                "  !&;  ",
      (pointy ? "  [-]  " : "  {-}  ")];

// half height with no gap so it isn't in pieces
knot(k, tile_width = tile_width, tile_height = tile_height/2, gap = 0);

// full height with a gap
knot(k, tile_width = tile_width, tile_height = tile_height, gap = 1);

// loop for threading
translate([0, tile_width*8, 0])
  difference() {
    cylinder(r = tile_width, h = tile_height/2);
    cylinder(r = tile_width/2, h = tile_height*3, center = true);
  }