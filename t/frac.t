use v6;
use Test;

use Math::FractionalPart;

# L<S32::Numeric/Real/"=item frac">

# Basic tests for the fractionl functions

my %n; # see values in BEGIN block at the end
my @f = &frac, &afrac, &ofrac;

#plan 159;

for @f {
    my $fn = $_.name;
    is $_(Inf), NaN, "is f(Inf) = NaN for function $fn";
    is $_(-Inf), NaN, "is f(-Inf) = NaN for function $fn";
    is $_(NaN), NaN, "is f(NaN) = NaN for function $fn";
}

for %n.kv -> $tgt is copy, $exp {
    is $tgt.frac, $exp, "$tgt.frac";
    is frac($tgt), $exp, "frac($tgt)";
    is (frac $tgt), $exp, "(frac $tgt)";
    isa-ok $tgt.frac, Real, "$tgt.frac is type Real";
    isa-ok frac($tgt), Real, "frac($tgt) is type Real";
    isa-ok (frac $tgt), Real, "(frac $tgt) is type Real";

    $tgt .= abs;
    is $tgt.frac, $exp, "$tgt.frac";
    is frac($tgt), $exp, "frac($tgt)";
    is (frac $tgt), $exp, "(frac $tgt)";
    isa-ok $tgt.frac, Real, "$tgt.frac is type Real";
    isa-ok frac($tgt), Real, "frac($tgt) is type Real";
    isa-ok (frac $tgt), Real, "(frac $tgt) is type Real";
}




BEGIN {
    %n =
    '-100' => 0,
    '-5.9' => 0.9,
    '-5.499' => 0.499,
    '-2' => 0,
    '-3/2' => 0.5,
    '-1.5e0' => 0.5,
    '-1.4999' => 0.4999,
    '-1.23456' => 0.23456,
    '-1' => 0,
    '-0.5' => 0.5,
    '-0.499' => 0.499,
    '-0.1' => 0.1,
    '0' => 0,
    ;
}


# vim: expandtab shiftwidth=4
