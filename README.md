Celtic Knot Library for Openscad
================================

API is still in development and is likely to change
---------------------------------------------------

Feedback very welcome
---------------------

My son wanted a celtic knot bracelet.  This library was used to create
my first attempt.

The library provides two interfaces.  The first API uses large knot
parts (called pieces in the code) and looks like:

    knot([ "<~>",
           "!&;",
           "[-]" ], tile_width = 5);

where the first parameter is an kind of ASCII art for the desired
pattern and ```tile_width``` is the knot tile size.  The "alphabet" for
pieces is described in ```knot-piece-alphabet.scad```.  Each pieces is
a 2x2 square of smaller knot parts (called tiles in the code).
However, edge and corner pieces have some empty tiles.

The second API uses knot tiles and looks like:

    fine_knot([ "<rq>",
                "AtYF",
                "EGhW",
                "[sd]" ], tile_width = 5);

where the first parameter is an ASCII art for the desired pattern and
```tile_width``` is the knot tile size.

The "alphabet" for tiles is described in ```knot-tile-alphabet.scad```.

License
-------

This work is licensed under a Creative Commons Attribution-ShareAlike
4.0 International License.
