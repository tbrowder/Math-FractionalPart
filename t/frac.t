use v6;
use Test;

use Math::FractionalPart;

# L<S32::Numeric/Real/"=item frac">

# Basic tests for the fractionl functions

my $debug = 0;
my %n; # see values in BEGIN block at the end
# the three functions to be tested:
my @f = &frac, &afrac, &ofrac;

#plan 159;

for @f {
    my $fn = $_.name;
    is $_(Inf), NaN, "is f(Inf) = NaN for function $fn";
    is $_(-Inf), NaN, "is f(-Inf) = NaN for function $fn";
    is $_(NaN), NaN, "is f(NaN) = NaN for function $fn";
}


for %n.keys.sort -> $tgt is copy {
    for @f {
        my $fn = $_.name;
        my $exp;
        when $fn eq 'frac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.floor);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
            =begin comment
            # TODO: get this syntax correct:
            is ($_ $tgt), $exp, "is ($fn $tgt) = $exp for function $fn";
            isa-ok ($_ $tgt), Real, "($fn $tgt), Real for function $fn";
            =end comment
        }
        when $fn eq 'afrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt.abs - $tgt.abs.floor);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
        }
        when $fn eq 'ofrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.abs.floor * $tgt.sign);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
        }
    }

    # check the positive values

    $tgt .= abs;

    for @f {
        my $fn = $_.name;
        my $exp;
        when $fn eq 'frac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.floor);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
            =begin comment
            # TODO: get this syntax correct:
            is ($_ $tgt), $exp, "is ($fn $tgt) = $exp for function $fn";
            isa-ok ($_ $tgt), Real, "($fn $tgt), Real for function $fn";
            =end comment
        }
        when $fn eq 'afrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt.abs - $tgt.abs.floor);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
        }
        when $fn eq 'ofrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.abs.floor * $tgt.sign);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";
        }
    }

    #last;
}

done-testing;

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
