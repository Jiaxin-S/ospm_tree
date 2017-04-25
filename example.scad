include <index.scad>

// Recursive calls of modules can generate complex geometry, especially
// fractal style objects.
// The example uses a recursive module to generate a random tree as
// described in http://natureofcode.com/book/chapter-8-fractals/

levels = 10; // number of levels for the recursion

len = 100; // length of the first segment
thickness = 5; // thickness of the first segment

// the identity matrix
identity = [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

tree(len, thickness, levels);
