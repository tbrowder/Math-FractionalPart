[![Actions Status](https://github.com/tbrowder/Math-FractionalPart/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Math-FractionalPart/actions) [![Actions Status](https://github.com/tbrowder/Math-FractionalPart/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Math-FractionalPart/actions) [![Actions Status](https://github.com/tbrowder/Math-FractionalPart/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Math-FractionalPart/actions)

Math::FractionalPart
====================

This *Raku* module provides several routines to operate with the integral and fractional parts of a decimal number. The `*frac*` routines also operate on complex numbers.

SYNOPSIS
========

```raku
use Math::FractionalPart :ALL;
say modf(3.2);            # OUTPUT: «3 0.2␤»
say modf(-3.2);           # OUTPUT: «-3 -0.2␤»
say fractional(-3.2);     # OUTPUT: «-0.2␤»
say fractional-abs(-3.2); # OUTPUT: «0.2␤»
```

DESCRIPTION
===========

Fractional routines
-------------------

### modf

```raku
sub modf($x is copy --> List) is export(:modf) {...}
=begin code

The c<modf> routine (currently not available in the I<Raku> core) is
similar to those in other languages including I<C>, I<C++>, I<Python>,
and I<Haskell>. It coerces its input into a base 10 number and returns
the integral and fractional parts in a list as shown below. (Note the
C<modf> routine hss been submitted as a PR for the Raku core and may
be part of the language soon.)

=begin code :lang<raku>
say modf(3.24);  # OUTPUT: «3 0.24␤»
say modf(-2.7);  # OUTPUT: «-2 -0.7␤»
say modf(10);    # OUTPUT: «10 0␤»
say modf(0x10);  # OUTPUT: «16 0␤»
say modf(-0o10); # OUTPUT: «-8 0␤»
```

Note the sign of the input value is applied to both parts, unless the part is zero. As expected, the fractional part of an integer will be zero.

### fractional

If the user is only interested in the fractional part of a number, there are three different algebraic routines that operate on numbers and return their fractional parts. They all return the same result when operating on non-negative numbers, but all three return different results when operating on negative numbers. See the [References](#References) for more details. Note that Ref. 2 shows *frac* operating in the *complex plane* as `frac(x + i y) = frac(x) + i frac(y)`.

The following table shows the routines (along with their aliase) that have been implemented in this module.

<table class="pod-table">
<thead><tr>
<th>Name</th> <th>Raku formula</th> <th>Example</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>fractional</td> <td>x - &#x230a;x&#x230b;</td> <td>frac(-1.3): 0.7</td> <td>1</td> </tr> <tr> <td>fractional-abs</td> <td>|x| - &#x230a;|x|&#x230b;</td> <td>afrac(-1.3): 0.3</td> <td>2</td> </tr> <tr> <td>fractional-wolfram</td> <td>x - &#x230a;|x|&#x230b;&#x22c5;sign(x)</td> <td>ofrac(-1.3): -0.3</td> <td>3</td> </tr>
</tbody>
</table>

Other exported functions
------------------------

### convert2decimal

```raku
say convert2decimal(1.5e-3);    # OUTPUT: «0.0015␤»
say convert2decimal(1.5e-3, 5); # OUTPUT: «0.000015␤»
say convert2decimal(0xa);       # OUTPUT: «10␤»
```

A routine to aid processing numerical data, this routine converts numbers into a decimal format. The user may choose the precision of the output by adding the desired number of places as a second argument.

Aliases: `convert`, `to-decimal`, and `decimal`.

### decimal-places

```raku
say decimal-places(3.24); # OUTPUT: «2␤»
```

Sometimes it is useful to know the number of digits in the fractional part of a number. For example, in creating tests for operations on numbers, one must often compare results of operations on real numbers when being able to compare to the same numbers of decimal places is required.

Such a function is `decimal-places`, with alias names of `ndp` and `frac-part-digits`. The functions return the number of decimal digits to the right of the decimal point for a real number.

Notes
=====

1. See Ref. 1, *frac* version 1 (per Graham, Knuth, et alii, 1992).

2. See Ref. 1, *frac* version 2 (per Dainith, 2004); Ref. 3, p. 7. Consider mnemonic 'a' for 'absolute value' or 'astronomical'.

3. See Ref. 1, *frac* version 3 (an *odd function*); Ref. 2: Wolfram's *FractionPart* function. Consider mnemonic 'o' for 'odd function'.

References
==========

1. Wikipedia article on [Fractional Part](https://en.m.wikipedia.org/wiki/Fractional_part).

2. Wolfram article on [Fractional Part](https://mathworld.wolfram.com/FractionalPart.html).

3. *Celestial Calculations: A Gentle Introduction to Computational Astronomy*, J. L. Lawrence, 2018, MIT Press.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2021-2023 Tom Browder

This library is free software; you can redistribute it or modify it under the Artistic License 2.0.

