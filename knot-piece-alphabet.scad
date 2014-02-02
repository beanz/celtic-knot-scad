/*
 * openscad celtic knot library
 * Copyright 2014 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * Sample of the "alphabet" for knot pieces (two by two tiles)
 *
 * <~>
 * !&;
 * [-]
 *
 */

use <celtic-knots.scad>
use <Write.scad>

sw = 5;
sh = 2.5;

translate([-sw*9, +sw*13, 0]) char_block("<>[]");
translate([-sw*3, +sw*13, 0]) char_block(",.{}");
translate([+sw*3, +sw*13, 0]) char_block("~=-_");
translate([+sw*9, +sw*13, 0]) char_block("!;|:");

translate([-sw*9, +sw*5, 0]) char_block("nu()");
translate([-sw*3, +sw*5, 0]) char_block("XxO#");
translate([+sw*3, +sw*5, 0]) char_block("qpdb");
translate([+sw*9, +sw*5, 0]) char_block("QPDB");

translate([-sw*9, -sw*3, 0]) char_block("weas");
translate([-sw*3, -sw*3, 0]) char_block("ikjl");
translate([+sw*3, -sw*3, 0]) char_block("IKJL");
translate([+sw*9, -sw*3, 0]) char_block("&&&&");

translate([-sw*3, -sw*11, 0]) char_block("tgfh");
translate([+sw*3, -sw*11, 0]) char_block("TGFH");

module char_block(c) {
  translate([-sw*1.2, +sw*2, 0]) sample_piece(c[0]);
  translate([+sw*1.2, +sw*2, 0]) sample_piece(c[1]);
  translate([-sw*1.2, -sw*2, 0]) sample_piece_alt(c[2]);
  translate([+sw*1.2, -sw*2, 0]) sample_piece_alt(c[3]);
}

module sample_piece(c) {
  write(c, center = true);
  translate([-sw, -sw*.5, 0]) {
    knot_piece(c, tile_width = sw);
    color("lightgrey") knot_piece_boundary(sw);
  }
}

module sample_piece_alt(c) {
  translate([0, -sw*1.5, 0]) write(c, center = true);
  translate([-sw, sw, 0]) {
    knot_piece(c, tile_width = sw);
    color("lightgrey") knot_piece_boundary(sw);
  }
}
