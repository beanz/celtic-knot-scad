/*
 * openscad celtic knot library
 * Copyright 2014 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * Sample of the "alphabet" for knot tiles
 *
 * <rq>
 * AtYF
 * EGhW
 * [sd]
 *
 */

use <celtic-knots.scad>
use <Write.scad>

sw = 5;

translate([-sw*8, +sw*8, 0]) {
  block_group("Corners", ",.{}", "<>[]");
}

translate([+sw*3, +sw*8, 0]) {
  block_group("Curves", "qwas", "QWAS");
}

translate([-sw*8, 0, 0]) {
  block_group("Cut Curves", "erdf", "ERDF");
}

translate([+sw*3, 0, 0]) {
  block_group("Cut Slopes", "tygh", "TYGH");
}

translate([0, -sw*8, 0]) {
  translate([0, +sw*3.8, 0]) write("Edges", center = true);
  char_block("-_|!");
}

module block_group(title, a, b) {
  translate([+sw*2.5, +sw*3.8, 0]) write(title, center = true);
  char_block(a);
  translate([+sw*5, 0, 0]) char_block(b);
}

module char_block(c) {
    translate([-sw, +sw*1.5, 0]) { 
      sample_tile(c[0]);
      translate([0, sw*1.3, 0]) write(c[0], center = true);
    }
    translate([+sw, +sw*1.5, 0]) { 
      sample_tile(c[1]);
      translate([0, sw*1.3, 0]) write(c[1], center = true);
    }
    translate([-sw, -sw*1.5, 0]) { 
      write(c[2], center = true);
      translate([0, sw*1.3, 0]) sample_tile(c[2]);
    }
    translate([+sw, -sw*1.5, 0]) { 
      write(c[3], center = true);
      translate([0, sw*1.3, 0]) sample_tile(c[3]);
    }

}

module sample_tile(c) {
  knot_tile(c, tile_width = sw);
  color("lightgrey") knot_tile_boundary(sw);
}
  