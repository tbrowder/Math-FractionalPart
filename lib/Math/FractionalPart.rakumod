unit module Math::FractionalPart:ver<0.0.5>:auth<cpan:TBROWDER>;

class Math::FractionalPart is Num is export {

    method modf($places? --> List) { modf self, $places }

    method fractional { fractional self }
    method frac { fractional self }

    method fractional-abs { fractional-abs self }
    method afrac { fractional-abs self }

    method fractional-wolfram { fractional-wolfram self }
    method ofrac { fractional-wolfram self }

    method decimal-places($digits?) {
        decimal-places self, $digits
    }
    method frac-part-digits($digits?) {
        decimal-places self, $digits
    }
    method ndp($digits?) {
        decimal-places self, $digits
    }
}

our &ndp is export(:ndp) = &decimal-places;
our &frac-part-digits is export(:frac-part-digits) = &decimal-places;
multi sub decimal-places($x is copy, $digits?) is export(:decimal-places) {
    $x = convert2decimal $x;

    =begin comment
    # the number may be a Rat or FatRat
    $x .= Real;
    # the number may be in exponent form
    if $x ~~ /:i e / {
        $x .= lc;
        # convert the 'e' notation to a complete decimal
        # e.g., 5.645e-10 ==> 13 decimal places
        #       sprintf '%.13f', $num
        my $idx = $x.index: 'e';
        if $idx.defined {
            my $number   = substr $x, 0, $idx-1;
            my $exponent = substr $x, $idx+1;
            my $nplaces = 0;
            if $exponent < 0 {
                $nplaces += $exponent.abs;
            }
            $idx = $number.index: '.';
            if $idx.defined {
                my $decimals = substr $x, $idx+1;
                $nplaces += $exponent.abs;
            }
            if $nplaces {
                $x = sprintf '%.*f', $nplaces, $x;
            }
            else {
                $x = sprintf '%f', $x;
            }
        }
        else {
            die "FATAL: Unexpected number format '$x' with no embedded 'e'; please report this issue":
        }
    }
    =end comment

    if $digits {
        $x = $x.base(10, $digits);
    }

    # trim zeroes from the right end for decimals
    if $x.index('.').defined {
        while $x ~~ /0$/ {
            $x ~~ s/0$//;
        }
    }

    # removing leading chars and the radix point if any
    my $idx = $x.index: '.';
    if $idx.defined {
        $x = substr $x, $idx+1;
        return $x.chars;
    }
    # there are no decimal places
    0
} # sub decimal-places

sub convert2decimal($x is copy --> Str) is export(:convert2decimal) {
    # convert the number to decimal format
    # special cases:
    #   all zero values are converted to the integer '0'
    #   values without a fractional part are converted to integers.

    # the number may be a Rat or FatRat
    $x .= Real;

    my $sign = $x.sign;
    $x .= abs;
    $x .= Str;

    # the number may be in exponent form
    if $x ~~ /:i e / {
        $x .= lc;
        # convert the 'e' notation to a complete decimal
        # e.g., 5.645e-10 ==> 13 decimal places
        #       sprintf '%.13f', $num
        # e.g., 1.5e0 ==> 1 decimal place
        #       sprintf '%.1f', $num
        my $idx = $x.index: 'e';
        if $idx.defined {
            my $number   = substr $x, 0, $idx;
            my $exponent = substr $x, $idx+1;
            my $nplaces = 0;
            if $exponent < 0 {
                $nplaces += $exponent.abs;
            }

            $idx = $number.index: '.';
            if $idx.defined {
                my $decimals = substr $x, $idx+1;
                $nplaces += $decimals.chars;
            }

            if $nplaces {
                $x = sprintf '%.*f', $nplaces, $x;
            }
        }
        else {
            die "FATAL: Unexpected number format '$x' with no embedded 'e'; please report this issue":
        }
    }
    elsif $x !~~ /'.'/ {
        ; # ok as is # $x ~= '.0';
    }

    if $x ~~ /'.'/ {
        # trim trailing zeroes
        while $x ~~ /0$/ {
            $x ~~ s/0$//;
        }
        # trim trailing decimal point
        $x ~~ s/'.'$//;
    }

    if $x == 0 {
        $x = '0';
    }
    elsif $sign == -1 {
        $x = "-$x";
    }
    $x;
} # sub convert2decimal

# using notation from Wikipedia:
our &frac is export(:frac) = &fractional;
multi sub fractional($x) is export(:fractional) {
    $x - floor($x)
} # sub fractional

our &afrac is export(:afrac) = &fractional-abs;
multi sub fractional-abs($x) is export(:fractional-abs) {
    abs($x) - floor(abs($x))
} # sub fractional-abs

our &ofrac is export(:ofrac) = &fractional-wolfram;
multi sub fractional-wolfram($x) is export(:fractional-wolfram) {
    $x - floor(abs($x)) * sign($x)
} # sub fractional-wolfram

# complex versions
# Note that Ref. 3 shows I<frac> operating in the I<complex plane> as C<frac(x + i y) = frac(x) + i frac(y)>.
multi sub fractional(Complex $x --> Complex) is export(:fractional) {
    my $re = $x.re - floor($x.re);
    my $im = $x.im - floor($x.im);
    Complex.new($re, $im)
} # sub fractional

multi sub fractional-abs(Complex $x --> Complex) is export(:fractional-abs) {
    my $re = abs($x.re) - floor(abs($x.re));
    my $im = abs($x.im) - floor(abs($x.im));
    Complex.new($re, $im)
} # sub fractional-abs

multi sub fractional-wolfram(Complex $x --> Complex) is export(:fractional-wolfram) {
    my $re = $x.re - floor(abs($x.re)) * sign($x.re);
    my $im = $x.im - floor(abs($x.im)) * sign($x.im);
    Complex.new($re, $im)
} # sub fractional-wolfram

sub modf($x is copy, $places? --> List) is export(:modf) {
    # returns the integer and fractional parts of x
    # special cases:
    #   the real part will be an integer
    #   the fractional part will be a decimal with leading '0.'
    #   zero values are '0' and are unsigned
    #   both parts take the sign of x unless they are zero
    $x .= Real;

    my $sign = $x.sign;
    $x .= abs; # now signless

    # operate on absolute parts
    my $int  = $x.Int;
    my $frac = $x - $int;

    # restore original sign
    $int  *= $sign;
    $frac *= $sign;
    $int  = 0 if $int  == 0;
    $frac = 0 if $frac == 0;

    if $places.defined and $places > 0 {
        $frac = sprintf '%.*f', $places, $frac;
    }

    $int, $frac

} # sub modf
