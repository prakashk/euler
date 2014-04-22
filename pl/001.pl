#!/usr/bin/perl

# Project Euler - Problem 1
# Find the sum of all the multiples of 3 or 5 below 1000.

use 5.10.0;

my $sum = 0;
$sum += $_ % 3 && $_ % 5 ? 0 : $_
    for 3 .. 999;
say $sum;
