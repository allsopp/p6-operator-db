# p6-operator-db

[![test](https://github.com/allsopp/p6-operator-db/actions/workflows/test.yml/badge.svg)](https://github.com/allsopp/p6-operator-db/actions/workflows/test.yml)

## Synopsis

`Operator::dB` is a [Raku](https://raku.org/) operator to support decibel (dB)
arithmetic.

    $ zef install Operator::dB
    $ raku -M Operator::dB
    > 100 + 30dB
    100000
    > 100 - 30dB
    0.1
    > put 10dB + 20dB
    20.413927dB

The interface tries to be intuitive while avoiding ambiguity. For example,

    > 10 + 20dB
    1000

makes sense because adding `20dB` is multiplying by `10^2`, but,

    > 20dB + 10 # DOESN'T WORK!

doesn't, because it ambiguously represents both of the following:

- `30.0dB` i.e. `(20 + 10)dB`
- `20.4dB` i.e. `20dB + 10dB`

All the examples in this README were obtained using the Raku REPL. Please note,
to use the REPL with custom operators like this one, you'll need Raku 2025.03
or later because of [this bug](https://github.com/rakudo/rakudo/issues/2245) in
prior versions.

## Installation

To install the latest version, run:

    $ zef install Operator::dB

## Operations

### Addition and subtraction on numbers

Adding or subtracting decibel values to and from numbers (of `Numeric` type)
scales the number by the corresponding decibel gain:

    > 1 + 40dB
    10000
    > 1 - 40dB
    0.0001

### Addition and subtraction on decibels

Decibels can be added to, or subtracted from, each other.

This type of operation returns an `Operator::dB::Decibel` wrapper object:

    > my $foo = 3dB + 2dB - 1dB
    Operator::dB::Decibel.new(x => 10, y => 0.36571819272302736e0)

and you can get the decibel value itself with `.dB`:

    > $foo.dB
    3.6571819272302735

or by stringification:

    > "The gain is: $foo"
    The gain is 3.657182dB

or by defining your own format with `.fmt`:

    > $foo.fmt("%.1f dB(A)")
    3.7 dB(A)

## Caveats

This package exports overloads to built-in operators, which is potentially
reckless. But the operator signatures all contain at least one
`Operator::dB::Decibel` object -- which is not built-in -- so it _should_ be
fine!

The `Num` method is not implemented on the wrapper class, so many built-in
numerical operations don't work, e.g. `1dB * 1`. This is a necessary limitation
because decibel arithmetic is only semantically valid for addition and
subtraction as far as the author is aware.

## See also

- [Operators in Raku](https://docs.raku.org/language/operators)
- [Creating operators in Raku](https://docs.raku.org/language/optut)
