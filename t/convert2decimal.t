use Test;

use Math::FractionalPart :ALL;

# Basic tests for the convert2decimal routine

my %n2; # see values in BEGIN block at the end

plan 44;

for %n2.kv -> $val, $exp {
    # negative values
    my $got = convert2decimal $val;
    is $got, $exp;
}

for %n2.kv -> $val is copy, $exp is copy {
    # positive  values
    $val ~~ s/^'-'//;
    $exp ~~ s/^'-'//;
    my $x = convert2decimal $val;
    is $x, $exp;
}

BEGIN {
    %n2 =
    '-10'      => '-10',
    '-0x10'    => '-16',
    '-0o10'    => '-8',
    '-0xa'     => '-10',
    '-0o127'   => '-87',
    '-100'     => '-100',
    '-100.00'  => '-100',
    '-5.9'     => '-5.9', 
    '-5.499'   => '-5.499',
    '-2'       => '-2', 
    '-2.0'     => '-2', 
    '-3/2'     => '-1.5',
    '-1.5e0'   => '-1.5',
    '-1.4999'  => '-1.4999',
    '-1.23456' => '-1.23456',
    '-1'       => '-1', 
    '-1.0'     => '-1', 
    '-0.5'     => '-0.5',
    '-0.499'   => '-0.499',
    '-0.1'     => '-0.1',
    '-0'       => '0',
    '-1.5e-10' => '-0.00000000015', # -0.000_000_000_15
    ;
}

