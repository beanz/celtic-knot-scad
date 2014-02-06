#!/usr/bin/perl
#
# A Celtic Knot font for the openscad Write.scad library
#
# Copyright 2014 Mark Hindess
#
# This work is licensed under a Creative Commons
# Attribution-ShareAlike 4.0 International License.

# perl celtic-knot-font-tiles.pl > celtic-knot-font-tiles.svg
# # use inkscape to save a dxf copy
# inkscape --verb FileSaveACopy --verb FileRevert --verb FileClose \
#     celtic-knot-font-tiles.svg

use strict;
use warnings;
use SVG;

my $tile_width = 150;
my $ribbon_width = $tile_width/sqrt(2);
my $gap = $tile_width/(6*sqrt(2));
my $curve_segments = 20;

if ($curve_segments) {
  require Math::Bezier;
}

my $not_ribbon_width = $tile_width-$ribbon_width;
# http://en.wikipedia.org/wiki/File:Circle_and_cubic_bezier.svg
my $circle_control = 4*(sqrt(2)-1)/3;

my $svg = SVG->new(width => $tile_width, height => $tile_width,
                   ('xmlns:inkscape' =>
                    "http://www.inkscape.org/namespaces/inkscape"));

my $id = 1;

make_half_set($svg, ',.{}', \&round_corner, $tile_width, $ribbon_width, $gap);
make_half_set($svg, ['&lt;', '&gt;', '[', ']'], \&square_corner,
              $tile_width, $ribbon_width, $gap);
make_set($svg, 'qwasQWAS', \&curve, $tile_width, $ribbon_width, $gap);

make_set($svg, 'erdfERDF', \&cross_curve, $tile_width, $ribbon_width, $gap);
make_set($svg, 'tyghTYGH', \&cross, $tile_width, $ribbon_width, $gap);

make_half_set($svg, '|-_!', \&straight, $tile_width, $ribbon_width, $gap);

print $svg->xmlify(-nocredits  => 0);

sub make_half_set {
  my ($elt, $layers, $function, @args) = @_;
  $layers = [ split //, $layers] if (!ref $layers);
  $function->(rotate(layer($elt, $layers->[0]), -90), @args);
  $function->(layer($elt, $layers->[1]), @args);
  $function->(rotate(layer($elt, $layers->[2]), 180), @args);
  $function->(rotate(layer($elt, $layers->[3]), 90), @args);
}

sub make_set {
  my ($elt, $layers, $function, @args) = @_;
  $layers = [ split //, $layers] if (!ref $layers);

  $function->(layer($elt, $layers->[0]), @args);
  $function->(matrix(layer($elt, $layers->[1]), -1, 0, 0, 1, $tile_width, 0),
              @args);
  $function->(matrix(layer($elt, $layers->[2]), 1, 0, 0, -1, 0, $tile_width),
              @args);
  $function->(rotate(layer($elt, $layers->[3]), 180), @args);

  $function->(rotate(matrix(layer($elt, $layers->[4]),
                            1, 0, 0, -1, 0, $tile_width),
                     -90), @args);
  $function->(rotate(layer($elt, $layers->[5]), 90), @args);
  $function->(rotate(layer($elt, $layers->[6]), -90), @args);
  $function->(rotate(matrix(layer($elt, $layers->[7]),
                            -1, 0, 0, 1, $tile_width, 0),
                     -90), @args);
}

sub rotate {
  my ($elt, $deg) = @_;
  $elt->tag('g',
            'transform' => sprintf('rotate(%s %s %s)',
                                   $deg,
                                   $tile_width/2,
                                   $tile_width/2));
}

sub matrix  {
  my $elt = shift;
  $elt->tag('g','transform' => 'matrix('.(join ' ', @_).')');
}

sub layer {
  my ($elt, $name) = @_;
  $name .= '_' if ($name =~ /^[a-z]$/); # for Write.scad
  $elt->tag('g', 'inkscape:label' => $name, 'inkscape:groupmode' => 'layer',
            'id' => $name.$id++);
}

sub cross {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  my $g = $elt->tag('g', 'id' => 'cross'.$id++);
  $g->tag('path',
          id => 'cross_s'.$id++,
          style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
          d => ('M '.
                p(0,$tile_width).
                p(0,$tile_width-$ribbon_width/sqrt(2)).
                p($ribbon_width/sqrt(2), $tile_width).
                'z'));
  my $gap2 = $gap/sqrt(2);
  $g->tag('path',
          id => 'cross_b'.$id++,
          style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
          d => ('M '.
                p($tile_width,0).
                p($tile_width, $ribbon_width/sqrt(2)).
                p($ribbon_width/sqrt(2)+$gap2, $tile_width-$gap2).
                p(0+$gap2,$tile_width-$ribbon_width/sqrt(2)-$gap2).
                p($tile_width-$ribbon_width/sqrt(2),0).
                'z'));
}

sub curve {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  $elt->tag('path',
            id => 'curve'.$id++,
            style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
            d => ('M '.
                  p($tile_width,0).
                  p($tile_width,$ribbon_width).
                  bezier($tile_width,$ribbon_width,
                         ($tile_width-$not_ribbon_width*$circle_control,
                          $ribbon_width),
                         ($ribbon_width/sqrt(2)+$not_ribbon_width/2,
                          $tile_width-$not_ribbon_width/2),
                         $ribbon_width/sqrt(2), $tile_width).
                  'L '.p(0, $tile_width).
                  'L '.p(0, $tile_width-$ribbon_width/sqrt(2)).
                  bezier(0, $tile_width-$ribbon_width/sqrt(2),
                         ($ribbon_width/2,
                          $tile_width-$ribbon_width/sqrt(2)-$ribbon_width/2),
                         $tile_width*(1-$circle_control), 0,
                         $tile_width,0).
                  'z')
           );
}

sub cross_curve {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  my $g = $elt->tag('g', 'id' => 'cross'.$id++);
  $g->tag('path',
          id => 'cross_curve_s'.$id++,
          style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
          d => ('M '.
                p(0,$tile_width).
                p(0,$tile_width-$ribbon_width/sqrt(2)).
                p($ribbon_width/sqrt(2), $tile_width).
                'z'));
  my $gap2 = $gap/sqrt(2);
  $g->tag('path',
          id => 'cross_curve_b'.$id++,
          style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
          d => ('M '.
                p($tile_width,0).
                p($tile_width,$ribbon_width).
                bezier($tile_width,$ribbon_width,
                       ($tile_width-$not_ribbon_width*$circle_control,
                        $ribbon_width),
                       ($ribbon_width/sqrt(2)+$not_ribbon_width/2,
                        $tile_width-$not_ribbon_width/2),
                       ($ribbon_width/sqrt(2)+$gap2,
                        $tile_width-$gap2)).
                'L '.p($gap2,
                       $tile_width-$ribbon_width/sqrt(2)-$gap2).
                bezier($gap2, $tile_width-$ribbon_width/sqrt(2)-$gap2,
                       ($ribbon_width/2,
                        $tile_width-$ribbon_width/sqrt(2)-$ribbon_width/2),
                       ($tile_width*(1-$circle_control), 0),
                       ($tile_width,0)).
                  'z'));
}

sub round_corner {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  $elt->tag('path',
            id => 'round_corner'.$id++,
            style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
            d => ('M '.
                  p(0,0).
                  bezier(0,0,
                         $circle_control*$tile_width, 0,
                         $tile_width, $tile_width*(1-$circle_control),
                         $tile_width, $tile_width).
                  'L '.p($not_ribbon_width, $tile_width).
                  bezier($not_ribbon_width, $tile_width,
                         ($not_ribbon_width,
                          $tile_width-$not_ribbon_width*$circle_control),
                         $not_ribbon_width*$circle_control, $ribbon_width,
                         0, $ribbon_width).
                  'z'),
            );
}

sub square_corner {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  $elt->tag('path',
            id => 'square_corner'.$id++,
            style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
            d => ('M '.
                  p(0,0).
                  p($tile_width, 0).
                  p($tile_width, $tile_width).
                  p($not_ribbon_width, $tile_width).
                  p($not_ribbon_width, $ribbon_width).
                  p(0, $ribbon_width).
                  'z'),
            );
}

sub straight {
  my ($elt, $tile_width, $ribbon_width, $gap) = @_;
  $elt->tag('path',
            id => 'straigh'.$id++,
            style => 'color:#000000;fill:none;stroke:#000000;stroke-width:0.5',
            d => ('M '.
                  p(0,0).
                  p($tile_width, 0).
                  p($tile_width, $ribbon_width).
                  p(0,$ribbon_width).
                  'z'),
            );
}

sub p {
  $_[0].','.$_[1].' ';
}

sub bezier {
  my ($x1, $y1, $cx1, $cy1, $cx2, $cy2, $x2, $y2) = @_;
  if ($curve_segments) {
    my $bezier = Math::Bezier->new($x1, $y1, $cx1, $cy1, $cx2, $cy2, $x2, $y2);
    my @points = $bezier->curve($curve_segments);
    splice @points, 0, 2;
    my $s = 'L ';
    while (@points) {
      my ($x,$y) = splice @points, 0, 2;
      $s .= p($x,$y);
    }
    $s
  } else {
    'C '.p($cx1, $cy1).p($cx2,$cy2).p($x2, $y2);
  }
}
