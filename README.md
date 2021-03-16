[![Actions Status](https://github.com/tbrowder/Math-FractionalPart/workflows/test/badge.svg)](https://github.com/tbrowder/Math-FractionalPart/actions)

NAME
====

Math::FractionalPart provides several routines to operate with the fractional parts of a number. All routines also operate on complex numbers.

SYNOPSIS
========

```raku
use Math::FractionalPart :afrac;
say (afrac -3.2); # Output <<0.2>>
say (frac -3.2);  # Output <<-0.2>>
```

DESCRIPTION
===========

There are three different algebraic functions that operate on numbers and return their fractional parts. They all return the same result when operating on non-negative numbers, but all three return different results when operating on negative numbers. See the [REFERENCES](REFERENCES) for more details.

REFERENCES
==========

###### 1. Wikipedia article on [Fractional Part](https://en.m.wikipedia.org/wiki/Fractional_part)

###### 2. Wolfram article on [Fractional Part](https://mathworld.wolfram.com/FractionalPart.html)

###### 3. *Celestial Calculations: A Gentle Introduction to Computational Astronomy*, J. L. Lawrence, 2018, MIT Press.

Note that Ref. 3 shows *frac* operating in the *complex plane* as `frac(x + i y) = frac(x) + i frac(y)`.

The following table shows the routines that have been implemented in this module.

<table class="pod-table">
<thead><tr>
<th>Name</th> <th>Raku formul</th> <th>Example</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>frac</td> <td>x - floor(x)</td> <td>frac(-1.3): 0.7</td> <td>1</td> </tr> <tr> <td>afrac</td> <td>abs(x) - floor(abs(x))</td> <td>afrac(-1.3): 0.3</td> <td>2</td> </tr> <tr> <td>ofrac</td> <td>x - floor(abs(x)) * sign(x)</td> <td>ofrac(-1.3): -0.3</td> <td>3</td> </tr>
</tbody>
</table>

(NOTE: The table below will show incorrectly until `mi6` has the capability to implement more Unicode symbols.)

<table class="pod-table">
<thead><tr>
<th>Name</th> <th>Formula</th> <th>Example</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>frac</td> <td>x - E&lt;0x230a;&gt;xE&lt;0x230b&gt;</td> <td>frac(-1.3): 0.7</td> <td>1</td> </tr> <tr> <td>afrac</td> <td>|x| - E&lt;0x230a&gt;|x|E&lt;0x230b&gt;</td> <td>afrac(-1.3): 0.3</td> <td>2</td> </tr> <tr> <td>ofrac</td> <td>x - E&lt;0x230a&gt;|x|E&lt;0x230b&gt;E&lt;0x22c5&gt;sign(x)</td> <td>ofrac(-1.3): -0.3</td> <td>3</td> </tr>
</tbody>
</table>

##### Notes

###### 1. See Ref 1, *frac* version 1 (per Graham, Knuth, et alii, 1992).

###### 2. See Ref 1, *frac* version 2 (per Dainith, 2004); Ref 3, p. 7. Consider mnemonic 'a' for 'absolute value' or 'astronomical'.

###### 3. See Ref 1, *frac* version 3 (an *odd function*); Ref 2: Wolfram's *FractionPart* function. Consider mnemonic 'o' for 'odd function'.

AUTHOR
======

Tom Browder <tbrowder@cpan.org>

COPYRIGHT AND LICENSE
=====================

© 2021 Tom Browder

This library is free software; you can redistribute it or modify it under the Artistic License 2.0.

