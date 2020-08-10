/*
 * openscad celtic knot library
 * Copyright 2014 Mark Hindess
 *
 * This work is licensed under a Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 *
 * Based loosely on http://nrich.maths.org/5365
 */

knot_test = 1;
sp = 22.5;
if (knot_test == 1) {

  translate([ -sp*2, +sp*3, 0]) knot([ "<=>", "|Q;", "[-]" ]);
  translate([ -sp*1, +sp*3, 0]) knot([ "<=>", "|q;", "[-]" ]);
  translate([ +sp*0, +sp*3, 0]) knot([ "<=>", "!n;", "[-]" ]);
  translate([ +sp*1, +sp*3, 0]) knot([ "<=>", "!p:", "[-]" ]);
  translate([ +sp*2, +sp*3, 0]) knot([ "<=>", "!P:", "[-]" ]);

  translate([ -sp*2, +sp*2, 0]) knot([ "<=>", "|f;", "[_]" ]);
  translate([ -sp*1, +sp*2, 0]) knot([ "<=>", "|t:", "[-]" ]);
  translate([ +sp*0, +sp*2, 0]) knot([ ",~.", "!&;", "{-}" ]);
  translate([ +sp*1, +sp*2, 0]) knot([ "<~>", "|g:", "[_]" ]);
  translate([ +sp*2, +sp*2, 0]) knot([ "<=>", "!h:", "[_]" ]);

  translate([ -sp*2, +sp*1, 0]) knot([ "<=>", "|j;", "[_]" ]);
  translate([ -sp*1, +sp*1, 0]) knot([ "<=>", "|i:", "[-]" ]);
  translate([ +sp*0, +sp*1, 0]) knot([ ",~.", "!&;", "{-}" ]);
  translate([ +sp*1, +sp*1, 0]) knot([ "<~>", "|k:", "[_]" ]);
  translate([ +sp*2, +sp*1, 0]) knot([ "<=>", "!l:", "[_]" ]);

  translate([ -sp*2, +sp*0, 0]) knot([ "<~>", "|(;", "[-]" ]);
  translate([ -sp*1, +sp*0, 0]) knot([ "<=>", "|O:", "[_]" ]);
  translate([ +sp*0, +sp*0, 0]) knot([ "<~>", "!&;", "[-]" ]);
  translate([ +sp*1, +sp*0, 0]) knot([ ",=.", "|#:", "{_}" ]);
  translate([ +sp*2, +sp*0, 0]) knot([ "<~>", "!):", "[-]" ]);
  
  translate([ -sp*2, -sp*1, 0]) knot([ "<=>", "|J;", "[_]" ]);
  translate([ -sp*1, -sp*1, 0]) knot([ "<=>", "|I:", "[-]" ]);
  translate([ +sp*0, -sp*1, 0]) knot([ ",~.", "|X:", "{-}" ]);
  translate([ +sp*1, -sp*1, 0]) knot([ "<~>", "|K:", "[_]" ]);
  translate([ +sp*2, -sp*1, 0]) knot([ "<=>", "!L:", "[_]" ]);

  translate([ -sp*2, -sp*2, 0]) knot([ "<=>", "|F;", "[_]" ]);
  translate([ -sp*1, -sp*2, 0]) knot([ "<=>", "|T:", "[-]" ]);
  translate([ +sp*0, -sp*2, 0]) knot([ ",=.", "!x;", "{_}" ]);
  translate([ +sp*1, -sp*2, 0]) knot([ "<~>", "|G:", "[_]" ]);
  translate([ +sp*2, -sp*2, 0]) knot([ "<=>", "!H:", "[_]" ]);

  translate([ -sp*2, -sp*3, 0]) knot([ "<~>", "|D;", "[_]" ]);
  translate([ -sp*1, -sp*3, 0]) knot([ "<~>", "|d;", "[_]" ]);
  translate([ +sp*0, -sp*3, 0]) knot([ "<~>", "!u;", "[_]" ]);
  translate([ +sp*1, -sp*3, 0]) knot([ "<~>", "!b:", "[_]" ]);
  translate([ +sp*2, -sp*3, 0]) knot([ "<~>", "!B:", "[_]" ]);

} else if (knot_test == 2) {

  knot([ "<~=~>",
         "!&n&;",
         "!&u&;",
         "[-_-]" ]);

} else if (knot_test == 3) {

  knot([ "  <~>  ",
         "<~w&e~>",
         "[-a&s-]",
         "  [-]  " ]);

} else if (knot_test == 4) {

  knot([ " <~> ",
         "<wue>",
         "!)+(;",
         "[ans]",
         " [-] " ], tile_height = 5, tile_width = 8);

} else if (knot_test == 5) {
  fine_knot([ ",rqrqrq>",
              "AtYtYtR!",
              "EGhGhGS!",
              "AtYtYtYF",
              "EGhGhGhW",
              "AtYtYtYF",
              "EafGhGhW",
              "[__sdsd}" ]);

  translate([0, 5*-8.2, 0] )
    knot([ ",~~~>",
           "!&&):",
           "!&&&;",
           "!u&&;",
           "[_--}" ]);

} else if (knot_test == 6) {

  difference() {
    cube([5*8, 5*4.3, 2], center = true);
    translate([0,0,.5])
      knot([ "~~~=",
             "&u&n",
             "-_--" ], tile_width = 5);
  }

} else if (knot_test == 7) {

  knot([ "~~~",
         "&u&",
         "-_-" ], tile_width = 5, gap = 1.1);

} else if (knot_test == 8) {

  fine_knot([ "rqrq--",
              "tdsYew",
              "a__faf" ], tile_width = 5, tile_height = 0.2, gap = 1.1);

}

module knot(knot, tile_width = 5, tile_height, ribbon_width, gap) {
  rth = tile_height != undef ? tile_height : tile_width/2;
  rrw = ribbon_width != undef ? ribbon_width : tile_width/sqrt(2);
  rgap = gap != undef ? gap : tile_width/(6*sqrt(2));

  x = len(knot[0]);
  y = len(knot);
  for (i=[0:x-1]) {
    for (j=[0:y-1]) {
      translate([(i-x/2)*tile_width*2, (y/2-j)*tile_width*2, 0])
        knot_piece(knot[j][i], tile_width, rth, rrw, rgap);
    }
  }
}

module fine_knot(knot, tile_width = 5, tile_height, ribbon_width, gap) {
  rth = tile_height != undef ? tile_height : tile_width/2;
  rrw = ribbon_width != undef ? ribbon_width : tile_width/sqrt(2);
  rgap = gap != undef ? gap : tile_width/(6*sqrt(2));

  x = len(knot[0]);
  y = len(knot);
  for (i=[0:x-1]) {
    for (j=[0:y-1]) {
      translate([(i-(x-1)/2)*tile_width, ((y-1)/2-j)*tile_width, 0])
        knot_tile(knot[j][i], tile_width, rth, rrw, rgap);
    }
  }
}

module knot_piece(c, tile_width = 5, tile_height, ribbon_width, gap) {
  rth = tile_height != undef ? tile_height : tile_width/2;
  rrw = ribbon_width != undef ? ribbon_width : tile_width/sqrt(2);
  rgap = gap != undef ? gap : tile_width/(6*sqrt(2));

  if (c == " ") {
  } else if (c == "<") {                              // top square corners
    make_knot_piece("   <", tile_width, rth, rrw, rgap);
  } else if (c == ">") {
    make_knot_piece("  > ", tile_width, rth, rrw, rgap);
  } else if (c == ",") {                              // top rounded corners
    make_knot_piece("   ,", tile_width, rth, rrw, rgap);
  } else if (c == ".") {
    make_knot_piece("  . ", tile_width, rth, rrw, rgap);

  } else if (c == "~") {                              // normal top piece
    make_knot_piece("  rq", tile_width, rth, rrw, rgap);
  } else if (c == "=") {                              // straight top piece
    make_knot_piece("  --", tile_width, rth, rrw, rgap);

  } else if (c == "!") {                             // normal left piece
    make_knot_piece(" A E", tile_width, rth, rrw, rgap);
  } else if (c == "|") {                             // straight left piece
    make_knot_piece(" | |", tile_width, rth, rrw, rgap);

  } else if (c == "&") {                             // normal internal piece
    make_knot_piece("tYGh", tile_width, rth, rrw, rgap);

  } else if (c == ";") {                             // normal right piece
    make_knot_piece("F W ", tile_width, rth, rrw, rgap);
  } else if (c == ":") {                             // straight right piece
    make_knot_piece("! ! ", tile_width, rth, rrw, rgap);

  } else if (c == "-") {                             // normal bottom piece
    make_knot_piece("sd  ", tile_width, rth, rrw, rgap);
  } else if (c == "_") {                             // straight bottom piece
    make_knot_piece("__  ", tile_width, rth, rrw, rgap);

  } else if (c == "[") {                             // bottom square corners
    make_knot_piece(" [  ", tile_width, rth, rrw, rgap);
  } else if (c == "]") {
    make_knot_piece("]   ", tile_width, rth, rrw, rgap);

  } else if (c == "{") {                             // bottom rounded corners
    make_knot_piece(" {  ", tile_width, rth, rrw, rgap);
  } else if (c == "}") {
    make_knot_piece("}   ", tile_width, rth, rrw, rgap);

  } else if (c == "n") {                        // top rounded internal piece
    make_knot_piece("ewGh", tile_width, rth, rrw, rgap);
  } else if (c == "u") {                        // bottom rounded internal piece
    make_knot_piece("tYaf", tile_width, rth, rrw, rgap);
  } else if (c == "(") {                        // left rounded internal piece
    make_knot_piece("QYDh", tile_width, rth, rrw, rgap);
  } else if (c == ")") {                        // right rounded internal piece
    make_knot_piece("tRGS", tile_width, rth, rrw, rgap);

  } else if (c == "X") {                        // crossing internal pieces
    make_knot_piece("QRDS", tile_width, rth, rrw, rgap);
  } else if (c == "x") {
    make_knot_piece("ewaf", tile_width, rth, rrw, rgap);

  } else if (c == "O") {                        // round internal loop piece
    make_knot_piece(",.{}", tile_width, rth, rrw, rgap);
  } else if (c == "#") {                        // square internal loop piece
    make_knot_piece("<>[]", tile_width, rth, rrw, rgap);


  } else if (c == "Q") {                        // two crossing internal pieces
                                                // (square if upper case)
    make_knot_piece("<wDh", tile_width, rth, rrw, rgap);
  } else if (c == "q") {
    make_knot_piece(",wDh", tile_width, rth, rrw, rgap);
  } else if (c == "p") {
    make_knot_piece("e.GS", tile_width, rth, rrw, rgap);
  } else if (c == "P") {
    make_knot_piece("e>GS", tile_width, rth, rrw, rgap);
  } else if (c == "D") {
    make_knot_piece("QY[f", tile_width, rth, rrw, rgap);
  } else if (c == "d") {
    make_knot_piece("QY{f", tile_width, rth, rrw, rgap);
  } else if (c == "B") {
    make_knot_piece("tRa]", tile_width, rth, rrw, rgap);
  } else if (c == "b") {
    make_knot_piece("tRa}", tile_width, rth, rrw, rgap);


  } else if (c == "i") {                        // loops open at one end
                                                // (square if upper case)
    make_knot_piece(",.DS", tile_width, rth, rrw, rgap);
  } else if (c == "I") {
    make_knot_piece("<>DS", tile_width, rth, rrw, rgap);
  } else if (c == "j") {
    make_knot_piece(",w{f", tile_width, rth, rrw, rgap);
  } else if (c == "J") {
    make_knot_piece("<w[f", tile_width, rth, rrw, rgap);
  } else if (c == "k") {
    make_knot_piece("QR{}", tile_width, rth, rrw, rgap);
  } else if (c == "K") {
    make_knot_piece("QR[]", tile_width, rth, rrw, rgap);
  } else if (c == "l") {
    make_knot_piece("e.a}", tile_width, rth, rrw, rgap);
  } else if (c == "L") {
    make_knot_piece("e>a]", tile_width, rth, rrw, rgap);


  } else if (c == "t") {                        // loops open at one end
                                                // (mix of round and square)
    make_knot_piece(",>DS", tile_width, rth, rrw, rgap);
  } else if (c == "T") {
    make_knot_piece("<.DS", tile_width, rth, rrw, rgap);
  } else if (c == "f") {
    make_knot_piece(",w[f", tile_width, rth, rrw, rgap);
  } else if (c == "F") {
    make_knot_piece("<w{f", tile_width, rth, rrw, rgap);
  } else if (c == "g") {
    make_knot_piece("QR{]", tile_width, rth, rrw, rgap);
  } else if (c == "G") {
    make_knot_piece("QR[}", tile_width, rth, rrw, rgap);
  } else if (c == "h") {
    make_knot_piece("e.a]", tile_width, rth, rrw, rgap);
  } else if (c == "H") {
    make_knot_piece("e>a}", tile_width, rth, rrw, rgap);

  } else if (c == "w") {                        // concave corners
    make_knot_piece(" Arh", tile_width, rth, rrw, rgap);
  } else if (c == "a") {
    make_knot_piece("sY E", tile_width, rth, rrw, rgap);
  } else if (c == "e") {
    make_knot_piece("F Gq", tile_width, rth, rrw, rgap);
  } else if (c == "s") {
    make_knot_piece("tdW ", tile_width, rth, rrw, rgap);

  } else {
    translate([tile_width,-tile_width,0])
      invalid_tile(tile_width, rth, rrw, rgap);
  }
}

module knot_tile(c, tile_width = 5, tile_height, ribbon_width, gap) {
  rth = tile_height != undef ? tile_height : tile_width/2;
  rrw = ribbon_width != undef ? ribbon_width : tile_width/sqrt(2);
  rgap = gap != undef ? gap : tile_width/(6*sqrt(2));

  if (c == " ") {                                                // Blank

  } else if (c == ",") {                                         // Corners
    rotate([0,0,90]) round_corner(tile_width, rth, rrw, rgap);
  } else if (c == "<") {
    rotate([0,0,90]) square_corner(tile_width, rth, rrw, rgap);
  } else if (c == ".") {
    round_corner(tile_width, rth, rrw, rgap);
  } else if (c == ">") {
    square_corner(tile_width, rth, rrw, rgap);
  } else if (c == "{") {
    rotate([0,0,180]) round_corner(tile_width, rth, rrw, rgap);
  } else if (c == "[") {
    rotate([0,0,180]) square_corner(tile_width, rth, rrw, rgap);
  } else if (c == "}") {
    rotate([0,0,-90]) round_corner(tile_width, rth, rrw, rgap);
  } else if (c == "]") {
    rotate([0,0,-90]) square_corner(tile_width, rth, rrw, rgap);

  } else if (c == "q") {                                         // Curves
    curve(tile_width, rth, rrw, rgap);
  } else if (c == "Q") {
    scale([1,-1,1]) rotate([0,0,90]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "w") {
    scale([-1,1,1]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "W") {
    rotate([0,0,-90]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "s") {
    rotate([0,0,180]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "S") {
    scale([-1,1,1]) rotate([0,0,90]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "a") {
    scale([1,-1,1]) curve(tile_width, rth, rrw, rgap);
  } else if (c == "A") {
    rotate([0,0,90]) curve(tile_width, rth, rrw, rgap);

  } else if (c == "e") {                                         // Cross Curves
    cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "E") {
    scale([1,-1,1]) rotate([0,0,90]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "r") {
    scale([-1,1,1]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "R") {
    rotate([0,0,-90]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "f") {
    rotate([0,0,180]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "F") {
    scale([-1,1,1]) rotate([0,0,90]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "d") {
    scale([1,-1,1]) cross_curve(tile_width, rth, rrw, rgap);
  } else if (c == "D") {
    rotate([0,0,90]) cross_curve(tile_width, rth, rrw, rgap);

  } else if (c == "t") {                                         // Cross
    cross(tile_width, rth, rrw, rgap);
  } else if (c == "T") {
    scale([1,-1,1]) rotate([0,0,90]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "y") {
    scale([-1,1,1]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "Y") {
    rotate([0,0,-90]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "h") {
    rotate([0,0,180]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "H") {
    scale([-1,1,1]) rotate([0,0,90]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "g") {
    scale([1,-1,1]) cross(tile_width, rth, rrw, rgap);
  } else if (c == "G") {
    rotate([0,0,90]) cross(tile_width, rth, rrw, rgap);

  } else if (c == "-") {                                         // Straight edge
    rotate([0,0,90]) straight(tile_width, rth, rrw, rgap);
  } else if (c == "_") {
    rotate([0,0,-90]) straight(tile_width, rth, rrw, rgap);
  } else if (c == "|") {
    rotate([0,0,180]) straight(tile_width, rth, rrw, rgap);
  } else if (c == "!") {
    straight(tile_width, rth, rrw, rgap);
  } else {

    invalid_tile(tile_width, rth, rrw, rgap);
  }
}

module knot_piece_boundary(tile_width = 5, tile_height) {
 // helper for alphabet only
 for (p = [ [tile_width*0.5, -tile_width*0.5, 0],
            [tile_width*1.5, -tile_width*0.5, 0],
            [tile_width*0.5, -tile_width*1.5, 0],
            [tile_width*1.5, -tile_width*1.5, 0] ]) {
    translate(p) knot_tile_boundary(tile_width, tile_height);
  }
}

module make_knot_piece(p, tile_width, tile_height, ribbon_width, gap) {
  rth = tile_height != undef ? tile_height : tile_width/2;
  rrw = ribbon_width != undef ? ribbon_width : tile_width/sqrt(2);
  rgap = gap != undef ? gap : tile_width/(6*sqrt(2));

  top_left     = [tile_width*0.5, -tile_width*0.5, 0];
  top_right    = [tile_width*1.5, -tile_width*0.5, 0];
  bottom_left  = [tile_width*0.5, -tile_width*1.5, 0];
  bottom_right = [tile_width*1.5, -tile_width*1.5, 0];

  translate(top_left)     knot_tile(p[0], tile_width, rth, rrw, rgap);
  translate(top_right)    knot_tile(p[1], tile_width, rth, rrw, rgap);
  translate(bottom_left)  knot_tile(p[2], tile_width, rth, rrw, rgap);
  translate(bottom_right) knot_tile(p[3], tile_width, rth, rrw, rgap);
}

module knot_tile_boundary(tile_width, tile_height) {
  translate([0, 0, 1.001*tile_height/2])
    cube([tile_width*1.001, tile_width*1.001, tile_height*1.001],
         center = true);
}

module cross(tile_width, tile_height, ribbon_width, gap) {
  gap2=gap*sqrt(2);

  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    difference() {
      union() {
        rotate([0,0,-45])
          cube([ribbon_width, tile_width*2, tile_height*2], center = true);
        translate([-tile_width/2, -tile_width/2, tile_height]) rotate([0,0,45])
          cube([ribbon_width, ribbon_width, tile_height], center = true);
      }
      translate([-tile_width/4+gap2/4, -tile_width/4+gap2/4, 0])
        rotate([0,0,-45])
          cube([tile_width*2, gap, tile_height*4], center = true);
    }
  }
}

module curve(tile_width = 5, tile_height, ribbon_width, gap) {

  cra=66;
  cr=.5*tile_width/cos(cra);

  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    union() {
      intersection() {
        translate([0,-tile_width/2*cos(cra),0])
        rotate([0,0,cra]) translate([cr*1.5,0,0]) cube(cr*3, center = true);
        translate([ tile_width/2,
                    (tile_width-ribbon_width)/2-(cr-ribbon_width/2), 0])
          rotate_extrude() {
            translate([cr-ribbon_width/2, 0, 0])
              square([ribbon_width, tile_height*2], center = true);
          }
      }
      difference() {
        rotate([0,0,-45])
          cube([ribbon_width,tile_width*2, tile_height*2], center = true);
        translate([0,-tile_width/2*cos(cra),0])
        rotate([0,0,cra]) translate([cr*1.5,0,0]) cube(cr*3, center = true);
      }
    }
  }
}

module cross_curve(tile_width = 5, tile_height, ribbon_width, gap) {
  gap2=gap*sqrt(2);

  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    difference() {
      curve(tile_width, tile_height, ribbon_width);
      translate([-tile_width/4+gap2/4, -tile_width/4+gap2/4, 0])
        rotate([0,0,-45])
          cube([tile_width*2, gap, tile_height*3], center = true);
    }
  }
}

module round_corner(tile_width = 5, tile_height, ribbon_width, gap) {
  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    translate([-tile_width/2, -tile_width/2, 0]) rotate_extrude()
      translate([tile_width-ribbon_width/2, 0, 0])
        square([ribbon_width, tile_height*2], center = true);
  }
}

module square_corner(tile_width = 5, tile_height, ribbon_width, gap) {
  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    union() {
      translate([(tile_width-ribbon_width)/2, 0, 0])
        cube([ribbon_width,tile_width*2, tile_height*2], center = true);
      translate([0, (tile_width-ribbon_width)/2, 0])
        cube([tile_width*2,ribbon_width, tile_height*2], center = true);
    }
  }
}

module straight(tile_width = 5, tile_height, ribbon_width, gap) {
  intersection() {
    knot_tile_boundary(tile_width, tile_height);
    translate([(tile_width-ribbon_width)/2, 0, 0])
      cube([ribbon_width,tile_width*2, tile_height*2], center = true);
  }
}

module invalid_tile(tile_width = 5, tile_height, ribbon_width) {
  #cube([tile_width, tile_width, tile_height], center = true);
}
