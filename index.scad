// random generator, to generate always the same output for the example,
// this uses a seed for rands() and stores the array of random values in
// the random variable. To generate different output, remove the seed or
// replace the function rnd() to just call rands(s, e, 1)[0].
rcnt = 1000;
random = rands(0, 1, rcnt, 18);
function rnd(s, e, r) = random[r % rcnt] * (e - s) + s;

// generate 4x4 translation matrix
function mt(x, y) = [ [ 1, 0, 0, x ], [ 0, 1, 0, y ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

// generate 4x4 rotation matrix around Z axis
function mr(a) = [ [ cos(a), -sin(a), 0, 0 ], [ sin(a), cos(a), 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

module tree(length, thickness, count, m = identity, r = 1) {
    color([0, 1 - (0.8 / levels * count), 0])
        multmatrix(m)
            square([thickness, length]);

    if (count > 0) {
        tree(rnd(0.6, 0.8, r) * length, 0.8 * thickness, count - 1, m * mt(0, length) * mr(rnd(20, 35, r + 1)), 8 * r);
        tree(rnd(0.6, 0.8, r + 1) * length, 0.8 * thickness, count - 1, m * mt(0, length) * mr(-rnd(20, 35, r + 3)), 8 * r + 4);
    }
}
