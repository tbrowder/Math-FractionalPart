[![Actions Status](https://github.com/tbrowder/Math-FractionalPart/workflows/test/badge.svg)](https://github.com/tbrowder/Math-FractionalPart/actions)

Math::FractionalPart
====================

This *Raku* module provides several routines to operate with the fractional parts of a number. The `*frac` routines also operate on complex numbers.

SYNOPSIS
========

```raku
use Math::FractionalPart :afrac;
say (afrac -3.2); # Output <<0.2>>
say (frac -3.2);  # Output <<-0.2>>
```

DESCRIPTION
===========

Frac functions
--------------

There are three different algebraic functions that operate on numbers and return their fractional parts. They all return the same result when operating on non-negative numbers, but all three return different results when operating on negative numbers. See the [References](#References) for more details. Note that Ref. 2 shows *frac* operating in the *complex plane* as `frac(x + i y) = frac(x) + i frac(y)`.

The following table shows the routines that have been implemented in this module.

<table class="pod-table">
<thead><tr>
<th>Name</th> <th>Raku formula</th> <th>Example</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>frac</td> <td>x - &#x230a;x&#x230b;</td> <td>frac(-1.3): 0.7</td> <td>1</td> </tr> <tr> <td>afrac</td> <td>|x| - &#x230a;|x|&#x230b;</td> <td>afrac(-1.3): 0.3</td> <td>2</td> </tr> <tr> <td>ofrac</td> <td>x - &#x230a;|x|&#x230b;&#x22c5;sign(x)</td> <td>ofrac(-1.3): -0.3</td> <td>3</td> </tr>
</tbody>
</table>

Other functions
---------------

Sometimes it is useful to know the number of digits in the fractional part of a number. For example, in creating tests for operations on numbers, one must often compare results of operations on real numbers when being able to compare to the same numbers of decimal places is required.

Such a function is `frac-part-digits`, with alias names of `decimal-places` and `ndp`. The functions return the number of decimal digits to the right of the decimal point for a real number.

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

Tom Browder <tbrowder@cpan.org>

COPYRIGHT AND LICENSE
=====================

?? 2021 Tom Browder

This library is free software; you can redistribute it or modify it under the Artistic License 2.0.

