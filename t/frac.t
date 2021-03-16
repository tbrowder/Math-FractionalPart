use v6;
use Test;

use Math::FractionalPart;

# L<S32::Numeric/Real/"=item frac">

# Basic tests for the fractionl functions

my $debug = 0;
my @n; # see values in BEGIN block at the end
# the three functions to be tested:
my @f = &frac, &afrac, &ofrac;

plan 555;

for @f {
    my $fn = $_.name;
    is $_(Inf), NaN, "is f(Inf) = NaN for function $fn";
    is $_(-Inf), NaN, "is f(-Inf) = NaN for function $fn";
    is $_(NaN), NaN, "is f(NaN) = NaN for function $fn";
}


# Note that Ref. 3 shows I<frac> operating in the I<complex plane> as C<frac(x + i y) = frac(x) + i frac(y)>.
for @n -> $tgt is copy {
    # complex version
    my Complex $c = Complex.new($tgt.Real, $tgt.Real);
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

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
             
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

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
        }
        when $fn eq 'ofrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.abs.floor * $tgt.sign);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
        }
    }

    # check the positive values

    $tgt .= abs;
    $c = Complex.new($tgt.Real, $tgt.Real);

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

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
        }
        when $fn eq 'afrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt.abs - $tgt.abs.floor);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
        }
        when $fn eq 'ofrac' {
            note "DEBUG: fn = '$fn'" if $debug;
            $exp = ($tgt - $tgt.abs.floor * $tgt.sign);
            is $_($tgt), $exp, "is f($tgt) = $exp for function $fn";
            is ($tgt).$_, $exp, "is ($tgt).$fn = $exp for function $fn";
            isa-ok $_($tgt), Real, "isa-ok f($tgt), Real for function $fn";
            isa-ok ($tgt).$_, Real, "isa-ok ($tgt).$fn, Real for function $fn";

            # test complex version
            my $cc = $_($c);
            is-approx $cc.re, $exp, "is f($tgt).re = $exp for function $fn on Complex number";
            is-approx $cc.im, $exp, "is f($tgt).im = $exp for function $fn on Complex number";
            isa-ok $cc, Complex, "isa-ok f($tgt), Complex for function $fn";
        }
    }

    #last;
}

BEGIN {
    @n =
    '-100',
    '-5.9',
    '-5.499',
    '-2',
    '-3/2',
    '-1.5e0',
    '-1.4999',
    '-1.23456',
    '-1',
    '-0.5',
    '-0.499',
    '-0.1',
    '0',
    ;
}


# vim: expandtab shiftwidth=4
