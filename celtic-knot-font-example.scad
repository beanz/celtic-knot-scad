use <Write.scad>

font_file = "celtic-knot-tiles.dxf";
horizontal_space = 7.4;
radius = 90;

writecylinder("rqrqrqrqrqrqrqrqrqrqrqrqrqrq",
              where = [0,0,0], radius = radius, height = 60,
              font = font_file, space = horizontal_space);
writecylinder("tYtYtYtYtYtYtYtYtYtYtYtYtYtY",
              where = [0,0,0], radius = radius, height = 20,
              font = font_file, space = horizontal_space);
writecylinder("GhGhGhGhGhGhGhGhGhGhGhGhGhGh",
              where = [0,0,0], radius = radius, height = -20,
              font = font_file, space = horizontal_space);
writecylinder("sdsdsdsdsdsdsdsdsdsdsdsdsdsd",
              where = [0,0,0], radius = radius, height = -60,
              font = font_file, space = horizontal_space);
