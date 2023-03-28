#!/usr/bin/env raku

use lib <../lib>;
use Math::FractionalPart :ALL;

my $x = Math::FractionalPart.new: 4.5;

say $x.frac;
say $x.afrac;
say $x.ofrac;

say $x.ndp;
my $a = Math::FractionalPart.new: -8.000_000_000_7;
my $b = Math::FractionalPart.new: -4.700e-10; # 11 decimal places
say $a;
say $a.ndp;
say $b;
say $b.ndp;


