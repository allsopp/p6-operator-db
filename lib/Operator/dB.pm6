unit package Operator::dB;

my class Decibel {
	has Int     $.x = 10;
	has Numeric $.y;

	method Str { ($.y * 10).fmt: "%fdB" }
	method fmt (Str $template) { $.dB.fmt: $template }

	method dB { 10 * $.y }
	method antilog { $.x ** $.y }

	method logish ( WhateverCode $code, Decibel $b ) {
		my $sum =
		    reduce $code,
		    map *.antilog,
		    (self, $b);

		return self.new: y => log10( $sum );
	}
}

multi sub infix:<+>
    (Decibel $a, Decibel $b --> Decibel)
    is export
    { $a.logish(* + *, $b) }

multi sub infix:<->
    (Decibel $a, Decibel $b --> Decibel)
    is export
    { $a.logish(* - *, $b) }

multi sub infix:<+>
    (Numeric $a, Decibel $b --> Numeric)
    is export
    { $a * $b.antilog }

multi sub infix:<->
    (Numeric $a, Decibel $b --> Numeric)
    is export
    { $a / $b.antilog }

multi sub postfix:<dB>
    (Numeric $val --> Decibel)
    is export
    { Decibel.new: y => $val/10 }
