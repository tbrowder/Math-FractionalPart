use Test;


use Math::FractionalPart :ALL;

# more tests for the number of decimal digits

my $debug = 0;
my %n; # see values in BEGIN block at the end

# the method and its aliases to be tested:
my @m = <frac-part-digits decimal-places ndp>;

plan 84;

VALUE: for %n.kv -> $val is copy, $ndecs {

    # check the negative values
    my Math::FractionalPart $m .= new($val);

    for @m -> $me {
        my $got = ($m)."$me"();
        is $got, $ndecs, "is ($val).$me = $ndecs for method $me";
    }

    # check the positive values

    $val .= abs;

    my Math::FractionalPart $m2 .= new($val);

    for @m {
        my $me = $_;
        my $got = $m2."$me"();
        is $got, $ndecs, "is ($val).$_ = $ndecs for method $me";
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
