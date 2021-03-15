unit class Math::FractionalPart:ver<0.0.1>:auth<cpan:TBROWDER>;

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
sub frac($x) is export {
    $x - floor($x)
}
sub afrac($x) is export {
    abs($x) - floor(abs($x))
}
sub ofrac($x) is export {
    $x - floor(abs($x)) * sign($x)
}



