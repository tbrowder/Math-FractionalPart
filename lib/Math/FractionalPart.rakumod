unit class Math::FractionalPart:ver<0.0.3>:auth<cpan:TBROWDER>;

method frac($x) {
    self.frac
}

method afrac($x) {
    self.afrac
}

method ofrac($x) {
    self.ofrac
}

# using notation from Wikipedia:
multi sub frac($x) is export(:frac) {
    $x - floor($x)
}
multi sub afrac($x) is export(:afrac) {
    abs($x) - floor(abs($x))
}
multi sub ofrac($x) is export(:ofrac) {
    $x - floor(abs($x)) * sign($x)
}

# complex versions
# Note that Ref. 3 shows I<frac> operating in the I<complex plane> as C<frac(x + i y) = frac(x) + i frac(y)>.
multi sub frac(Complex $x --> Complex) is export(:frac) {
    my $re = $x.re - floor($x.re);
    my $im = $x.im - floor($x.im);
    Complex.new($re, $im)
}
multi sub afrac(Complex $x --> Complex) is export(:afrac) {
    my $re = abs($x.re) - floor(abs($x.re));
    my $im = abs($x.im) - floor(abs($x.im));
    Complex.new($re, $im)
}
multi sub ofrac(Complex $x --> Complex) is export(:ofrac) {
    my $re = $x.re - floor(abs($x.re)) * sign($x.re);
    my $im = $x.im - floor(abs($x.im)) * sign($x.im);
    Complex.new($re, $im)
}



