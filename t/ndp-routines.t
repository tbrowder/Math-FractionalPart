use Test;

use Math::FractionalPart :ALL;

# Basic tests for the number of decimal digits

my $debug = 0;
my %n; # see values in BEGIN block at the end

# the function and its aliases to be tested:
my @f = &frac-part-digits, &decimal-places, &ndp;

plan 168;

for %n.kv -> $tgt is copy, $exp {

    # check the negative values

    for @f {
        my $fn = $_.name;
        is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
        isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
    }

    # check the positive values

    $tgt .= abs;

    for @f {
        my $fn = $_.name;
        is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
        isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
    }
}

BEGIN {
    %n =
    '-100'     => 0,
    '-5.9'     => 1,
    '-5.499'   => 3,
    '-2'       => 0,
    '-3/2'     => 1,
    '-1.5e0'   => 1,
    '-1.4999'  => 4,
    '-1.23456' => 5,
    '-1'       => 0,
    '-0.5'     => 1,
    '-0.499'   => 3,
    '-0.1'     => 1,
    '0'        => 0,
    '-1.5e-10' => 11, # -0.00000000015
    ;
}


# vim: expandtab shiftwidth=4
