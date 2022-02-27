use v6;
use Test;
use lib <lib>;

plan 1;

if ?%*ENV<TEST_META> {
	require Test::META <&meta-ok>;
	meta-ok;
	done-testing;
}
else {
	skip-rest "Test::META";
	exit;
}
