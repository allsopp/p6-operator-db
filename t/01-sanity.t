use v6;
use Test;
use lib <lib>;

use Operator::dB;

plan 9;

# sanity tests
is 0 + 3dB, 0, "0 + 3dB";
is 0 - 3dB, 0, "0 - 3dB";
is 1 + 0dB, 1, "1 + 0dB";
is 1 - 0dB, 1, "1 - 0dB";
like 1dB, /^1 \. \d+ dB$/;
like (-1)dB, /^ \- 1 \. \d+ dB$/;
is 1dB.fmt("%d"), 1, ".fmt";
is (-1)dB.fmt("%d"), -1, ".fmt";
is 1dB.dB, 1, ".dB";
