use v6;
use Test;
use lib <lib>;

use Operator::dB;

plan 23;

# addition/subtraction on dB
is-approx (1dB + 1dB).y, .401, "1dB + 1dB", :rel-tol<.001>;
is-approx (1dB + 2dB).y, .454, "1dB + 2dB", :rel-tol<.001>;
is-approx (1dB + 3dB).y, .512, "1dB + 3dB", :rel-tol<.001>;
is-approx (10dB + 10dB).y, 1.30, "10dB + 10dB", :rel-tol<.01>;
is-approx (10dB + 20dB).y, 2.04, "10dB + 20dB", :rel-tol<.01>;
is-approx (10dB + 30dB).y, 3.00, "10dB + 20dB", :rel-tol<.01>;
is-approx (10dB - 3dB).y, .903, "10dB - 3dB", :rel-tol<.001>;
is-approx (10dB - 2dB).y, .925, "10dB - 2dB", :rel-tol<.001>;
is-approx (10dB - 1dB).y, .942, "10dB - 1dB", :rel-tol<.001>;

# adding dB to absolute values
is-approx 10 + 3dB, 19.95, "10 + 3dB", :rel-tol<.001>;
is-approx 10 + 6dB, 39.81, "10 + 6dB", :rel-tol<.001>;
is-approx 10 + 10dB, 100, "10 + 10dB", :rel-tol<.001>;
is-approx 10 + 20dB, 1_000, "10 + 20dB", :rel-tol<.001>;
is-approx 10 + 30dB, 10_000, "10 + 30dB", :rel-tol<.001>;
is-approx 10 + 40dB, 100_000, "10 + 40dB", :rel-tol<.001>;
is-approx 10 + 50dB, 1_000_000, "10 + 50dB", :rel-tol<.001>;

# subtracting dB from absolute values
is-approx 10 - 3dB, 5.012, "10 - 3dB", :rel-tol<.001>;
is-approx 10 - 6dB, 2.512, "10 - 6dB", :rel-tol<.001>;
is-approx 10 - 10dB, 1, "10 + 10dB", :rel-tol<.001>;
is-approx 10 - 20dB, .1, "10 + 20dB", :rel-tol<.001>;
is-approx 10 - 30dB, .01, "10 + 30dB", :rel-tol<.001>;
is-approx 10 - 40dB, .001, "10 + 40dB", :rel-tol<.001>;
is-approx 10 - 50dB, .0001, "10 + 50dB", :rel-tol<.0001>;
